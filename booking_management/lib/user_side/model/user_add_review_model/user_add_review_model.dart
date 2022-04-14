// To parse this JSON data, do
//
//     final userAddReviewModel = userAddReviewModelFromJson(jsonString);

import 'dart:convert';

UserAddReviewModel userAddReviewModelFromJson(String str) => UserAddReviewModel.fromJson(json.decode(str));

String userAddReviewModelToJson(UserAddReviewModel data) => json.encode(data.toJson());

class UserAddReviewModel {
  UserAddReviewModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  int statusCode;
  bool success;
  String message;
  Data data;

  factory UserAddReviewModel.fromJson(Map<String, dynamic> json) => UserAddReviewModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.vendor,
    required this.vendorId,
    required this.customer,
    required this.customerId,
    required this.description,
    required this.ratting,
    required this.date,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserCreator,
    required this.applicationUserModifier,
  });

  int id;
  String vendor;
  int vendorId;
  String customer;
  int customerId;
  String description;
  int ratting;
  String date;
  bool isActive;
  String createdBy;
  DateTime createdOn;
  String modifiedBy;
  DateTime modifiedOn;
  String applicationUserCreator;
  String applicationUserModifier;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    vendor: json["vendor"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    customer: json["customer"] ?? "",
    customerId: json["customerId"] ?? 0,
    description: json["description"] ?? "",
    ratting: json["ratting"] ?? 0,
    date: json["date"] ?? "",
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now()),
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: DateTime.parse(json["modifiedOn"] ?? DateTime.now()),
    applicationUserCreator: json["applicationUserCreator"] ?? "",
    applicationUserModifier: json["applicationUserModifier"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor": vendor,
    "vendorId": vendorId,
    "customer": customer,
    "customerId": customerId,
    "description": description,
    "ratting": ratting,
    "date": date,
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn.toIso8601String(),
    "applicationUserCreator": applicationUserCreator,
    "applicationUserModifier": applicationUserModifier,
  };
}
