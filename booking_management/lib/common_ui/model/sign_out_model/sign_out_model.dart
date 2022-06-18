import 'dart:convert';

SignOutModel signOutModelFromJson(String str) => SignOutModel.fromJson(json.decode(str));

String signOutModelToJson(SignOutModel data) => json.encode(data.toJson());

class SignOutModel {
  SignOutModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory SignOutModel.fromJson(Map<String, dynamic> json) => SignOutModel(
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
