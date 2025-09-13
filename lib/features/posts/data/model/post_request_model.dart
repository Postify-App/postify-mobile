import 'package:equatable/equatable.dart';

class GenerateRequestBody extends Equatable {
  final String message;
  final int approximateWords;
  final bool hashtags;
  final bool emojis;
  final List<String> requiredWords;
  final List<String> forbiddenWords;

  const GenerateRequestBody({
    this.message = '',
    this.approximateWords = 32,
    this.hashtags = false,
    this.emojis = false,
    this.requiredWords = const ['Organic', 'Handmade', 'Travel'],
    this.forbiddenWords = const ['Cheap', 'Discount'],
  });

  GenerateRequestBody copyWith({
    String? message,
    int? approximateWords,
    bool? hashtags,
    bool? emojis,
    List<String>? requiredWords,
    List<String>? forbiddenWords,
  }) {
    return GenerateRequestBody(
      message: message ?? this.message,
      approximateWords: approximateWords ?? this.approximateWords,
      hashtags: hashtags ?? this.hashtags,
      emojis: emojis ?? this.emojis,
      requiredWords: requiredWords ?? this.requiredWords,
      forbiddenWords: forbiddenWords ?? this.forbiddenWords,
    );
  }

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
