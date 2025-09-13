part of 'generate_post_cubit.dart';

class GeneratePostState extends Equatable {
  final CubitStatus status;
  final CubitStatus publishPostStatus;
  final AiPromptResponseModel? aiPromptResponseModel;
  final GenerateRequestBody? generateRequestBody;
  final String errorMessage;

  const GeneratePostState({
    this.status = CubitStatus.initial,
    this.publishPostStatus = CubitStatus.initial,
    this.aiPromptResponseModel,
    this.generateRequestBody,
    this.errorMessage = '',
  });

  GeneratePostState copyWith({
    CubitStatus? status,
    CubitStatus? publishPostStatus,
    AiPromptResponseModel? aiPromptResponseModel,
    GenerateRequestBody? generateRequestBody,
    String? errorMessage,
  }) {
    return GeneratePostState(
      status: status ?? this.status,
      publishPostStatus: publishPostStatus ?? this.publishPostStatus,
      aiPromptResponseModel:
          aiPromptResponseModel ?? this.aiPromptResponseModel,
      generateRequestBody: generateRequestBody ?? this.generateRequestBody,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    publishPostStatus,
    aiPromptResponseModel,
    generateRequestBody,
    errorMessage,
  ];
}
