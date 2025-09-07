import 'package:equatable/equatable.dart';

List<InitiateGeneralModel> initiateGeneralModelFromJson(List data) {
  return List<InitiateGeneralModel>.from(
    data.map((item) => InitiateGeneralModel.fromJson(item)),
  );
}

class InitiateGeneralModel extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? logo;

  const InitiateGeneralModel({
    this.id,
    this.title,
    this.description,
    this.logo,
  });

  factory InitiateGeneralModel.fromJson(Map<String, dynamic> json) {
    return InitiateGeneralModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'description': description, 'logo': logo};
  }

  @override
  List<Object?> get props => [id, title, description, logo];
}
