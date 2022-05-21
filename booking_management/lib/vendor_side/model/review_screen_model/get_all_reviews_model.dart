import 'dart:convert';

VendorAllReviewModel vendorAllReviewModelFromJson(String str) => VendorAllReviewModel.fromJson(json.decode(str));

String vendorAllReviewModelToJson(VendorAllReviewModel data) => json.encode(data.toJson());

class VendorAllReviewModel {
  VendorAllReviewModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<VendorReviewObject> workerList;

  factory VendorAllReviewModel.fromJson(Map<String, dynamic> json) => VendorAllReviewModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<VendorReviewObject>.from(json["workerList"].map((x) => VendorReviewObject.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class VendorReviewObject {
  VendorReviewObject({
    required this.id,
    // required this.vendor,
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
  // Vendor vendor;
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

  factory VendorReviewObject.fromJson(Map<String, dynamic> json) => VendorReviewObject(
    id: json["id"] ?? 0,
    // vendor: Vendor.fromJson(json["vendor"]),
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
    // "vendor": vendor.toJson(),
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
  // ApplicationUser applicationUser;
  String modifiedBy;
  String modifiedOn;
  // ApplicationUser applicationUserModifier;
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
    // applicationUser: json["applicationUser"] == null ? null : ApplicationUser.fromJson(json["applicationUser"]),
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    // applicationUserModifier: json["applicationUserModifier"] == null ? null : ApplicationUser.fromJson(json["applicationUserModifier"]),
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
    // "applicationUser": applicationUser == null ? null : applicationUser.toJson(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    // "applicationUserModifier": applicationUserModifier == null ? null : applicationUserModifier.toJson(),
    "passwordHash": passwordHash,
    "notes": notes,
    "bookingId": bookingId,
    "isPriceDisplay": isPriceDisplay,
  };
}


