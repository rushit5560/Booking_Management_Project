import 'dart:convert';

UpdateAdditionalSlotModel updateAdditionalSlotModelFromJson(String str) => UpdateAdditionalSlotModel.fromJson(json.decode(str));

String updateAdditionalSlotModelToJson(UpdateAdditionalSlotModel data) => json.encode(data.toJson());

class UpdateAdditionalSlotModel {
  UpdateAdditionalSlotModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory UpdateAdditionalSlotModel.fromJson(Map<String, dynamic> json) => UpdateAdditionalSlotModel(
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