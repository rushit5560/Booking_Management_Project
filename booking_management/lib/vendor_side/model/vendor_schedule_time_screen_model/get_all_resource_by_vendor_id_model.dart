import 'dart:convert';

GetAllResourceByVendorIdModel getAllResourceByVendorIdModelFromJson(String str) => GetAllResourceByVendorIdModel.fromJson(json.decode(str));

String getAllResourceByVendorIdModelToJson(GetAllResourceByVendorIdModel data) => json.encode(data.toJson());

class GetAllResourceByVendorIdModel {
  GetAllResourceByVendorIdModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<AllResourcesWorkerList> workerList;

  factory GetAllResourceByVendorIdModel.fromJson(Map<String, dynamic> json) => GetAllResourceByVendorIdModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<AllResourcesWorkerList>.from(json["workerList"].map((x) => AllResourcesWorkerList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class AllResourcesWorkerList {
  AllResourcesWorkerList({
    required this.id,
    required this.resourceName,
    required this.details,
    required this.image,
    required this.isActive,
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
    required this.bookingAvailability,
    required this.timingList
  });

  int id;
  String resourceName;
  String details;
  String image;
  bool isActive;
  // ApplicationUser applicationUserCreator;
  // String applicationUserModifier;
  String orderBy;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  VendorBooking vendorBooking;
  int vendorId;
  double price;
  String dDate;
  int duration;
  String avilableTime;
  // String vendor;
  String bookingAvailability;
  List<String> timingList;

  factory AllResourcesWorkerList.fromJson(Map<String, dynamic> json) => AllResourcesWorkerList(
    id: json["id"] ?? 0,
    resourceName: json["resourceName"] ?? "",
    details: json["details"] ?? "",
    image: json["image"] ?? "",
    isActive: json["isActive"] ?? false,
    orderBy: json["orderBy"] ?? "",
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    vendorBooking: VendorBooking.fromJson(json["vendorBooking"] ?? {}),
    vendorId: json["vendorId"] ?? 0,
    price: double.parse(json["price"].toString()),
    dDate: json["dDate"] ?? "",
    duration: json["duration"] ?? 0,
    avilableTime: json["avilableTime"] ?? "",
    bookingAvailability: json["bookingAvailability"] ?? "",
    timingList: json['timingList'] ?? []
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "resourceName": resourceName,
    "details": details,
    "image": image,
    "isActive": isActive,
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
    "bookingAvailability": bookingAvailability,
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
    required this.vendorVerificationDate,
    required this.modifiedBy,
    required this.modifiedOn,
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
  // String categories;
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
  String modifiedBy;
  String modifiedOn;
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

  factory VendorBooking.fromJson(Map<String, dynamic> json) => VendorBooking(
    id: json["id"] ?? 0,
    // categories: json["categories"] ?? "",
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
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
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
    "vendorVerificationDate": vendorVerificationDate,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
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
