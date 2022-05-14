import 'dart:convert';

GetVendorAvailableTimeModel getVendorAvailableTimeModelFromJson(String str) => GetVendorAvailableTimeModel.fromJson(json.decode(str));

String getVendorAvailableTimeModelToJson(GetVendorAvailableTimeModel data) => json.encode(data.toJson());

class GetVendorAvailableTimeModel {
  GetVendorAvailableTimeModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<AvailableTimeWorkerList> workerList;

  factory GetVendorAvailableTimeModel.fromJson(Map<String, dynamic> json) => GetVendorAvailableTimeModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<AvailableTimeWorkerList>.from(json["workerList"].map((x) => AvailableTimeWorkerList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class AvailableTimeWorkerList {
  AvailableTimeWorkerList({
    required this.id,
    required this.vendorId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.isActive,
  });

  int id;
  int vendorId;
  String day;
  String startTime;
  String endTime;
  bool isActive;

  factory AvailableTimeWorkerList.fromJson(Map<String, dynamic> json) => AvailableTimeWorkerList(
    id: json["id"] ?? 0,
    vendorId: json["vendorId"] ?? 0,
    day: json["day"] ?? "",
    startTime: json["startTime"] ?? "",
    endTime: json["endTime"] ?? "",
    isActive: json["isActive"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendorId": vendorId,
    "day": day,
    "startTime": startTime,
    "endTime": endTime,
    "isActive": isActive,
  };
}
