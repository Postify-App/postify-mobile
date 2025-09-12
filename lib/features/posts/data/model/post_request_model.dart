import 'package:equatable/equatable.dart';

class PostRequest extends Equatable {
  final String message;
  final int? approximateWords;
  final bool? hashtags;
  final bool? emojis;
  final List<String>? requiredWords;
  final List<String>? forbiddenWords;

  const PostRequest({
    required this.message,
    this.approximateWords,
    this.hashtags,
    this.emojis,
    this.requiredWords,
    this.forbiddenWords,
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      if (approximateWords != null) 'approximate_words': approximateWords,
      if (hashtags != null) 'hashtags': hashtags,
      if (emojis != null) 'emojis': emojis,
      if (requiredWords != null) 'required_words': requiredWords,
      if (forbiddenWords != null) 'forbidden_words': forbiddenWords,
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
