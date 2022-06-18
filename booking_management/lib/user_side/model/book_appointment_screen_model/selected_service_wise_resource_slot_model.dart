// To parse this JSON data, do
//
//     final selectedServiceWiseResourceSlotModel = selectedServiceWiseResourceSlotModelFromJson(jsonString);

import 'dart:convert';

SelectedServiceWiseResourceSlotModel selectedServiceWiseResourceSlotModelFromJson(String str) => SelectedServiceWiseResourceSlotModel.fromJson(json.decode(str));

String selectedServiceWiseResourceSlotModelToJson(SelectedServiceWiseResourceSlotModel data) => json.encode(data.toJson());

class SelectedServiceWiseResourceSlotModel {
  SelectedServiceWiseResourceSlotModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<WorkerList> workerList;

  factory SelectedServiceWiseResourceSlotModel.fromJson(Map<String, dynamic> json) => SelectedServiceWiseResourceSlotModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<WorkerList>.from(json["workerList"].map((x) => WorkerList.fromJson(x ?? {})) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class WorkerList {
  WorkerList({
    required this.id,
    required this.resourceName,
    required this.details,
    required this.image,
    required this.isActive,
    // required this.applicationUserCreator,
    // required this.applicationUserModifier,
    required this.orderBy,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.vendorBooking,
    required this.vendorId,
    required this.price,
    required this.dDate,
    required this.duration,
    required this.avilableTime,
    required this.vendor,
    required this.bookingAvailability,
    required this.service,
  });

  int id;
  String resourceName;
  String details;
  String image;
  bool isActive;
  // dynamic applicationUserCreator;
  // dynamic applicationUserModifier;
  String orderBy;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  VendorBooking vendorBooking;
  int vendorId;
  int price;
  String dDate;
  String duration;
  String avilableTime;
  String vendor;
  String bookingAvailability;
  String service;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"] ?? 0,
    resourceName: json["resourceName"] ?? "",
    details: json["details"] ?? "",
    image: json["image"] ?? "",
    isActive: json["isActive"] ?? false,
    // applicationUserCreator: json["applicationUserCreator"],
    // applicationUserModifier: json["applicationUserModifier"],
    orderBy: json["orderBy"] ?? "",
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    vendorBooking: VendorBooking.fromJson(json["vendorBooking"] ?? {}),
    vendorId: json["vendorId"] ?? 0,
    price: json["price"] ?? 0,
    dDate: json["dDate"] ?? "",
    duration: json["duration"] ?? "",
    avilableTime: json["avilableTime"] ?? "",
    vendor: json["vendor"] ?? "",
    bookingAvailability: json["bookingAvailability"] ?? "",
    service: json["service"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "resourceName": resourceName,
    "details": details,
    "image": image,
    "isActive": isActive,
    // "applicationUserCreator": applicationUserCreator,
    // "applicationUserModifier": applicationUserModifier,
    "orderBy": orderBy,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "vendorBooking": vendorBooking.toJson(),
    "vendorId": vendorId,
    "price": price,
    "dDate": dDate,
    "duration": duration,
    "avilableTime": avilableTime,
    "vendor": vendor,
    "bookingAvailability": bookingAvailability,
    "service": service,
  };
}

class VendorBooking {
  VendorBooking({
    required this.id,
    // required this.categories,
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
    required this.firstPayment,
    required this.nextPayment,
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
    required this.resourceList,
    required this.resourceId,
    required this.service,
  });

  int id;
  // dynamic categories;
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
  String vendorPortal;
  bool vendorVerification;
  String businessId;
  bool isResource;
  bool isPriceDisplay;
  bool confirmation;
  bool isServiceSlots;
  String latitude;
  String longitude;
  String firstPayment;
  String nextPayment;
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
  String resourceList;
  String resourceId;
  String service;

  factory VendorBooking.fromJson(Map<String, dynamic> json) => VendorBooking(
    id: json["id"] ?? 0,
    // categories: json["categories"],
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
    vendorPortal: json["vendorPortal"] ?? "",
    vendorVerification: json["vendorVerification"] ?? false,
    businessId: json["businessId"] ?? "",
    isResource: json["isResource"] ?? false,
    isPriceDisplay: json["isPriceDisplay"] ?? false,
    confirmation: json["confirmation"] ?? false,
    isServiceSlots: json["isServiceSlots"] ?? false,
    latitude: json["latitude"] ?? "",
    longitude: json["longitude"] ?? "",
    firstPayment: json["firstPayment"] ?? "",
    nextPayment: json["nextPayment"] ?? "",
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
    resourceList: json["resourceList"] ?? "",
    resourceId: json["resourceId"] ?? "",
    service: json["service"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "categories": categories,
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
    "firstPayment": firstPayment,
    "nextPayment": nextPayment,
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
    "resourceList": resourceList,
    "resourceId": resourceId,
    "service": service,
  };
}
