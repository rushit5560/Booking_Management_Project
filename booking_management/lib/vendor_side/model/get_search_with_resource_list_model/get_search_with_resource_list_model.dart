// To parse this JSON data, do
//
//     final getSearchWithResourceListModel = getSearchWithResourceListModelFromJson(jsonString);

import 'dart:convert';

GetSearchWithResourceListModel getSearchWithResourceListModelFromJson(String str) => GetSearchWithResourceListModel.fromJson(json.decode(str));

String getSearchWithResourceListModelToJson(GetSearchWithResourceListModel data) => json.encode(data.toJson());

class GetSearchWithResourceListModel {
  GetSearchWithResourceListModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
    required this.errorMessage,
    required this.nextDate,
  });

  int statusCode;
  bool success;
  List<WorkerList> workerList;
  String errorMessage;
  String nextDate;

  factory GetSearchWithResourceListModel.fromJson(Map<String, dynamic> json) => GetSearchWithResourceListModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<WorkerList>.from(json["workerList"].map((x) => WorkerList.fromJson(x)) ?? {}),
    errorMessage: json["errorMessage"] ?? "",
    nextDate: json["nextDate"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
    "errorMessage": errorMessage,
    "nextDate": nextDate,
  };
}

class WorkerList {
  WorkerList({
    required this.id,
    required this.bookingServiceId,
    required this.bookingServices,
    required this.resource,
    required this.resourceId,
    required this.startDateTime,
    required this.endDateTime,
    required this.isActive,
    required this.booking,
    required this.countOfCapacity,
    required this.start,
    required this.end,
    required this.scheduleDate,
    required this.vendorId,
    required this.duration,
    required this.serviceId,
    required this.externalLogins,
    required this.returnUrl,
    required this.bookingData,
  });

  int id;
  String bookingServiceId;
  String bookingServices;
  String resource;
  int resourceId;
  String startDateTime;
  String endDateTime;
  bool isActive;
  bool booking;
  int countOfCapacity;
  String start;
  String end;
  String scheduleDate;
  String vendorId;
  String duration;
  String serviceId;
  String externalLogins;
  String returnUrl;
  String bookingData;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"] ?? 0,
    bookingServiceId: json["bookingServiceId"] ?? "",
    bookingServices: json["bookingServices"] ?? "",
    resource: json["resource"] ?? "",
    resourceId: json["resourceId"] ?? 0,
    startDateTime: json["startDateTime"] ?? "",
    endDateTime: json["endDateTime"] ?? "",
    isActive: json["isActive"] ?? false,
    booking: json["booking"] ?? false,
    countOfCapacity: json["countOfCapacity"] ?? 0,
    start: json["start"] ?? "",
    end: json["end"] ?? "",
    scheduleDate: json["scheduleDate"] ?? "",
    vendorId: json["vendorId"] ?? "",
    duration: json["duration"] ?? "",
    serviceId: json["serviceId"] ?? "",
    externalLogins: json["externalLogins"] ?? "",
    returnUrl: json["returnUrl"] ?? "",
    bookingData: json["bookingData"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookingServiceId": bookingServiceId,
    "bookingServices": bookingServices,
    "resource": resource,
    "resourceId": resourceId,
    "startDateTime": startDateTime,
    "endDateTime": endDateTime,
    "isActive": isActive,
    "booking": booking,
    "countOfCapacity": countOfCapacity,
    "start": start,
    "end": end,
    "scheduleDate": scheduleDate,
    "vendorId": vendorId,
    "duration": duration,
    "serviceId": serviceId,
    "externalLogins": externalLogins,
    "returnUrl": returnUrl,
    "bookingData": bookingData,
  };
}
