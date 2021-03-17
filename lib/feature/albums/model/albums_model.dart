import 'package:json_annotation/json_annotation.dart';

part 'albums_model.g.dart';

@JsonSerializable()
class AlbumsModel {
  int? userId;
  int? id;
  String? title;

  AlbumsModel({this.userId, this.id, this.title});

  factory AlbumsModel.fromJson(Map<String, dynamic> json) {
    return _$AlbumsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AlbumsModelToJson(this);
  }
}
