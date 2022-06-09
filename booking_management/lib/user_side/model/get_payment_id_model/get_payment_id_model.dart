// To parse this JSON data, do
//
//     final getPaymentIdModel = getPaymentIdModelFromJson(jsonString);

import 'dart:convert';

GetPaymentIdModel getPaymentIdModelFromJson(String str) => GetPaymentIdModel.fromJson(json.decode(str));

String getPaymentIdModelToJson(GetPaymentIdModel data) => json.encode(data.toJson());

class GetPaymentIdModel {
  GetPaymentIdModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  WorkerList workerList;

  factory GetPaymentIdModel.fromJson(Map<String, dynamic> json) => GetPaymentIdModel(
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
    required this.transactionFor,
    required this.transactionForId,
    required this.transactionDate,
    required this.transactionCode,
    required this.transactionStatus,
    required this.detail,
    required this.transactionBy,
    required this.applicationUsercustomer,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserCreator,
    required this.applicationUserModifier,
    required this.bookingId,
    required this.paymentIntentId,
    required this.customer,
    required this.vendor,
    required this.order,
    required this.bookingItems,
    required this.subscriptionUser,
  });

  int id;
  String transactionFor;
  String transactionForId;
  String transactionDate;
  String transactionCode;
  String transactionStatus;
  String detail;
  String transactionBy;
  ApplicationUser applicationUsercustomer;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  ApplicationUser applicationUserCreator;
  String applicationUserModifier;
  String bookingId;
  String paymentIntentId;
  String customer;
  String vendor;
  String order;
  String bookingItems;
  String subscriptionUser;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"] ?? 0,
    transactionFor: json["transactionFor"] ?? "",
    transactionForId: json["transactionForId"] ?? "",
    transactionDate: json["transactionDate"] ?? "",
    transactionCode: json["transactionCode"] ?? "",
    transactionStatus: json["transactionStatus"] ?? "",
    detail: json["detail"] ?? "",
    transactionBy: json["transactionBy"] ?? "",
    applicationUsercustomer: ApplicationUser.fromJson(json["applicationUsercustomer"] ?? {}),
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    applicationUserCreator: ApplicationUser.fromJson(json["applicationUserCreator"] ?? {}),
    applicationUserModifier: json["applicationUserModifier"] ?? "",
    bookingId: json["bookingId"] ?? "",
    paymentIntentId: json["paymentIntentId"] ?? "",
    customer: json["customer"] ?? "",
    vendor: json["vendor"] ?? "",
    order: json["order"] ?? "",
    bookingItems: json["bookingItems"] ?? "",
    subscriptionUser: json["subscriptionUser"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transactionFor": transactionFor,
    "transactionForId": transactionForId,
    "transactionDate": transactionDate,
    "transactionCode": transactionCode,
    "transactionStatus": transactionStatus,
    "detail": detail,
    "transactionBy": transactionBy,
    "applicationUsercustomer": applicationUsercustomer.toJson(),
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserCreator": applicationUserCreator.toJson(),
    "applicationUserModifier": applicationUserModifier,
    "bookingId": bookingId,
    "paymentIntentId": paymentIntentId,
    "customer": customer,
    "vendor": vendor,
    "order": order,
    "bookingItems": bookingItems,
    "subscriptionUser": subscriptionUser,
  };
}

class ApplicationUser {
  ApplicationUser({
    required this.apiToken,
    required this.frogotToken,
    required this.fcmToken,
    required this.returnUrl,
    required this.externalLogins,
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
  String fcmToken;
  String returnUrl;
  String externalLogins;
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
    fcmToken: json["fcmToken"] ?? "",
    returnUrl: json["returnUrl"] ?? "",
    externalLogins: json["externalLogins"] ?? "",
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
    "fcmToken": fcmToken,
    "returnUrl": returnUrl,
    "externalLogins": externalLogins,
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
