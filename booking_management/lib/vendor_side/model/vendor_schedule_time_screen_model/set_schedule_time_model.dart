import 'dart:convert';

SetScheduleTimeModel setScheduleTimeModelFromJson(String str) => SetScheduleTimeModel.fromJson(json.decode(str));

String setScheduleTimeModelToJson(SetScheduleTimeModel data) => json.encode(data.toJson());

class SetScheduleTimeModel {
  SetScheduleTimeModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory SetScheduleTimeModel.fromJson(Map<String, dynamic> json) => SetScheduleTimeModel(
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