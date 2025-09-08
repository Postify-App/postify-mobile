import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class CreateBusinessBody {
  final String? name;
  final String? description;
  final String? email;
  final String? latitude;
  final String? longitude;
  final String? location;
  final String? size;
  final String? mainTopicId;
  final String? mainGoalId;
  final String? toneOfVoiceId;
  final String? targetAudienceId;
  final File? logo;

  CreateBusinessBody({
    this.name,
    this.description,
    this.email,
    this.latitude,
    this.longitude,
    this.location,
    this.size,
    this.mainTopicId,
    this.mainGoalId,
    this.toneOfVoiceId,
    this.targetAudienceId,
    this.logo,
  });

  CreateBusinessBody copyWith({
    String? name,
    String? description,
    String? email,
    String? latitude,
    String? longitude,
    String? location,
    String? size,
    String? mainTopicId,
    String? mainGoalId,
    String? toneOfVoiceId,
    String? targetAudienceId,
    File? logo,
  }) {
    return CreateBusinessBody(
      name: name ?? this.name,
      description: description ?? this.description,
      email: email ?? this.email,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      location: location ?? this.location,
      size: size ?? this.size,
      mainTopicId: mainTopicId ?? this.mainTopicId,
      mainGoalId: mainGoalId ?? this.mainGoalId,
      toneOfVoiceId: toneOfVoiceId ?? this.toneOfVoiceId,
      targetAudienceId: targetAudienceId ?? this.targetAudienceId,
      logo: logo ?? this.logo,
    );
  }

  Future toJson() async {
    return {
      'name': name,
      'description': description,
      'email': email,
      'latitude': latitude,
      'longitude': longitude,
      'size': size,
      'mainTopicId': mainTopicId,
      'mainGoalId': mainGoalId,
      'toneOfVoiceId': toneOfVoiceId,
      'targetAudienceId': targetAudienceId,
      'logo': await MultipartFile.fromFile(
        logo!.path,
        filename: logo!.path.split('/').last,
        
        contentType: MediaType('image', logo!.path.split('.').last),
      ),
    };
  }
}
