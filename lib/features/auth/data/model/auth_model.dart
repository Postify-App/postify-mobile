import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {

  final String name;

  const AuthModel({required this.name});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(name: json['name']);



  @override
  List<Object> get props => [name];
}