import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String? id;
  final String? email;
  final String? name;

  const ProfileModel({this.id, this.email, this.name});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
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
