import 'dart:convert';

GetVendorReviewsModel getVendorReviewsModelFromJson(String str) => GetVendorReviewsModel.fromJson(json.decode(str));

String getVendorReviewsModelToJson(GetVendorReviewsModel data) => json.encode(data.toJson());

class GetVendorReviewsModel {
  GetVendorReviewsModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<ReviewDatum> data;

  factory GetVendorReviewsModel.fromJson(Map<String, dynamic> json) => GetVendorReviewsModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<ReviewDatum>.from(json["data"].map((x) => ReviewDatum.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ReviewDatum {
  ReviewDatum({
    required this.id,
    required this.vendor,
    required this.vendorId,
    required this.customer,
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
  Customer customer;
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

  factory ReviewDatum.fromJson(Map<String, dynamic> json) => ReviewDatum(
    id: json["id"] ?? 0,
    vendor: Vendor.fromJson(json["vendor"] ?? {}),
    vendorId: json["vendorId"] ?? 0,
    customer: Customer.fromJson(json["customer"] ?? {}),
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
    "customer": customer.toJson(),
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

class Customer {
  Customer({
    required this.id,
    required this.email,
    required this.phoneNo,
    required this.gender,
    required this.userName,
    required this.dateOfBirth,
    required this.isActive,
    required this.userId,
    // this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    // this.applicationUserModifier,
    required this.passwordHash,
    required this.notes,
    required this.bookingId,
    required this.isPriceDisplay,
  });

  int id;
  String email;
  String phoneNo;
  String gender;
  String userName;
  String dateOfBirth;
  bool isActive;
  String userId;
  // dynamic applicationUser;
  String modifiedBy;
  String modifiedOn;
  // dynamic applicationUserModifier;
  String passwordHash;
  String notes;
  String bookingId;
  bool isPriceDisplay;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"] ?? 0,
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    gender: json["gender"] ?? "",
    userName: json["userName"] ?? "",
    dateOfBirth: json["dateOfBirth"] ?? "",
    isActive: json["isActive"] ?? false,
    userId: json["userId"] ?? "",
    // applicationUser: json["applicationUser"],
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    // applicationUserModifier: json["applicationUserModifier"],
    passwordHash: json["passwordHash"] ?? "",
    notes: json["notes"] ?? "",
    bookingId: json["bookingId"] ?? "",
    isPriceDisplay: json["isPriceDisplay"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phoneNo": phoneNo,
    "gender": gender,
    "userName": userName,
    "dateOfBirth": dateOfBirth,
    "isActive": isActive,
    "userId": userId,
    // "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    // "applicationUserModifier": applicationUserModifier,
    "passwordHash": passwordHash,
    "notes": notes,
    "bookingId": bookingId,
    "isPriceDisplay": isPriceDisplay,
  };
}

class Vendor {
  Vendor({
    required this.id,
    // this.categories,
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
    // this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    // this.applicationUserModifier,
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
    id: json["id"] ?? "",
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
