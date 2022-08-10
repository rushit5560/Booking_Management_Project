import 'dart:convert';

AvailableTimingModel availableTimingModelFromJson(String str) => AvailableTimingModel.fromJson(json.decode(str));

String availableTimingModelToJson(AvailableTimingModel data) => json.encode(data.toJson());

class AvailableTimingModel {
  AvailableTimingModel({
    required this.statusCode,
    required this.success,
    required this.timings,
    required this.message,
  });

  int statusCode;
  bool success;
  bool timings;
  String message;

  factory AvailableTimingModel.fromJson(Map<String, dynamic> json) => AvailableTimingModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    timings: json["timings"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "timings": timings,
    "message": message,
  };
}