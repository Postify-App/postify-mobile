import 'package:equatable/equatable.dart';

class AiPromptResponseModel extends Equatable {
  final String title;
  final String description;

  const AiPromptResponseModel({required this.title, required this.description});

  factory AiPromptResponseModel.fromJson(dynamic json) {
    return AiPromptResponseModel(
      title: json['title'],
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [title, description];
}
