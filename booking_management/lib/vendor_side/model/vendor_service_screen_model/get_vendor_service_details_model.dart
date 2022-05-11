import 'dart:convert';

GetServiceDetailsModel getServiceDetailsModelFromJson(String str) => GetServiceDetailsModel.fromJson(json.decode(str));

String getServiceDetailsModelToJson(GetServiceDetailsModel data) => json.encode(data.toJson());

class GetServiceDetailsModel {
  GetServiceDetailsModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  WorkerList workerList;

  factory GetServiceDetailsModel.fromJson(Map<String, dynamic> json) => GetServiceDetailsModel(
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
    required this.name,
    required this.categoryId,
    // required this.categories,
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
  // dynamic categories;
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

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    categoryId: json["categoryId"] ?? 0,
    // categories: json["categories"],
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
    // "categories": categories,
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
