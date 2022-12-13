// To parse this JSON data, do
//
//     final deactivateAccountModel = deactivateAccountModelFromJson(jsonString);

import 'dart:convert';

DeactivateAccountModel deactivateAccountModelFromJson(String str) =>
    DeactivateAccountModel.fromJson(json.decode(str));

String deactivateAccountModelToJson(DeactivateAccountModel data) =>
    json.encode(data.toJson());

class DeactivateAccountModel {
  DeactivateAccountModel({
    required this.statusCode,
    required this.success,
    required this.availability,
    required this.message,
  });

  int statusCode;
  bool success;
  bool availability;
  String message;

  factory DeactivateAccountModel.fromJson(Map<String, dynamic> json) =>
      DeactivateAccountModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        availability: json["availability"] ?? false,
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "availability": availability,
        "message": message,
      };
}
