// To parse this JSON data, do
//
//     final getAllResorcesListModel = getAllResorcesListModelFromJson(jsonString);

import 'dart:convert';

GetAllResorcesListModel getAllResorcesListModelFromJson(String str) => GetAllResorcesListModel.fromJson(json.decode(str));

String getAllResorcesListModelToJson(GetAllResorcesListModel data) => json.encode(data.toJson());

class GetAllResorcesListModel {
  GetAllResorcesListModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<WorkerList1> workerList;

  factory GetAllResorcesListModel.fromJson(Map<String, dynamic> json) => GetAllResorcesListModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<WorkerList1>.from(json["workerList"].map((x) => WorkerList1.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class WorkerList1 {
  WorkerList1({
    this.id,
    this.resourceName,
    this.details,
    this.image,
    this.isActive,
    this.orderBy,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.vendorBooking,
    this.vendorId,
    this.price,
    this.capacity,
    this.isEvent,
    this.dDate,
    this.duration,
    this.avilableTime,
    this.vendor,
    this.bookingAvailability,
    this.service,
  });

  int? id;
  String? resourceName;
  String? details;
  String? image;
  bool? isActive;
  String? orderBy;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  String? vendorBooking;
  int? vendorId;
  double? price;
  int? capacity;
  bool? isEvent;
  String? dDate;
  String? duration;
  String? avilableTime;
  String? vendor;
  String? bookingAvailability;
  String? service;

  factory WorkerList1.fromJson(Map<String, dynamic> json) => WorkerList1(
    id: json["id"] ?? 0,
    resourceName: json["resourceName"] ?? "",
    details: json["details"] ?? "",
    image: json["image"] ?? "",
    isActive: json["isActive"] ?? false,
    orderBy: json["orderBy"] ?? "",
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    vendorBooking: json["vendorBooking"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    price: double.parse(json["price"].toString()),
    capacity: json["capacity"] ?? 0,
    isEvent: json["isEvent"] ?? false,
    dDate: json["dDate"] ?? "",
    duration: json["duration"] ?? "",
    avilableTime: json["avilableTime"] ?? "",
    vendor: json["vendor"] ?? "",
    bookingAvailability: json["bookingAvailability"] ?? "",
    service: json["service"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "resourceName": resourceName,
    "details": details,
    "image": image,
    "isActive": isActive,
    "orderBy": orderBy,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "vendorBooking": vendorBooking,
    "vendorId": vendorId,
    "price": price,
    "capacity": capacity,
    "isEvent": isEvent,
    "dDate": dDate,
    "duration": duration,
    "avilableTime": avilableTime,
    "vendor": vendor,
    "bookingAvailability": bookingAvailability,
    "service": service,

  };
}


