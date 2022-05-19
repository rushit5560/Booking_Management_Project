import 'dart:convert';

GetAllAdditionalSlotModel getAllAdditionalSlotModelFromJson(String str) => GetAllAdditionalSlotModel.fromJson(json.decode(str));

String getAllAdditionalSlotModelToJson(GetAllAdditionalSlotModel data) => json.encode(data.toJson());

class GetAllAdditionalSlotModel {
  GetAllAdditionalSlotModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<AdditionalSlotWorkerList> workerList;

  factory GetAllAdditionalSlotModel.fromJson(Map<String, dynamic> json) => GetAllAdditionalSlotModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<AdditionalSlotWorkerList>.from(json["workerList"].map((x) => AdditionalSlotWorkerList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class AdditionalSlotWorkerList {
  AdditionalSlotWorkerList({
    this.id,
    this.name,
    this.categoryId,
    this.categories,
    this.mobileNo,
    this.shortDescription,
    this.longDescription,
    this.price,
    this.timeDuration,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.vendorBooking,
    this.vendorId,
    this.category,
    this.vendor,
  });

  int? id;
  String? name;
  int? categoryId;
  Categories? categories;
  String? mobileNo;
  String? shortDescription;
  String? longDescription;
  double? price;
  int? timeDuration;
  bool? isActive;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  String? vendorBooking;
  int? vendorId;
  String? category;
  String? vendor;

  factory AdditionalSlotWorkerList.fromJson(Map<String, dynamic> json) => AdditionalSlotWorkerList(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    categoryId: json["categoryId"] ?? 0,
    categories: Categories.fromJson(json["categories"] ?? {}),
    mobileNo: json["mobileNo"] ?? "",
    shortDescription: json["shortDescription"] ?? "",
    longDescription: json["longDescription"] ?? "",
    price: double.parse(json["price"].toString()),
    timeDuration: json["timeDuration"] ?? 0,
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    vendorBooking: json["vendorBooking"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    category: json["category"] ?? "",
    vendor: json["vendor"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "categoryId": categoryId,
    "categories": categories!.toJson(),
    "mobileNo": mobileNo,
    "shortDescription": shortDescription,
    "longDescription": longDescription,
    "price": price,
    "timeDuration": timeDuration,
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "vendorBooking": vendorBooking,
    "vendorId": vendorId,
    "category": category,
    "vendor": vendor,
  };
}

class Categories {
  Categories({
    required this.id,
    required this.name,
    required this.description,
    required this.parentId,
    required this.image,
    required this.orderBy,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.prefix,
    required this.isServiceSlots,
  });

  int id;
  String name;
  String description;
  int parentId;
  String image;
  int orderBy;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  String prefix;
  bool isServiceSlots;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
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
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "prefix": prefix,
    "isServiceSlots": isServiceSlots,
  };
}