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
