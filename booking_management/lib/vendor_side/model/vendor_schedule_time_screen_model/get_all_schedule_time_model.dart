import 'dart:convert';

GetAllScheduleTimeModel getAllScheduleTimeModelFromJson(String str) =>
    GetAllScheduleTimeModel.fromJson(json.decode(str));

String getAllScheduleTimeModelToJson(GetAllScheduleTimeModel data) =>
    json.encode(data.toJson());

class GetAllScheduleTimeModel {
  GetAllScheduleTimeModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<String> workerList;

  factory GetAllScheduleTimeModel.fromJson(Map<String, dynamic> json) =>
      GetAllScheduleTimeModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        workerList: List<String>.from((json["workerList"]).map((x) => x) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "workerList": List<dynamic>.from(workerList.map((x) => x)),
      };
}
