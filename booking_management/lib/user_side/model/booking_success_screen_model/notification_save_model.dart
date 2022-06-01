import 'dart:convert';

NotificationSaveModel notificationSaveModelFromJson(String str) => NotificationSaveModel.fromJson(json.decode(str));

String notificationSaveModelToJson(NotificationSaveModel data) => json.encode(data.toJson());

class NotificationSaveModel {
  NotificationSaveModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory NotificationSaveModel.fromJson(Map<String, dynamic> json) => NotificationSaveModel(
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
