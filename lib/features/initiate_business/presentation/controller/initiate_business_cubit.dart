import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:postify/core/utils/common_methods.dart';
import 'package:postify/features/initiate_business/data/enum/initiate_business_step_type_enum.dart';
import 'package:postify/features/initiate_business/data/model/create_business_body.dart';
import 'package:postify/features/initiate_business/data/model/initiate_general_model.dart';
import 'package:postify/features/initiate_business/data/repository/initiate_business_repository.dart';
import '../../../../core/enum/cubit_state/cubit_status.dart';

part 'initiate_business_state.dart';

//! I wanna enhancement this cubit by dividing it into smaller cubits for better performance and scalability but for now it will do the job
//! The comments will help you understand the logic behind this cubit enshaAllah

class InitiateBusinessCubit extends Cubit<InitiateBusinessState> {
  final InitiateBusinessRepository initiateBusinessRepository;

  InitiateBusinessCubit(this.initiateBusinessRepository)
    : super(const InitiateBusinessState());

  //! THIS IS TO KEEP TRACK OF LOADED STEPS TO AVOID RELOADING DATA
  final Set<InitiateBusinessStepType> _loadedSteps = {};

  final List<InitiateBusinessStepType> steps = [
    InitiateBusinessStepType.topic,
    InitiateBusinessStepType.tone,
    InitiateBusinessStepType.target,
    InitiateBusinessStepType.businessInfo,
    InitiateBusinessStepType.social,
  ];

  void nextPage(InitiateBusinessStepType step) {
    if (validateStep(step) && state.currentPage < steps.length - 1) {
      final nextPageIndex = state.currentPage + 1;
      emit(state.copyWith(currentPage: nextPageIndex));
      //! LOAD DATA FOR NEXT STEP
      _loadDataForStep(steps[nextPageIndex]);
    } else if (validateStep(step) && state.currentPage == steps.length - 1) {
      createBusiness(state.createBusinessBody!);
    } else {
      CommonMethods.showError(
        message: 'Please complete this step before continuing',
      );
    }
  }

