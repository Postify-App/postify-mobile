import 'package:equatable/equatable.dart';

class GenerateRequestBody extends Equatable {
  final String message;
  final int approximateWords;
  final bool hashtags;
  final bool emojis;
  final List<String> requiredWords;
  final List<String> forbiddenWords;

  const GenerateRequestBody({
    required this.message,
    this.approximateWords = 100,
    this.hashtags = true,
    this.emojis = true,
    this.requiredWords = const [],
    this.forbiddenWords = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'approximate_words': approximateWords,
      'hashtags': hashtags,
      'emojis': emojis,
      'required_words': requiredWords,
      'forbidden_words': forbiddenWords,
    };
  }

  @override
  List<Object?> get props => [
    message,
    approximateWords,
    hashtags,
    emojis,
    requiredWords,
    forbiddenWords,
  ];
}
