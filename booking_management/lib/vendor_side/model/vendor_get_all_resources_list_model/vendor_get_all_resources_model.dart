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
  List<WorkerList> workerList;

  factory GetAllResorcesListModel.fromJson(Map<String, dynamic> json) => GetAllResorcesListModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<WorkerList>.from(json["workerList"].map((x) => WorkerList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class WorkerList {
  WorkerList({
    required this.id,
    required this.resourceName,
    required this.details,
    required this.image,
    required this.isActive,
    // required this.applicationUserCreator,
    // required this.applicationUserModifier,
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
  // ApplicationUserCreator applicationUserCreator;
  // String applicationUserModifier;
  String orderBy;
  String createdBy;
  DateTime createdOn;
  String modifiedBy;
  String modifiedOn;
  String vendorBooking;
  int vendorId;
  double price;
  String dDate;
  String duration;
  String avilableTime;
  String bookingAvailability;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"] ?? 0,
    resourceName: json["resourceName"] ?? "",
    details: json["details"] ?? "",
    image: json["image"] ?? "",
    isActive: json["isActive"] ?? false,
    // applicationUserCreator: ApplicationUserCreator.fromJson(json["applicationUserCreator"] ?? {}),
    // applicationUserModifier: json["applicationUserModifier"] ?? "",
    orderBy: json["orderBy"] ?? "",
    createdBy: json["createdBy"] ?? "",
    createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now()),
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    vendorBooking: json["vendorBooking"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    price: json["price"] ?? 0.0,
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
    // "applicationUserCreator": applicationUserCreator.toJson(),
    // "applicationUserModifier": applicationUserModifier,
    "orderBy": orderBy,
    "createdBy": createdBy,
    "createdOn": createdOn.toIso8601String(),
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

class ApplicationUserCreator {
  ApplicationUserCreator({
    required this.apiToken,
    required this.frogotToken,
    required this.id,
    required this.userName,
    required this.normalizedUserName,
    required this.email,
    required this.normalizedEmail,
    required this.emailConfirmed,
    required this.passwordHash,
    required this.securityStamp,
    required this.concurrencyStamp,
    required this.phoneNumber,
    required this.phoneNumberConfirmed,
    required this.twoFactorEnabled,
    required this.lockoutEnd,
    required this.lockoutEnabled,
    required this.accessFailedCount,
  });

  String apiToken;
  String frogotToken;
  String id;
  String userName;
  String normalizedUserName;
  String email;
  String normalizedEmail;
  bool emailConfirmed;
  String passwordHash;
  String securityStamp;
  String concurrencyStamp;
  String phoneNumber;
  bool phoneNumberConfirmed;
  bool twoFactorEnabled;
  String lockoutEnd;
  bool lockoutEnabled;
  int accessFailedCount;

  factory ApplicationUserCreator.fromJson(Map<String, dynamic> json) => ApplicationUserCreator(
    apiToken: json["apiToken"] ?? "",
    frogotToken: json["frogotToken"] ?? "",
    id: json["id"] ?? "",
    userName: json["userName"] ?? "",
    normalizedUserName: json["normalizedUserName"] ?? "",
    email: json["email"] ?? "",
    normalizedEmail: json["normalizedEmail"] ?? "",
    emailConfirmed: json["emailConfirmed"] ?? false,
    passwordHash: json["passwordHash"] ?? "",
    securityStamp: json["securityStamp"] ?? "",
    concurrencyStamp: json["concurrencyStamp"] ?? "",
    phoneNumber: json["phoneNumber"] ?? "",
    phoneNumberConfirmed: json["phoneNumberConfirmed"] ?? false,
    twoFactorEnabled: json["twoFactorEnabled"] ?? false,
    lockoutEnd: json["lockoutEnd"] ?? "",
    lockoutEnabled: json["lockoutEnabled"] ?? false,
    accessFailedCount: json["accessFailedCount"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "apiToken": apiToken,
    "frogotToken": frogotToken,
    "id": id,
    "userName": userName,
    "normalizedUserName": normalizedUserName,
    "email": email,
    "normalizedEmail": normalizedEmail,
    "emailConfirmed": emailConfirmed,
    "passwordHash": passwordHash,
    "securityStamp": securityStamp,
    "concurrencyStamp": concurrencyStamp,
    "phoneNumber": phoneNumber,
    "phoneNumberConfirmed": phoneNumberConfirmed,
    "twoFactorEnabled": twoFactorEnabled,
    "lockoutEnd": lockoutEnd,
    "lockoutEnabled": lockoutEnabled,
    "accessFailedCount": accessFailedCount,
  };
}
