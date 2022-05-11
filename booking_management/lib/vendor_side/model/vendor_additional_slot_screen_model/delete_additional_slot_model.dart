import 'dart:convert';

DeleteAdditionalSlotModel deleteAdditionalSlotModelFromJson(String str) => DeleteAdditionalSlotModel.fromJson(json.decode(str));

String deleteAdditionalSlotModelToJson(DeleteAdditionalSlotModel data) => json.encode(data.toJson());

class DeleteAdditionalSlotModel {
  DeleteAdditionalSlotModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory DeleteAdditionalSlotModel.fromJson(Map<String, dynamic> json) => DeleteAdditionalSlotModel(
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