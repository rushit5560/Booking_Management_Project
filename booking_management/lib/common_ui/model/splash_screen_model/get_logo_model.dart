// To parse this JSON data, do
//
//     final getLogoModel = getLogoModelFromJson(jsonString);

import 'dart:convert';

GetLogoModel getLogoModelFromJson(String str) => GetLogoModel.fromJson(json.decode(str));

String getLogoModelToJson(GetLogoModel data) => json.encode(data.toJson());

class GetLogoModel {
  GetLogoModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  WorkerList workerList;

  factory GetLogoModel.fromJson(Map<String, dynamic> json) => GetLogoModel(
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
    required this.mainLogo,
    required this.smallLogo,
    required this.splashLogo,
    required this.homeLogo,
    required this.isActive,
  });

  int id;
  String mainLogo;
  String smallLogo;
  String splashLogo;
  String homeLogo;
  bool isActive;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"] ?? 0,
    mainLogo: json["mainLogo"] ?? "",
    smallLogo: json["smallLogo"] ?? "",
    splashLogo: json["splashLogo"] ?? "",
    homeLogo: json["homeLogo"] ?? "",
    isActive: json["isActive"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mainLogo": mainLogo,
    "smallLogo": smallLogo,
    "splashLogo": splashLogo,
    "homeLogo": homeLogo,
    "isActive": isActive,
  };
}
