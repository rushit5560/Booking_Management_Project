import 'dart:convert';

SignInVendorErrorModel signInVendorErrorModelFromJson(String str) => SignInVendorErrorModel.fromJson(json.decode(str));

String signInVendorErrorModelToJson(SignInVendorErrorModel data) => json.encode(data.toJson());

class SignInVendorErrorModel {
  SignInVendorErrorModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory SignInVendorErrorModel.fromJson(Map<String, dynamic> json) => SignInVendorErrorModel(
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