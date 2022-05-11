import 'dart:convert';

UpdateVendorServiceModel updateVendorServiceModelFromJson(String str) => UpdateVendorServiceModel.fromJson(json.decode(str));

String updateVendorServiceModelToJson(UpdateVendorServiceModel data) => json.encode(data.toJson());

class UpdateVendorServiceModel {
  UpdateVendorServiceModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory UpdateVendorServiceModel.fromJson(Map<String, dynamic> json) => UpdateVendorServiceModel(
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
