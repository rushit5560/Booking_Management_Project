import 'dart:convert';

AddAdditionalSlotModel addAdditionalSlotModelFromJson(String str) => AddAdditionalSlotModel.fromJson(json.decode(str));

String addAdditionalSlotModelToJson(AddAdditionalSlotModel data) => json.encode(data.toJson());

class AddAdditionalSlotModel {
  AddAdditionalSlotModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory AddAdditionalSlotModel.fromJson(Map<String, dynamic> json) => AddAdditionalSlotModel(
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