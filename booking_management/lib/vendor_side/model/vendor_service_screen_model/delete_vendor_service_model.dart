import 'dart:convert';

DeleteServiceServiceModel deleteServiceServiceModelFromJson(String str) => DeleteServiceServiceModel.fromJson(json.decode(str));

String deleteServiceServiceModelToJson(DeleteServiceServiceModel data) => json.encode(data.toJson());

class DeleteServiceServiceModel {
  DeleteServiceServiceModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory DeleteServiceServiceModel.fromJson(Map<String, dynamic> json) => DeleteServiceServiceModel(
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
