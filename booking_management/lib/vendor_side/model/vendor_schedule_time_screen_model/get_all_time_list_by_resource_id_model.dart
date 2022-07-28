import 'dart:convert';

GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModelFromJson(String str) => GetAllTimeListByResourceIdModel.fromJson(json.decode(str));

String getAllTimeListByResourceIdModelToJson(GetAllTimeListByResourceIdModel data) => json.encode(data.toJson());

class GetAllTimeListByResourceIdModel {
  GetAllTimeListByResourceIdModel({
    required this.statusCode,
    required this.success,
    this.workerList,
    required this.errorMessage,
    required this.nextDate,
  });

  int statusCode;
  bool success;
  List<ResourcesTimeWorkerList>? workerList;
  String errorMessage;
  String nextDate;

  factory GetAllTimeListByResourceIdModel.fromJson(Map<String, dynamic> json) => GetAllTimeListByResourceIdModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<ResourcesTimeWorkerList>.from(json["workerList"].map((x) => ResourcesTimeWorkerList.fromJson(x ?? {})) ?? []).isEmpty
        ? []
        : List<ResourcesTimeWorkerList>.from(json["workerList"].map((x) => ResourcesTimeWorkerList.fromJson(x ?? {})) ?? []),
    errorMessage: json["errorMessage"] ?? "",
    nextDate: json["nextDate"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList!.map((x) => x.toJson())),
    "errorMessage": errorMessage,
    "nextDate": nextDate,
  };
}

class ResourcesTimeWorkerList {
  ResourcesTimeWorkerList({
    required this.id,
    required this.bookingServiceId,
    required this.bookingServices,
    required this.resource,
    required this.resourceId,
    required this.startDateTime,
    required this.endDateTime,
    required this.isActive,
    required this.booking,
    required this.start,
    required this.end,
    required this.scheduleDate,
    required this.vendorId,
    required this.duration,
    required this.serviceId,
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
  String start;
  String end;
  String scheduleDate;
  String vendorId;
  String duration;
  String serviceId;

  factory ResourcesTimeWorkerList.fromJson(Map<String, dynamic> json) => ResourcesTimeWorkerList(
    id: json["id"] ?? 0,
    bookingServiceId: json["bookingServiceId"] ?? "",
    bookingServices: json["bookingServices"] ?? "",
    resource: json["resource"] ?? "",
    resourceId: json["resourceId"] ?? 0,
    startDateTime: json["startDateTime"] ?? "",
    endDateTime: json["endDateTime"] ?? "",
    isActive: json["isActive"] ?? false,
    booking: json["booking"] ?? false,
    start: json["start"] ?? "",
    end: json["end"] ?? "",
    scheduleDate: json["scheduleDate"] ?? "",
    vendorId: json["vendorId"] ?? "",
    duration: json["duration"] ?? "",
    serviceId: json["serviceId"] ?? "",
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
    "start": start,
    "end": end,
    "scheduleDate": scheduleDate,
    "vendorId": vendorId,
    "duration": duration,
    "serviceId": serviceId,
  };
}
