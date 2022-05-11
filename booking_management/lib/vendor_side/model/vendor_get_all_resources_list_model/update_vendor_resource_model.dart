// To parse this JSON data, do
//
//     final updateVendorResourceModel = updateVendorResourceModelFromJson(jsonString);

import 'dart:convert';

UpdateVendorResourceModel updateVendorResourceModelFromJson(String str) => UpdateVendorResourceModel.fromJson(json.decode(str));

String updateVendorResourceModelToJson(UpdateVendorResourceModel data) => json.encode(data.toJson());

class UpdateVendorResourceModel {
  UpdateVendorResourceModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory UpdateVendorResourceModel.fromJson(Map<String, dynamic> json) => UpdateVendorResourceModel(
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
