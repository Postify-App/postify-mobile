import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:postify/core/cache/hive/hive_methods.dart';
import 'package:postify/core/enum/cubit_state/cubit_status.dart';
import 'package:postify/core/socket_helper/socket_client.dart';
import 'package:postify/core/socket_helper/socket_constants.dart';
import 'package:postify/features/posts/data/model/ai_prompt_response_model.dart';
import 'package:postify/features/posts/data/model/post_request_model.dart';

part 'generate_post_state.dart';

class GeneratePostCubit extends Cubit<GeneratePostState> {
  final String businessId;
  GeneratePostCubit(this.businessId) : super(const GeneratePostState()) {
    SocketClient.instance.init(businessId: businessId);
  }

  @override
  Future<void> close() {
    SocketClient.instance.disconnect();
    SocketClient.instance.unsubscribe(SocketEvents.botTyping);
    SocketClient.instance.unsubscribe(SocketEvents.botMessage);
    SocketClient.instance.unsubscribe(SocketEvents.ack);
    SocketClient.instance.unsubscribe(SocketEvents.error);
    return super.close();
  }

  void generatePost() {
    emit(state.copyWith(status: CubitStatus.loading));

    SocketClient.instance.emit(
      SocketEvents.generatePost,
      state.generateRequestBody?.toJson(),
    );

    SocketClient.instance.subscribe(SocketEvents.ack, (data) {
      log('Request acknowledged ');
    });

    SocketClient.instance.subscribe(SocketEvents.botTyping, (data) {
      emit(state.copyWith(status: CubitStatus.loading));
    });

    SocketClient.instance.subscribe(SocketEvents.botMessage, (data) {
      emit(
        state.copyWith(
          status: CubitStatus.success,
          aiPromptResponseModel: AiPromptResponseModel.fromJson(data),
        ),
      );
      //! LISTEN TO ERROR
      SocketClient.instance.subscribe(SocketEvents.error, (data) {
        emit(
          state.copyWith(
            status: CubitStatus.failure,
            errorMessage: data.toString(),
          ),
        );
      });
    });
  }

  //! PUBLISH POST DATA

  void publishPost() {
    emit(state.copyWith(publishPostStatus: CubitStatus.loading));
    SocketClient.instance.emit(SocketEvents.publishPost, {
      "access_token": HiveMethods.getAccessToken(),
    });
    SocketClient.instance.subscribe(SocketEvents.ack, (data) {
      emit(state.copyWith(publishPostStatus: CubitStatus.success));
    });

    SocketClient.instance.subscribe(SocketEvents.error, (data) {
      emit(
        state.copyWith(
          publishPostStatus: CubitStatus.failure,
          errorMessage: data.toString(),
        ),
      );
    });
  }

  //! GENERATE POST DATA

  void setApproximateWordCount(int wordCount) {
    final updatedBody =
        (state.generateRequestBody ?? const GenerateRequestBody()).copyWith(
          approximateWords: wordCount,
        );
    emit(state.copyWith(generateRequestBody: updatedBody));
  }

  void setMessage(String message) {
    final updatedBody =
        (state.generateRequestBody ?? const GenerateRequestBody()).copyWith(
          message: message,
        );
    emit(state.copyWith(generateRequestBody: updatedBody));
    log(state.generateRequestBody?.message.toString() ?? 'ha,da');
  }

  void setHashtags(bool value) {
    final updatedBody =
        (state.generateRequestBody ?? const GenerateRequestBody()).copyWith(
          hashtags: value,
        );
    emit(state.copyWith(generateRequestBody: updatedBody));
  }

  void setEmojis(bool value) {
    final updatedBody =
        (state.generateRequestBody ?? const GenerateRequestBody()).copyWith(
          emojis: value,
        );
    emit(state.copyWith(generateRequestBody: updatedBody));
  }

  void setRequiredWords(List<String> words) {
    final updatedBody =
        (state.generateRequestBody ?? const GenerateRequestBody()).copyWith(
          requiredWords: words,
        );
    emit(state.copyWith(generateRequestBody: updatedBody));
  }

  void setForbiddenWords(List<String> words) {
    final updatedBody =
        (state.generateRequestBody ?? const GenerateRequestBody()).copyWith(
          forbiddenWords: words,
        );
    emit(state.copyWith(generateRequestBody: updatedBody));
  }
}
