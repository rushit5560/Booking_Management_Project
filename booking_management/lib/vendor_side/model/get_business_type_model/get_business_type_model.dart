// To parse this JSON data, do
//
//     final getAllBusinessTypeModel = getAllBusinessTypeModelFromJson(jsonString);

import 'dart:convert';

GetAllBusinessTypeModel getAllBusinessTypeModelFromJson(String str) => GetAllBusinessTypeModel.fromJson(json.decode(str));

String getAllBusinessTypeModelToJson(GetAllBusinessTypeModel data) => json.encode(data.toJson());

class GetAllBusinessTypeModel {
  GetAllBusinessTypeModel({
     this.statusCode,
     this.success,
     this.data,
  });

  int ? statusCode;
  bool ? success;
  List<Datum> ?  data;

  factory GetAllBusinessTypeModel.fromJson(Map<String, dynamic> json) => GetAllBusinessTypeModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
     this.id,
     this.name,
     this.description,
     this.parentId,
     this.image,
     this.orderBy,
     this.isActive,
     this.createdBy,
     this.createdOn,
     this.modifiedBy,
     this.modifiedOn,
     this.prefix,
     //this.applicationUserCreator,
     //this.applicationUserModifier,
     this.isServiceSlots,
  });

  int ? id;
  String ? name;
  String ? description;
  int ? parentId;
  String ? image;
  int ? orderBy;
  bool ? isActive;
  String ? createdBy;
  String ? createdOn;
  String ? modifiedBy;
  String ? modifiedOn;
  String ? prefix;
  //String ? applicationUserCreator;
  //String ? applicationUserModifier;
  bool ? isServiceSlots;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    parentId: json["parentId"] ?? 0,
    image: json["image"] ?? "",
    orderBy: json["orderBy"] ?? 0,
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    prefix: json["prefix"] ?? "",
    //applicationUserCreator: json["applicationUserCreator"] ?? "",
    //applicationUserModifier: json["applicationUserModifier"] ?? "",
    isServiceSlots: json["isServiceSlots"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "parentId": parentId,
    "image": image,
    "orderBy": orderBy,
    "isActive": isActive,
    "createdBy": createdBy == null ? null : createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "prefix": prefix == null ? null : prefix,
    //"applicationUserCreator": applicationUserCreator,
    //"applicationUserModifier": applicationUserModifier,
    "isServiceSlots": isServiceSlots,
  };
}
