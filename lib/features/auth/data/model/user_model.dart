import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? status;
  final UserData? data;
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
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
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

class UserData extends Equatable {
  final String? id;
  final String? email;
  final String? name;

  const UserData({this.id, this.email, this.name});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'name': name};
  }

  @override
  List<Object?> get props => [id, email, name];
}
