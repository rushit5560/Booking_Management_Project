import 'dart:convert';

DayAddModel dayAddModelFromJson(String str) => DayAddModel.fromJson(json.decode(str));

String dayAddModelToJson(DayAddModel data) => json.encode(data.toJson());

class DayAddModel {
  DayAddModel({
    required this.day,
    required this.startTime,
    required this.endTime,
  });

  String day;
  String startTime;
  String endTime;

  factory DayAddModel.fromJson(Map<String, dynamic> json) => DayAddModel(
    day: json["Day"] ?? "",
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "Day": day,
    "StartTime": startTime,
    "EndTime": endTime,
  };
}
