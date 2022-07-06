import 'dart:convert';

VendorSubscriptionReportModel vendorSubscriptionReportModelFromJson(String str) => VendorSubscriptionReportModel.fromJson(json.decode(str));

String vendorSubscriptionReportModelToJson(VendorSubscriptionReportModel data) => json.encode(data.toJson());

class VendorSubscriptionReportModel {
  VendorSubscriptionReportModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<SubscriptionData> workerList;

  factory VendorSubscriptionReportModel.fromJson(Map<String, dynamic> json) => VendorSubscriptionReportModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<SubscriptionData>.from(json["workerList"].map((x) => SubscriptionData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class SubscriptionData {
  SubscriptionData({
    required this.id,
    required this.transactionFor,
    // required this.transactionForId,
    required this.transactionDate,
    required this.transactionCode,
    required this.transactionStatus,
    required this.detail,
    required this.transactionBy,
    // required this.applicationUsercustomer,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    // required this.applicationUserCreator,
    // required this.applicationUserModifier,
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
  // String transactionForId;
  String transactionDate;
  String transactionCode;
  String transactionStatus;
  String detail;
  String transactionBy;
  // ApplicationUser applicationUsercustomer;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  // String applicationUserCreator;
  // String applicationUserModifier;
  String bookingId;
  String paymentIntentId;
  String customer;
  String vendor;
  String order;
  String bookingItems;
  SubscriptionUser subscriptionUser;

  factory SubscriptionData.fromJson(Map<String, dynamic> json) => SubscriptionData(
    id: json["id"] ?? 0,
    transactionFor: json["transactionFor"] ?? "",
    // transactionForId: json["transactionForId"],
    transactionDate: json["transactionDate"] ?? "",
    transactionCode: json["transactionCode"] ?? "",
    transactionStatus: json["transactionStatus"] ?? "",
    detail: json["detail"] ?? "",
    transactionBy: json["transactionBy"] ?? "",
    // applicationUsercustomer: ApplicationUser.fromJson(json["applicationUsercustomer"]),
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    // applicationUserCreator: json["applicationUserCreator"],
    // applicationUserModifier: json["applicationUserModifier"],
    bookingId: json["bookingId"] ?? "",
    paymentIntentId: json["paymentIntentId"] ?? "",
    customer: json["customer"] ?? "",
    vendor: json["vendor"] ?? "",
    order: json["order"] ?? "",
    bookingItems: json["bookingItems"] ?? "",
    subscriptionUser: SubscriptionUser.fromJson(json["subscriptionUser"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transactionFor": transactionFor,
    // "transactionForId": transactionForId,
    "transactionDate": transactionDate,
    "transactionCode": transactionCode,
    "transactionStatus": transactionStatus,
    "detail": detail,
    "transactionBy": transactionBy,
    // "applicationUsercustomer": applicationUsercustomer.toJson(),
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    // "applicationUserCreator": applicationUserCreator,
    // "applicationUserModifier": applicationUserModifier,
    "bookingId": bookingId,
    "paymentIntentId": paymentIntentId,
    "customer": customer,
    "vendor": vendor,
    "order": order,
    "bookingItems": bookingItems,
    "subscriptionUser": subscriptionUser.toJson(),
  };
}


class SubscriptionUser {
  SubscriptionUser({
    required this.id,
    required this.userId,
    // required this.applicationUser,
    required this.subscriptionMasterId,
    required this.subscriptionMaster,
    required this.startDate,
    required this.expiryDate,
    required this.price,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    // this.applicationUserCreator,
    // this.applicationUserModifier,
  });

  int id;
  String userId;
  // ApplicationUser applicationUser;
  int subscriptionMasterId;
  String subscriptionMaster;
  String startDate;
  String expiryDate;
  String price;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  // ApplicationUser applicationUserCreator;
  // dynamic applicationUserModifier;

  factory SubscriptionUser.fromJson(Map<String, dynamic> json) => SubscriptionUser(
    id: json["id"] ?? 0,
    userId: json["userId"] ?? "",
    // applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
    subscriptionMasterId: json["subscriptionMasterId"] ?? 0,
    subscriptionMaster: json["subscriptionMaster"] ?? "",
    startDate: json["startDate"] ?? "",
    expiryDate: json["expiryDate"] ?? "",
    price: json["price"].toString(),
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    // applicationUserCreator: ApplicationUser.fromJson(json["applicationUserCreator"]),
    // applicationUserModifier: json["applicationUserModifier"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    // "applicationUser": applicationUser.toJson(),
    "subscriptionMasterId": subscriptionMasterId,
    "subscriptionMaster": subscriptionMaster,
    "startDate": startDate,
    "expiryDate": expiryDate,
    "price": price,
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    // "applicationUserCreator": applicationUserCreator.toJson(),
    // "applicationUserModifier": applicationUserModifier,
  };
}
