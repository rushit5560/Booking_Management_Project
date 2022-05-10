import 'dart:convert';

AddVendorServiceModel addVendorServiceModelFromJson(String str) => AddVendorServiceModel.fromJson(json.decode(str));

String addVendorServiceModelToJson(AddVendorServiceModel data) => json.encode(data.toJson());

class AddVendorServiceModel {
  AddVendorServiceModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory AddVendorServiceModel.fromJson(Map<String, dynamic> json) => AddVendorServiceModel(
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