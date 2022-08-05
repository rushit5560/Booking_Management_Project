import 'dart:convert';

NotificationCountModel notificationCountModelFromJson(String str) => NotificationCountModel.fromJson(json.decode(str));

String notificationCountModelToJson(NotificationCountModel data) => json.encode(data.toJson());

class NotificationCountModel {
  NotificationCountModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  int workerList;

  factory NotificationCountModel.fromJson(Map<String, dynamic> json) => NotificationCountModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: json["workerList"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": workerList,
  };
}