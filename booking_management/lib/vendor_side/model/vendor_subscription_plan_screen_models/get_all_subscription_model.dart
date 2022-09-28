/*
import 'dart:convert';

GetAllSubscriptionModel getAllSubscriptionModelFromJson(String str) => GetAllSubscriptionModel.fromJson(json.decode(str));

String getAllSubscriptionModelToJson(GetAllSubscriptionModel data) => json.encode(data.toJson());

class GetAllSubscriptionModel {
  GetAllSubscriptionModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<SubscriptionWorkerList> workerList;

  factory GetAllSubscriptionModel.fromJson(Map<String, dynamic> json) => GetAllSubscriptionModel(
    statusCode: json["statusCode"],
    success: json["success"],
    workerList: List<SubscriptionWorkerList>.from(json["workerList"].map((x) => SubscriptionWorkerList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class SubscriptionWorkerList {
  SubscriptionWorkerList({
    required this.id,
    required this.name,
    required this.detail,
    required this.days,
    required this.price,
    required this.image,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
  });

  int id;
  String name;
  String detail;
  int days;
  double price;
  String image;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;

  factory SubscriptionWorkerList.fromJson(Map<String, dynamic> json) => SubscriptionWorkerList(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    detail: json["detail"] ?? "",
    days: json["days"] ?? 0,
    price: double.parse(json["price"].toString()),
    image: json["image"] ?? "",
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "detail": detail,
    "days": days,
    "price": price,
    "image": image,
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
  };
}
*/

import 'dart:convert';

GetAllSubscriptionPlanModel getAllSubscriptionPlanModelFromJson(String str) =>
    GetAllSubscriptionPlanModel.fromJson(json.decode(str));

String getAllSubscriptionPlanModelToJson(GetAllSubscriptionPlanModel data) =>
    json.encode(data.toJson());

class GetAllSubscriptionPlanModel {
  GetAllSubscriptionPlanModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<SubscriptionWorkerList> workerList;

  factory GetAllSubscriptionPlanModel.fromJson(Map<String, dynamic> json) =>
      GetAllSubscriptionPlanModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        workerList: List<SubscriptionWorkerList>.from(json["workerList"]
            .map((x) => SubscriptionWorkerList.fromJson(x ?? {}))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
      };
}

class SubscriptionWorkerList {
  SubscriptionWorkerList({
    required this.id,
    required this.name,
    required this.detail,
    required this.interval,
    required this.price,
    required this.image,
    required this.isActive,
    required this.currency,
    // required this.finalPrice,
    required this.discountApplied,
    required this.stripeSubscriptionId,
    required this.priceId,
  });

  String id;
  String name;
  String detail;
  String interval;
  int price;
  String image;
  bool isActive;
  String currency;
  // dynamic finalPrice;
  bool discountApplied;
  String stripeSubscriptionId;
  String priceId;

  factory SubscriptionWorkerList.fromJson(Map<String, dynamic> json) =>
      SubscriptionWorkerList(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        detail: json["detail"] ?? "",
        interval: json["interval"] ?? "",
        price: json["price"].toInt() ?? 0,
        image: json["image"] ?? "",
        isActive: json["isActive"] ?? false,
        currency: json["currency"] ?? "",
        // finalPrice: json["finalPrice"],
        discountApplied: json["discountApplied"] ?? false,
        stripeSubscriptionId: json["stripeSubscriptionId"] ?? "",
        priceId: json["priceId"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "detail": detail,
        "interval": interval,
        "price": price,
        "image": image,
        "isActive": isActive,
        "currency": currency,
        // "finalPrice": finalPrice,
        "discountApplied": discountApplied,
        "stripeSubscriptionId": stripeSubscriptionId,
        "priceId": priceId,
      };
}
