import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {

  final String name;

  const HomeModel({required this.name});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(name: json['name']);



  @override
  List<Object> get props => [name];
}