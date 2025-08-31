import 'package:equatable/equatable.dart';

class AuthBodyModel extends Equatable {
  final String? name;
  final String email;
  final String? otp;

  const AuthBodyModel({this.name, required this.email, this.otp});

  toJson() {
    return {
      if (otp != null) "OTP": otp,
      "email": email,
      if (name != null) "name": name,
    };
  }

  @override
  List<Object?> get props => [name, email, otp];
}
