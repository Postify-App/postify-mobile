import 'package:equatable/equatable.dart';
import 'package:postify/features/profile/data/model/profile_model.dart';

class UserModel extends Equatable {
  final String? status;
  final ProfileModel? data;
  final String? accessToken;
  final String? refreshToken;

  const UserModel({
    this.status,
    this.data,
    this.accessToken,
    this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json['status'] as String?,
      data: json['data'] != null ? ProfileModel.fromJson(json['data']) : null,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  @override
  List<Object?> get props => [status, data, accessToken, refreshToken];
}
