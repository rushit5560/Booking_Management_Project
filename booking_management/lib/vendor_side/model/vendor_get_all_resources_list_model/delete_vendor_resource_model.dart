// To parse this JSON data, do
//
//     final deleteVendorResourceModel = deleteVendorResourceModelFromJson(jsonString);

import 'dart:convert';

DeleteVendorResourceModel deleteVendorResourceModelFromJson(String str) => DeleteVendorResourceModel.fromJson(json.decode(str));

String deleteVendorResourceModelToJson(DeleteVendorResourceModel data) => json.encode(data.toJson());

class DeleteVendorResourceModel {
  DeleteVendorResourceModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory DeleteVendorResourceModel.fromJson(Map<String, dynamic> json) => DeleteVendorResourceModel(
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





