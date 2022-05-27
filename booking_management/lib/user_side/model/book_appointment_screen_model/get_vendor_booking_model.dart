import 'dart:convert';

GetVendorBookingModel getVendorBookingModelFromJson(String str) => GetVendorBookingModel.fromJson(json.decode(str));

String getVendorBookingModelToJson(GetVendorBookingModel data) => json.encode(data.toJson());

class GetVendorBookingModel {
  GetVendorBookingModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  VendorBookingWorkerList workerList;

  factory GetVendorBookingModel.fromJson(Map<String, dynamic> json) => GetVendorBookingModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: VendorBookingWorkerList.fromJson(json["workerList"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": workerList.toJson(),
  };
}

class VendorBookingWorkerList {
  VendorBookingWorkerList({
    required this.id,
    required this.vendor,
    required this.vendorId,
    // this.customer,
    required this.customerId,
    required this.description,
    required this.ratting,
    required this.date,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    // this.applicationUserCreator,
    // this.applicationUserModifier,
  });

  int id;
  Vendor vendor;
  int vendorId;
  // String customer;
  int customerId;
  String description;
  int ratting;
  String date;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  // dynamic applicationUserCreator;
  // dynamic applicationUserModifier;

  factory VendorBookingWorkerList.fromJson(Map<String, dynamic> json) => VendorBookingWorkerList(
    id: json["id"] ?? 0,
    vendor: Vendor.fromJson(json["vendor"] ?? {}),
    vendorId: json["vendorId"] ?? 0,
    // customer: json["customer"],
    customerId: json["customerId"] ?? 0,
    description: json["description"] ?? "",
    ratting: json["ratting"] ?? 0,
    date: json["date"] ?? "",
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    // applicationUserCreator: json["applicationUserCreator"],
    // applicationUserModifier: json["applicationUserModifier"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor": vendor.toJson(),
    "vendorId": vendorId,
    // "customer": customer,
    "customerId": customerId,
    "description": description,
    "ratting": ratting,
    "date": date,
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    // "applicationUserCreator": applicationUserCreator,
    // "applicationUserModifier": applicationUserModifier,
  };
}

class Vendor {
  Vendor({
    required this.id,
    required this.categories,
    required this.categoryId,
    required this.businessName,
    required this.businessLogo,
    required this.street,
    required this.suburb,
    required this.postcode,
    required this.state,
    required this.country,
    required this.userName,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.isActive,
    required this.userId,
    required this.vendorPortal,
    required this.vendorVerification,
    required this.businessId,
    required this.isResource,
    required this.isPriceDisplay,
    required this.confirmation,
    required this.isServiceSlots,
    required this.latitude,
    required this.longitude,
    required this.vendorVerificationDate,
    // required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    // required this.applicationUserModifier,
    required this.review,
    required this.rating,
    required this.vendorWorkingHours,
    required this.status,
    required this.category,
    required this.passwordHash,
    required this.workingHoursStatus,
    required this.avilableTime,
    required this.dDate,
    required this.duration,
    required this.startTime,
    required this.endTime,
    required this.vendorList,
    required this.additionalSlot,
  });

  int id;
  Categories categories;
  int categoryId;
  String businessName;
  String businessLogo;
  String street;
  String suburb;
  String postcode;
  String state;
  String country;
  String userName;
  String email;
  String phoneNo;
  String address;
  bool isActive;
  String userId;
  bool vendorPortal;
  bool vendorVerification;
  String businessId;
  bool isResource;
  bool isPriceDisplay;
  bool confirmation;
  bool isServiceSlots;
  String latitude;
  String longitude;
  String vendorVerificationDate;
  // dynamic applicationUser;
  String modifiedBy;
  String modifiedOn;
  // dynamic applicationUserModifier;
  String review;
  String rating;
  String vendorWorkingHours;
  String status;
  String category;
  String passwordHash;
  String workingHoursStatus;
  String avilableTime;
  String dDate;
  String duration;
  String startTime;
  String endTime;
  String vendorList;
  String additionalSlot;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"] ?? 0,
    categories: Categories.fromJson(json["categories"] ?? {}),
    categoryId: json["categoryId"] ?? 0,
    businessName: json["businessName"] ?? "",
    businessLogo: json["businessLogo"] ?? "",
    street: json["street"] ?? "",
    suburb: json["suburb"] ?? "",
    postcode: json["postcode"] ?? "",
    state: json["state"] ?? "",
    country: json["country"] ?? "",
    userName: json["userName"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    address: json["address"] ?? "",
    isActive: json["isActive"] ?? false,
    userId: json["userId"] ?? "",
    vendorPortal: json["vendorPortal"] ?? false,
    vendorVerification: json["vendorVerification"] ?? false,
    businessId: json["businessId"] ?? "",
    isResource: json["isResource"] ?? false,
    isPriceDisplay: json["isPriceDisplay"] ?? false,
    confirmation: json["confirmation"] ?? false,
    isServiceSlots: json["isServiceSlots"] ?? false,
    latitude: json["latitude"] ?? "",
    longitude: json["longitude"] ?? "",
    vendorVerificationDate: json["vendorVerificationDate"] ?? "",
    // applicationUser: json["applicationUser"],
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    // applicationUserModifier: json["applicationUserModifier"],
    review: json["review"] ?? "",
    rating: json["rating"] ?? "",
    vendorWorkingHours: json["vendorWorkingHours"] ?? "",
    status: json["status"] ?? "",
    category: json["category"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
    workingHoursStatus: json["workingHoursStatus"] ?? "",
    avilableTime: json["avilableTime"] ?? "",
    dDate: json["dDate"] ?? "",
    duration: json["duration"] ?? "",
    startTime: json["startTime"] ?? "",
    endTime: json["endTime"] ?? "",
    vendorList: json["vendorList"] ?? "",
    additionalSlot: json["additionalSlot"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": categories.toJson(),
    "categoryId": categoryId,
    "businessName": businessName,
    "businessLogo": businessLogo,
    "street": street,
    "suburb": suburb,
    "postcode": postcode,
    "state": state,
    "country": country,
    "userName": userName,
    "email": email,
    "phoneNo": phoneNo,
    "address": address,
    "isActive": isActive,
    "userId": userId,
    "vendorPortal": vendorPortal,
    "vendorVerification": vendorVerification,
    "businessId": businessId,
    "isResource": isResource,
    "isPriceDisplay": isPriceDisplay,
    "confirmation": confirmation,
    "isServiceSlots": isServiceSlots,
    "latitude": latitude,
    "longitude": longitude,
    "vendorVerificationDate": vendorVerificationDate,
    // "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    // "applicationUserModifier": applicationUserModifier,
    "review": review,
    "rating": rating,
    "vendorWorkingHours": vendorWorkingHours,
    "status": status,
    "category": category,
    "passwordHash": passwordHash,
    "workingHoursStatus": workingHoursStatus,
    "avilableTime": avilableTime,
    "dDate": dDate,
    "duration": duration,
    "startTime": startTime,
    "endTime": endTime,
    "vendorList": vendorList,
    "additionalSlot": additionalSlot,
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
    // this.applicationUserCreator,
    // this.applicationUserModifier,
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
  // dynamic applicationUserCreator;
  // dynamic applicationUserModifier;
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
    // applicationUserCreator: json["applicationUserCreator"],
    // applicationUserModifier: json["applicationUserModifier"],
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
    // "applicationUserCreator": applicationUserCreator,
    // "applicationUserModifier": applicationUserModifier,
    "isServiceSlots": isServiceSlots,
  };
}
