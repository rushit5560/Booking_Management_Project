// To parse this JSON data, do
//
//     final getResourceDetailsModel = getResourceDetailsModelFromJson(jsonString);

import 'dart:convert';

GetResourceDetailsModel getResourceDetailsModelFromJson(String str) => GetResourceDetailsModel.fromJson(json.decode(str));

String getResourceDetailsModelToJson(GetResourceDetailsModel data) => json.encode(data.toJson());

class GetResourceDetailsModel {
  GetResourceDetailsModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  WorkerList workerList;

  factory GetResourceDetailsModel.fromJson(Map<String, dynamic> json) => GetResourceDetailsModel(
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
    required this.dDate,
    required this.duration,
    required this.avilableTime,
    required this.vendor,
    required this.bookingAvailability,
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
  String dDate;
  String duration;
  String avilableTime;
  String vendor;
  String bookingAvailability;

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
    dDate: json["dDate"] ?? "",
    duration: json["duration"] ?? "",
    avilableTime: json["avilableTime"] ?? "",
    vendor: json["vendor"] ?? "",
    bookingAvailability: json["bookingAvailability"] ?? "",
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
    "dDate": dDate,
    "duration": duration,
    "avilableTime": avilableTime,
    "vendor": vendor,
    "bookingAvailability": bookingAvailability,
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
