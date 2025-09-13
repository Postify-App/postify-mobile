import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
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
    return super.close();
  }

  void generatePost(GenerateRequestBody generateRequest) {
    emit(state.copyWith(status: CubitStatus.loading));

    SocketClient.instance.emit(
      SocketEvents.generatePost,
      generateRequest.toJson(),
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

      SocketClient.instance.unsubscribe(SocketEvents.botTyping);
      SocketClient.instance.unsubscribe(SocketEvents.botMessage);
      SocketClient.instance.unsubscribe(SocketEvents.ack);
      SocketClient.instance.unsubscribe(SocketEvents.error);
    });
  }
}
