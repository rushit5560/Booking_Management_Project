// To parse this JSON data, do
//
//     final getPrivacyPolicyModel = getPrivacyPolicyModelFromJson(jsonString);

import 'dart:convert';

GetPrivacyPolicyModel getPrivacyPolicyModelFromJson(String str) => GetPrivacyPolicyModel.fromJson(json.decode(str));

String getPrivacyPolicyModelToJson(GetPrivacyPolicyModel data) => json.encode(data.toJson());

class GetPrivacyPolicyModel {
  GetPrivacyPolicyModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  Data data;

  factory GetPrivacyPolicyModel.fromJson(Map<String, dynamic> json) => GetPrivacyPolicyModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.pageName,
    required this.pageContent,
    required this.pageTitle,
    required this.keyword,
    required this.description,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,

  });

  int id;
  String pageName;
  String pageContent;
  String pageTitle;
  String keyword;
  String description;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    pageName: json["pageName"] ?? "",
    pageContent: json["pageContent"] ?? "",
    pageTitle: json["pageTitle"] ?? "",
    keyword: json["keyword"] ?? "",
    description: json["description"] ?? "",
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pageName": pageName,
    "pageContent": pageContent,
    "pageTitle": pageTitle,
    "keyword": keyword,
    "description": description,
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
  };
}
