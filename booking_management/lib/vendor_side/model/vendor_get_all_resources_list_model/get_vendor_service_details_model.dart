// To parse this JSON data, do
//
//     final getResourceDetailsModel = getResourceDetailsModelFromJson(jsonString);

import 'dart:convert';

GetResourceDetailsModel getResourceDetailsModelFromJson(String str) =>
    GetResourceDetailsModel.fromJson(json.decode(str));

String getResourceDetailsModelToJson(GetResourceDetailsModel data) =>
    json.encode(data.toJson());

class GetResourceDetailsModel {
  GetResourceDetailsModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  WorkerList workerList;

  factory GetResourceDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetResourceDetailsModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        workerList: WorkerList.fromJson(json["workerList"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "workerList": workerList.toJson(),
      };
}

class WorkerList {
  WorkerList({
    required this.id,
    required this.resourceName,
    required this.details,
    required this.image,
    required this.isActive,
    //required this.applicationUserCreator,
    //required this.applicationUserModifier,
    required this.orderBy,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.vendorBooking,
    required this.vendorId,
    required this.price,
    required this.capacity,
    required this.isEvent,
    required this.requireCriteria,
    required this.dDate,
    required this.duration,
    required this.avilableTime,
    required this.vendor,
    required this.bookingAvailability,
    required this.service,
    required this.criterias,
  });

  int id;
  String resourceName;
  String details;
  String image;
  bool isActive;
  //ApplicationUser applicationUserCreator;
  //ApplicationUser applicationUserModifier;
  String orderBy;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  String vendorBooking;
  int vendorId;
  double price;
  int capacity;
  bool isEvent;
  bool requireCriteria;
  String dDate;
  String duration;
  String avilableTime;
  String vendor;
  String bookingAvailability;
  String service;
  List<CriteriaData> criterias;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
        id: json["id"] ?? 0,
        resourceName: json["resourceName"] ?? "",
        details: json["details"] ?? "",
        image: json["image"] ?? "",
        isActive: json["isActive"] ?? false,
        //applicationUserCreator: ApplicationUser.fromJson(json["applicationUserCreator"] ?? {}),
        // applicationUserModifier: ApplicationUser.fromJson(json["applicationUserModifier"] ?? {}),
        orderBy: json["orderBy"] ?? "",
        createdBy: json["createdBy"] ?? "",
        createdOn: json["createdOn"] ?? "",
        modifiedBy: json["modifiedBy"] ?? "",
        modifiedOn: json["modifiedOn"] ?? "",
        vendorBooking: json["vendorBooking"] ?? "",
        vendorId: json["vendorId"] ?? 0,
        price: json["price"] ?? 0.0,
        capacity: json["capacity"] ?? 0,
        isEvent: json["isEvent"] ?? false,
        requireCriteria: json["requireCriteria"] ?? false,
        dDate: json["dDate"] ?? "",
        duration: json["duration"] ?? "",
        avilableTime: json["avilableTime"] ?? "",
        vendor: json["vendor"] ?? "",
        bookingAvailability: json["bookingAvailability"] ?? "",
        service: json["service"] ?? "",
        criterias: List<CriteriaData>.from(
            (json["criterias"] ?? []).map((x) => CriteriaData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resourceName": resourceName,
        "details": details,
        "image": image,
        "isActive": isActive,
        //"applicationUserCreator": applicationUserCreator.toJson(),
        //"applicationUserModifier": applicationUserModifier.toJson(),
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
        "requireCriteria": requireCriteria,
        "dDate": dDate,
        "duration": duration,
        "avilableTime": avilableTime,
        "vendor": vendor,
        "bookingAvailability": bookingAvailability,
        "service": service,
        "criterias": List<dynamic>.from(criterias.map((x) => x.toJson())),
      };
}

class CriteriaData {
  CriteriaData({
    required this.id,
    required this.resourceId,
    required this.name,
    required this.options,
  });

  final int id;
  final int resourceId;
  final String name;
  final String options;

  factory CriteriaData.fromJson(Map<String, dynamic> json) => CriteriaData(
        id: json["id"] ?? 0,
        resourceId: json["resourceId"] ?? 0,
        name: json["name"] ?? "",
        options: json["options"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resourceId": resourceId,
        "name": name,
        "options": options,
      };
}


/*class ApplicationUser {
  ApplicationUser({
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

  factory ApplicationUser.fromJson(Map<String, dynamic> json) => ApplicationUser(
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
    concurrencyStamp: json["concurrencyStamp"] ??"",
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
}*/
