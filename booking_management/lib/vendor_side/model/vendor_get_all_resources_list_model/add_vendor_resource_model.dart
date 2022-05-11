// To parse this JSON data, do
//
//     final addVendorResourceModel = addVendorResourceModelFromJson(jsonString);

import 'dart:convert';

AddVendorResourceModel addVendorResourceModelFromJson(String str) => AddVendorResourceModel.fromJson(json.decode(str));

String addVendorResourceModelToJson(AddVendorResourceModel data) => json.encode(data.toJson());

class AddVendorResourceModel {
  AddVendorResourceModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory AddVendorResourceModel.fromJson(Map<String, dynamic> json) => AddVendorResourceModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
  };
}
