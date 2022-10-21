// To parse this JSON data, do
//
//     final addVendorResourceModel = addVendorResourceModelFromJson(jsonString);

import 'dart:convert';

AddVendorResourceModel addVendorResourceModelFromJson(String str) =>
    AddVendorResourceModel.fromJson(json.decode(str));

String addVendorResourceModelToJson(AddVendorResourceModel data) =>
    json.encode(data.toJson());

class AddVendorResourceModel {
  AddVendorResourceModel({
    required this.id,
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int id;
  int statusCode;
  bool success;
  String message;

  factory AddVendorResourceModel.fromJson(Map<String, dynamic> json) =>
      AddVendorResourceModel(
        id: json["id"] ?? 0,
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "statusCode": statusCode,
        "success": success,
        "message": message,
      };
}
