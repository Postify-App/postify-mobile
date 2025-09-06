import 'package:equatable/equatable.dart';

class MapModel extends Equatable {

  final String name;

  const MapModel({required this.name});

  factory MapModel.fromJson(Map<String, dynamic> json) => MapModel(name: json['name']);



  @override
  List<Object> get props => [name];
}