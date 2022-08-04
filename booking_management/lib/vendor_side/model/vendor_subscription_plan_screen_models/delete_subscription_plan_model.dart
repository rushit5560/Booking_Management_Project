import 'dart:convert';

DeleteSubscriptionPlanModel deleteSubscriptionPlanModelFromJson(String str) => DeleteSubscriptionPlanModel.fromJson(json.decode(str));

String deleteSubscriptionPlanModelToJson(DeleteSubscriptionPlanModel data) => json.encode(data.toJson());

class DeleteSubscriptionPlanModel {
  DeleteSubscriptionPlanModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory DeleteSubscriptionPlanModel.fromJson(Map<String, dynamic> json) => DeleteSubscriptionPlanModel(
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