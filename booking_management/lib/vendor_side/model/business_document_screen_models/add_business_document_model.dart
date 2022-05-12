
import 'dart:convert';

AddBusinessDocumentsModel addBusinessDocumentsModelFromJson(String str) => AddBusinessDocumentsModel.fromJson(json.decode(str));

String addBusinessDocumentsModelToJson(AddBusinessDocumentsModel data) => json.encode(data.toJson());

class AddBusinessDocumentsModel {
  AddBusinessDocumentsModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory AddBusinessDocumentsModel.fromJson(Map<String, dynamic> json) => AddBusinessDocumentsModel(
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