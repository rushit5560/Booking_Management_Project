import 'dart:convert';

NotificationGetModel notificationGetModelFromJson(String str) => NotificationGetModel.fromJson(json.decode(str));

String notificationGetModelToJson(NotificationGetModel data) => json.encode(data.toJson());

class NotificationGetModel {
  NotificationGetModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<NotificationData> workerList;

  factory NotificationGetModel.fromJson(Map<String, dynamic> json) => NotificationGetModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<NotificationData>.from(json["workerList"].map((x) => NotificationData.fromJson(x))).isEmpty ? []
    : List<NotificationData>.from(json["workerList"].map((x) => NotificationData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class NotificationData {
  NotificationData({
    required this.id,
    required this.dateTime,
    required this.message,
    required this.notificationFor,
    required this.notificationFrom,
    required this.notificationTo,
    required this.isSeen,
    // required this.applicationUserNotificationFrom,
    // required this.applicationUserNotificationTo,
  });

  int id;
  String dateTime;
  String message;
  String notificationFor;
  String notificationFrom;
  String notificationTo;
  bool isSeen;
  // dynamic applicationUserNotificationFrom;
  // dynamic applicationUserNotificationTo;

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
    id: json["id"] ?? 0,
    dateTime: json["dateTime"] ?? "",
    message: json["message"] ?? "",
    notificationFor: json["notificationFor"] ?? "",
    notificationFrom: json["notificationFrom"] ?? "",
    notificationTo: json["notificationTo"] ?? "",
    isSeen: json["isSeen"] ?? false,
    // applicationUserNotificationFrom: json["applicationUserNotificationFrom"],
    // applicationUserNotificationTo: json["applicationUserNotificationTo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dateTime": dateTime,
    "message": message,
    "notificationFor": notificationFor,
    "notificationFrom": notificationFrom,
    "notificationTo": notificationTo,
    "isSeen": isSeen,
    // "applicationUserNotificationFrom": applicationUserNotificationFrom,
    // "applicationUserNotificationTo": applicationUserNotificationTo,
  };
}
