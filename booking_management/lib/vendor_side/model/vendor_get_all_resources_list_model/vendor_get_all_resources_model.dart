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
    required this.id,
    required this.resourceName,
    required this.details,
    required this.image,
    required this.isActive,
    required this.orderBy,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.vendorBooking,
    required this.vendorId,
    required this.price,
    required this.dDate,
    required this.duration,
    required this.avilableTime,
    required this.bookingAvailability,
  });

  int id;
  String resourceName;
  String details;
  String image;
  bool isActive;
  String orderBy;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  String vendorBooking;
  int vendorId;
  double price;
  String dDate;
  String duration;
  String avilableTime;
  String bookingAvailability;

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
    dDate: json["dDate"] ?? "",
    duration: json["duration"] ?? "",
    avilableTime: json["avilableTime"] ?? "",
    bookingAvailability: json["bookingAvailability"] ?? "",
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
    "dDate": dDate,
    "duration": duration,
    "avilableTime": avilableTime,
    "bookingAvailability": bookingAvailability,
  };
}


