import 'package:equatable/equatable.dart';

import '../../../initiate_business/data/model/initiate_general_model.dart';

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
  final InitiateGeneralModel? mainTopic;
  final InitiateGeneralModel? toneOfVoice;
  final InitiateGeneralModel? mainGoal;
  final InitiateGeneralModel? targetAudience;
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
    this.mainTopic,
    this.toneOfVoice,
    this.mainGoal,
    this.targetAudience,
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
      mainTopic: InitiateGeneralModel.fromJson(json['mainTopic']),
      toneOfVoice: InitiateGeneralModel.fromJson(json['toneOfVoice']),
      mainGoal: InitiateGeneralModel.fromJson(json['mainGoal']),
      targetAudience: InitiateGeneralModel.fromJson(json['targetAudience']),
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
    mainTopic,
    toneOfVoice,
    mainGoal,
    targetAudience,
    createdAt,
    updatedAt,
  ];
}
