import 'dart:convert';

SetVendorAvailableTimeModel setVendorAvailableTimeModelFromJson(String str) => SetVendorAvailableTimeModel.fromJson(json.decode(str));

String setVendorAvailableTimeModelToJson(SetVendorAvailableTimeModel data) => json.encode(data.toJson());

class SetVendorAvailableTimeModel {
  SetVendorAvailableTimeModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory SetVendorAvailableTimeModel.fromJson(Map<String, dynamic> json) => SetVendorAvailableTimeModel(
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
