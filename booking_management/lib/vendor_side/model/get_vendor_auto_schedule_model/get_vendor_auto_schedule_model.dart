// To parse this JSON data, do
//
//     final getVendorAutoScheduleModel = getVendorAutoScheduleModelFromJson(jsonString);

import 'dart:convert';

GetVendorAutoScheduleModel getVendorAutoScheduleModelFromJson(String str) => GetVendorAutoScheduleModel.fromJson(json.decode(str));

String getVendorAutoScheduleModelToJson(GetVendorAutoScheduleModel data) => json.encode(data.toJson());

class GetVendorAutoScheduleModel {
  GetVendorAutoScheduleModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory GetVendorAutoScheduleModel.fromJson(Map<String, dynamic> json) => GetVendorAutoScheduleModel(
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
