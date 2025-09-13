import 'package:equatable/equatable.dart';

List<PostModel> postModelFromJson(List<dynamic> json) {
  return json.map((e) => PostModel.fromJson(e)).toList();
}

class PostModel extends Equatable {
  final String id;
  final String? title;
  final String? description;
  final String? userId;
  final String? businessId;
  final List<String>? hashtags;
  final DateTime? createdAt;
  final DateTime? scheduledAt;
  final String? file;
  final bool? hasEmojis;
  final int? approximateWords;
  final List<String>? requiredWords;
  final List<String>? forbiddenWords;
  final DateTime? updatedAt;

  const PostModel({
    required this.id,
    this.title,
    this.description,
    this.userId,
    this.businessId,
    this.hashtags,
    this.createdAt,
    this.scheduledAt,
    this.file,
    this.hasEmojis,
    this.approximateWords,
    this.requiredWords,
    this.forbiddenWords,
    this.updatedAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      userId: json['userId'] as String?,
      businessId: json['businessId'] as String?,
      hashtags: (json['hashtags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      scheduledAt: json['scheduledAt'] != null
          ? DateTime.tryParse(json['scheduledAt'])
          : null,
      file: json['file'] as String?,
      hasEmojis: json['hasEmojis'] as bool?,
      approximateWords: json['approximateWords'] as int?,
      requiredWords: (json['requiredWords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      forbiddenWords: (json['forbiddenWords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'userId': userId,
      'businessId': businessId,
      'hashtags': hashtags,
      'createdAt': createdAt?.toIso8601String(),
      'scheduledAt': scheduledAt?.toIso8601String(),
      'file': file,
      'hasEmojis': hasEmojis,
      'approximateWords': approximateWords,
      'requiredWords': requiredWords,
      'forbiddenWords': forbiddenWords,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    userId,
    businessId,
    hashtags,
    createdAt,
    scheduledAt,
    file,
    hasEmojis,
    approximateWords,
    requiredWords,
    forbiddenWords,
    updatedAt,
  ];
}