  void previousPage() {
    if (state.currentPage > 0) {
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }

  void setPage(int index) {
    emit(state.copyWith(currentPage: index));
    //! LOAD DATA FOR THE STEP IF NOT LOADED YET WHEN NAVIGATE TO A NEW STEP
    _loadDataForStep(steps[index]);
  }

  void _loadDataForStep(InitiateBusinessStepType step) {
    if (_loadedSteps.contains(step)) return;

    switch (step) {
      case InitiateBusinessStepType.topic:
        if (state.mainTopicsStatus != CubitStatus.success) {
          getMainTopics();
        }
        break;
      case InitiateBusinessStepType.tone:
        if (state.toneOfVoiceStatus != CubitStatus.success) {
          getToneOfVoice();
        }
        break;
      case InitiateBusinessStepType.target:
        if (state.targetAudienceStatus != CubitStatus.success) {
          getTargetAudience();
        }
        if (state.mainGoalStatus != CubitStatus.success) {
          getMainGoal();
        }
        break;
      case InitiateBusinessStepType.businessInfo:
      case InitiateBusinessStepType.social:
        _loadedSteps.add(step);
        break;
    }
  }

  void initializeFirstPage() {
    _loadDataForStep(steps[0]);
  }

  //! Initiate Business Data Methods
  Future<void> getMainTopics() async {
    emit(state.copyWith(mainTopicsStatus: CubitStatus.loading));
    final result = await initiateBusinessRepository.mainTopics();
    result.fold(
      (failure) => emit(
        state.copyWith(
          mainTopicsStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),

      (data) {
        emit(
          state.copyWith(
            mainTopicsStatus: CubitStatus.success,
            mainTopics: data,
          ),
        );
        _loadedSteps.add(InitiateBusinessStepType.topic);
      },
    );
  }

  Future<void> getToneOfVoice() async {
    emit(state.copyWith(toneOfVoiceStatus: CubitStatus.loading));
    final result = await initiateBusinessRepository.toneOfVoice();
    result.fold(
      (failure) => emit(
        state.copyWith(
          toneOfVoiceStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),

      (data) {
        emit(
          state.copyWith(
            toneOfVoiceStatus: CubitStatus.success,
            toneOfVoice: data,
          ),
        );
        _loadedSteps.add(InitiateBusinessStepType.tone);
      },
    );
  }

  Future<void> getMainGoal() async {
    emit(state.copyWith(mainGoalStatus: CubitStatus.loading));
    final result = await initiateBusinessRepository.mainGoal();
    result.fold(
      (failure) => emit(
        state.copyWith(
          mainGoalStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),

      (data) {
        emit(
          state.copyWith(mainGoalStatus: CubitStatus.success, mainGoal: data),
        );
      },
    );
  }

  Future<void> getTargetAudience() async {
    emit(state.copyWith(targetAudienceStatus: CubitStatus.loading));
    final result = await initiateBusinessRepository.targetAudience();
    result.fold(
      (failure) => emit(
        state.copyWith(
          targetAudienceStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),

      (data) {
        emit(
          state.copyWith(
            targetAudienceStatus: CubitStatus.success,
            targetAudience: data,
          ),
        );
        _loadedSteps.add(InitiateBusinessStepType.target);
      },
    );
  }

  Future<void> createBusiness(CreateBusinessBody body) async {
    emit(state.copyWith(createBusinessStatus: CubitStatus.loading));
    final result = await initiateBusinessRepository.createBusiness(body);
    result.fold(
      (failure) => emit(
        state.copyWith(
          createBusinessStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),
      (data) => emit(state.copyWith(createBusinessStatus: CubitStatus.success)),
    );
  }

  void setTopic(String topicId) {
    final updatedBody = (state.createBusinessBody ?? CreateBusinessBody())
        .copyWith(mainTopicId: topicId);
    log(updatedBody.mainTopicId.toString());
    emit(state.copyWith(createBusinessBody: updatedBody));
  }

  void setTone(String toneId) {
    final updatedBody = (state.createBusinessBody ?? CreateBusinessBody())
        .copyWith(toneOfVoiceId: toneId);
    emit(state.copyWith(createBusinessBody: updatedBody));
  }

  void setTargetAudience(String audienceId) {
    final updatedBody = (state.createBusinessBody ?? CreateBusinessBody())
        .copyWith(targetAudienceId: audienceId);
    emit(state.copyWith(createBusinessBody: updatedBody));
  }

  void setMainGoal(String mainGoalId) {
    final updatedBody = (state.createBusinessBody ?? CreateBusinessBody())
        .copyWith(mainGoalId: mainGoalId);
    emit(state.copyWith(createBusinessBody: updatedBody));
  }

  void setBusinessInfo({
    String? name,
    String? email,
    String? description,
    String? size,
    String? latitude,
    String? longitude,
    String? location,
    File? logo,
  }) {
    final updatedBody = (state.createBusinessBody ?? CreateBusinessBody())
        .copyWith(
          name: name,
          email: email,
          description: description,
          size: size,
          latitude: latitude,
          longitude: longitude,
          location: location,
          logo: logo,
        );
    emit(state.copyWith(createBusinessBody: updatedBody));
  }

  // void setSocialLinks(List<String> socialLinks) {
  //   final updatedBody = (state.createBusinessBody ?? CreateBusinessBody()).copyWith(
  //     socialLinks: socialLinks,
  //   );
  //   emit(state.copyWith(createBusinessBody: updatedBody));
  // }

  //! Validation Method
  bool validateStep(InitiateBusinessStepType step) {
    final body = state.createBusinessBody;
    if (body == null) return false;

    switch (step) {
      case InitiateBusinessStepType.topic:
        return body.mainTopicId != null && body.mainTopicId!.isNotEmpty;
      case InitiateBusinessStepType.tone:
        return body.toneOfVoiceId != null && body.toneOfVoiceId!.isNotEmpty;
      case InitiateBusinessStepType.target:
        return body.targetAudienceId != null &&
            body.targetAudienceId!.isNotEmpty &&
            body.mainGoalId != null &&
            body.mainGoalId!.isNotEmpty;
      case InitiateBusinessStepType.businessInfo:
        return body.name != null &&
            body.description != null &&
            body.name!.isNotEmpty &&
            body.description!.isNotEmpty &&
            body.logo != null &&
            body.size != null &&
            body.size!.isNotEmpty &&
            body.latitude != null &&
            body.latitude!.isNotEmpty &&
            body.longitude != null &&
            body.longitude!.isNotEmpty;
      case InitiateBusinessStepType.social:
        return true;
    }
  }
}
