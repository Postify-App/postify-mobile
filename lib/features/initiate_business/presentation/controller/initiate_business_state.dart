part of 'initiate_business_cubit.dart';

class InitiateBusinessState extends Equatable {
  final CubitStatus mainTopicsStatus;
  final CubitStatus toneOfVoiceStatus;
  final CubitStatus mainGoalStatus;
  final CubitStatus targetAudienceStatus;
  final CubitStatus createBusinessStatus;
  final List<InitiateGeneralModel> mainTopics;
  final List<InitiateGeneralModel> toneOfVoice;
  final List<InitiateGeneralModel> mainGoal;
  final List<InitiateGeneralModel> targetAudience;
  final int currentPage;
  final CreateBusinessBody? createBusinessBody;
  final BusinessModel? businessModel;
  final String errorMessage;

  const InitiateBusinessState({
    this.mainTopicsStatus = CubitStatus.initial,
    this.toneOfVoiceStatus = CubitStatus.initial,
    this.mainGoalStatus = CubitStatus.initial,
    this.targetAudienceStatus = CubitStatus.initial,
    this.createBusinessStatus = CubitStatus.initial,
    this.mainTopics = const [],
    this.toneOfVoice = const [],
    this.mainGoal = const [],
    this.targetAudience = const [],
    this.currentPage = 0,
    this.createBusinessBody,
    this.businessModel,
    this.errorMessage = '',
  });

  InitiateBusinessState copyWith({
    CubitStatus? mainTopicsStatus,
    CubitStatus? toneOfVoiceStatus,
    CubitStatus? mainGoalStatus,
    CubitStatus? targetAudienceStatus,
    CubitStatus? createBusinessStatus,
    List<InitiateGeneralModel>? mainTopics,
    List<InitiateGeneralModel>? toneOfVoice,
    List<InitiateGeneralModel>? mainGoal,
    List<InitiateGeneralModel>? targetAudience,
    int? currentPage,
    CreateBusinessBody? createBusinessBody,
    BusinessModel? businessModel,
    String? errorMessage,
  }) {
    return InitiateBusinessState(
      mainTopicsStatus: mainTopicsStatus ?? this.mainTopicsStatus,
      toneOfVoiceStatus: toneOfVoiceStatus ?? this.toneOfVoiceStatus,
      mainGoalStatus: mainGoalStatus ?? this.mainGoalStatus,
      targetAudienceStatus: targetAudienceStatus ?? this.targetAudienceStatus,
      createBusinessStatus: createBusinessStatus ?? this.createBusinessStatus,
      mainTopics: mainTopics ?? this.mainTopics,
      toneOfVoice: toneOfVoice ?? this.toneOfVoice,
      mainGoal: mainGoal ?? this.mainGoal,
      targetAudience: targetAudience ?? this.targetAudience,
      currentPage: currentPage ?? this.currentPage,
      createBusinessBody: createBusinessBody ?? this.createBusinessBody,
      businessModel: businessModel ?? this.businessModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    mainTopicsStatus,
    toneOfVoiceStatus,
    mainGoalStatus,
    targetAudienceStatus,
    createBusinessStatus,
    mainTopics,
    toneOfVoice,
    mainGoal,
    targetAudience,
    currentPage,
    createBusinessBody,
    businessModel,
    errorMessage,
  ];
}
