import 'dart:convert';

SaveVendorLatLongModel saveVendorLatLongModelFromJson(String str) => SaveVendorLatLongModel.fromJson(json.decode(str));

String saveVendorLatLongModelToJson(SaveVendorLatLongModel data) => json.encode(data.toJson());

class SaveVendorLatLongModel {
  SaveVendorLatLongModel({
    required this.statusCode,
    required this.success,
    required this.vendorId,
  });

  int statusCode;
  bool success;
  int vendorId;

  factory SaveVendorLatLongModel.fromJson(Map<String, dynamic> json) => SaveVendorLatLongModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    vendorId: json["vendorId"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "vendorId": vendorId,
  };
}
