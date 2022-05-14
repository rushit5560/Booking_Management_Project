import 'dart:convert';

SetVendorAvailableTimeModel setVendorAvailableTimeModelFromJson(String str) => SetVendorAvailableTimeModel.fromJson(json.decode(str));

String setVendorAvailableTimeModelToJson(SetVendorAvailableTimeModel data) => json.encode(data.toJson());

class SetVendorAvailableTimeModel {
  SetVendorAvailableTimeModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  String data;

  factory SetVendorAvailableTimeModel.fromJson(Map<String, dynamic> json) => SetVendorAvailableTimeModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: json["data"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": data,
  };
}