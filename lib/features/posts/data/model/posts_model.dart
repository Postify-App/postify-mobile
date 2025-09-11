import 'package:equatable/equatable.dart';

class PostsModel extends Equatable {

  final String name;

  const PostsModel({required this.name});

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(name: json['name']);



  @override
  List<Object> get props => [name];
}