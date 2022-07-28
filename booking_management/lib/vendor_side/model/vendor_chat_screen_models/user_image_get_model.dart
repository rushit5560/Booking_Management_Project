// To parse this JSON data, do
//
//     final userImageGetModel = userImageGetModelFromJson(jsonString);

import 'dart:convert';

UserImageGetModel userImageGetModelFromJson(String str) =>
    UserImageGetModel.fromJson(json.decode(str));

String userImageGetModelToJson(UserImageGetModel data) =>
    json.encode(data.toJson());

class UserImageGetModel {
  UserImageGetModel({
    this.statusCode,
    this.success,
    this.image,
  });

  int? statusCode;
  bool? success;
  String? image;

  factory UserImageGetModel.fromJson(Map<String, dynamic> json) =>
      UserImageGetModel(
        statusCode: json["statusCode"],
        success: json["success"],
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "image": image,
      };
}
