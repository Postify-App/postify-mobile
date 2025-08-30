import 'package:equatable/equatable.dart';

class OnBoardingModel extends Equatable {

  final String name;

  const OnBoardingModel({required this.name});

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) => OnBoardingModel(name: json['name']);



  @override
  List<Object> get props => [name];
}