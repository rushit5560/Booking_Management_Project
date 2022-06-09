// To parse this JSON data, do
//
//     final getStripeSecretKeyModel = getStripeSecretKeyModelFromJson(jsonString);

import 'dart:convert';

GetStripeSecretKeyModel getStripeSecretKeyModelFromJson(String str) => GetStripeSecretKeyModel.fromJson(json.decode(str));

String getStripeSecretKeyModelToJson(GetStripeSecretKeyModel data) => json.encode(data.toJson());

class GetStripeSecretKeyModel {
  GetStripeSecretKeyModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  WorkerList workerList;

  factory GetStripeSecretKeyModel.fromJson(Map<String, dynamic> json) => GetStripeSecretKeyModel(
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
    required this.secretKey,
    required this.publishableKey,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
  });

  int id;
  String secretKey;
  String publishableKey;
  bool isActive;
  String createdBy;
  DateTime createdOn;
  String modifiedBy;
  DateTime modifiedOn;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"] ?? 0,
    secretKey: json["secretKey"] ?? "",
    publishableKey: json["publishableKey"] ?? "",
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now()),
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: DateTime.parse(json["modifiedOn"] ?? DateTime.now()),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "secretKey": secretKey,
    "publishableKey": publishableKey,
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn.toIso8601String(),
  };
}
