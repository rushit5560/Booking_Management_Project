import 'dart:convert';

GetAllVendorServiceModel getAllVendorServiceModelFromJson(String str) => GetAllVendorServiceModel.fromJson(json.decode(str));

String getAllVendorServiceModelToJson(GetAllVendorServiceModel data) => json.encode(data.toJson());

class GetAllVendorServiceModel {
  GetAllVendorServiceModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<WorkerList1> workerList;

  factory GetAllVendorServiceModel.fromJson(Map<String, dynamic> json) => GetAllVendorServiceModel(
    statusCode: json["statusCode"],
    success: json["success"],
    workerList: List<WorkerList1>.from(json["workerList"].map((x) => WorkerList1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class WorkerList1 {
  WorkerList1({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.categories,
    required this.mobileNo,
    required this.shortDescription,
    required this.longDescription,
    required this.price,
    required this.timeDuration,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.vendorBooking,
    required this.vendorId,
    required this.category,
    required this.vendor,
    required this.review,
  });

  int id;
  String name;
  int categoryId;
  Categories categories;
  String mobileNo;
  String shortDescription;
  String longDescription;
  double price;
  int timeDuration;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  String vendorBooking;
  int vendorId;
  String category;
  String vendor;
  String review;

  factory WorkerList1.fromJson(Map<String, dynamic> json) => WorkerList1(
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
    review: json["review"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "categoryId": categoryId,
    "categories": categories.toJson(),
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
    "review": review,
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
