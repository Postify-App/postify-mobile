part of 'generate_post_cubit.dart';

class GeneratePostState extends Equatable {
  final CubitStatus status;
  final AiPromptResponseModel? aiPromptResponseModel;
  final String errorMessage;

  const GeneratePostState({
    this.status = CubitStatus.initial,
    this.aiPromptResponseModel,
    this.errorMessage = '',
  });

  GeneratePostState copyWith({
    CubitStatus? status,
    AiPromptResponseModel? aiPromptResponseModel,
    String? errorMessage,
  }) {
    return GeneratePostState(
      status: status ?? this.status,
      aiPromptResponseModel:
          aiPromptResponseModel ?? this.aiPromptResponseModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, aiPromptResponseModel, errorMessage];
}
