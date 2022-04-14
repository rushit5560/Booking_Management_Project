// To parse this JSON data, do
//
//     final userChangePasswordModel = userChangePasswordModelFromJson(jsonString);

import 'dart:convert';

UserChangePasswordModel userChangePasswordModelFromJson(String str) => UserChangePasswordModel.fromJson(json.decode(str));

String userChangePasswordModelToJson(UserChangePasswordModel data) => json.encode(data.toJson());

class UserChangePasswordModel {
  UserChangePasswordModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory UserChangePasswordModel.fromJson(Map<String, dynamic> json) => UserChangePasswordModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode.toString().isNotEmpty ? 0 : statusCode,
    "success": success.toString().isNotEmpty ? false : success,
    "message": message.isNotEmpty ? "" : message,
  };
}
