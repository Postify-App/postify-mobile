import 'package:equatable/equatable.dart';

List<BusinessModel> businessModelFromJson(List data) {
  return List<BusinessModel>.from(
    data.map((item) => BusinessModel.fromJson(item)),
  );
}

class BusinessModel extends Equatable {
  final String? id;
  final String? userId;
  final String? name;
  final String? email;
  final String? description;
  final String? size;
  final double? longitude;
  final double? latitude;
  final String? logo;
  final String? mainTopicId;
  final String? toneOfVoiceId;
  final String? mainGoalId;
  final String? targetAudienceId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const BusinessModel({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.description,
    this.size,
    this.longitude,
    this.latitude,
    this.logo,
    this.mainTopicId,
    this.toneOfVoiceId,
    this.mainGoalId,
    this.targetAudienceId,
    this.createdAt,
    this.updatedAt,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      description: json['description'] as String?,
      size: json['size'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      logo: json['logo'] as String?,
      mainTopicId: json['mainTopicId'] as String?,
      toneOfVoiceId: json['toneOfVoiceId'] as String?,
      mainGoalId: json['mainGoalId'] as String?,
      targetAudienceId: json['targetAudienceId'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'email': email,
      'description': description,
      'size': size,
      'longitude': longitude,
      'latitude': latitude,
      'logo': logo,
      'mainTopicId': mainTopicId,
      'toneOfVoiceId': toneOfVoiceId,
      'mainGoalId': mainGoalId,
      'targetAudienceId': targetAudienceId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    name,
    email,
    description,
    size,
    longitude,
    latitude,
    logo,
    mainTopicId,
    toneOfVoiceId,
    mainGoalId,
    targetAudienceId,
    createdAt,
    updatedAt,
  ];
}
