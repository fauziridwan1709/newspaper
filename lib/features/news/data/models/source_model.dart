part of '_models.dart';

class SourceModel {
  String? id;
  String? name;
  SourceModel({
    this.id,
    this.name,
  });

  SourceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
