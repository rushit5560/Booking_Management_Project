// To parse this JSON data, do
//
//     final businessListModel = businessListModelFromJson(jsonString);

import 'dart:convert';

BusinessListModel businessListModelFromJson(String str) => BusinessListModel.fromJson(json.decode(str));

String businessListModelToJson(BusinessListModel data) => json.encode(data.toJson());

class BusinessListModel {
  BusinessListModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<Datum> data;

  factory BusinessListModel.fromJson(Map<String, dynamic> json) => BusinessListModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode.toString().isEmpty ? 0 : statusCode,
    "success": success.toString().isEmpty ? false : success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
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
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.isActive,
    required this.userId,
    required this.vendorPortal,
    required this.vendorVerification,
    required this.attachPhotoIndentification,
    required this.attachProofofAddress,
    required this.businessId,
    required this.resource,
    required this.payment,
    required this.confirmation,
    required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserModifier,
    required this.review,
    required this.vendorWorkingHours,
    required this.status,
    required this.category,
    required this.passwordHash,

    required this.workingHoursStatus,
    required this.avilableTime,
  });

  int id;
  String categories;
  int categoryId;
  //String workingHours;
  String businessName;
  String businessLogo;
  String street;
  String suburb;
  String postcode;
  String state;
  String country;
  String firstName;
  String lastName;
  String email;
  String phoneNo;
  String address;
  //String address2;
  bool isActive;
  String userId;
  bool vendorPortal;
  bool vendorVerification;
  String attachPhotoIndentification;
  String attachProofofAddress;
  String businessId;//add
  bool resource;//add
  bool payment;//add
  bool confirmation;//add
  String applicationUser;
  String modifiedBy;
  String modifiedOn;
  String applicationUserModifier;
  String review;
  int vendorWorkingHours;
  bool status;
  String category;
  String passwordHash;
  bool workingHoursStatus;
  String avilableTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    categories: json["categories"] ?? "",
    categoryId: json["categoryId"] ?? 0,
    //workingHours: json["workingHours"] ?? "",
    businessName: json["businessName"] ?? "",
    businessLogo: json["businessLogo"] ?? "",
    street: json["street"] ?? "",
    suburb: json["suburb"] ?? "",
    postcode: json["postcode"] ?? "",
    state: json["state"] ?? "",
    country: json["country"] ?? "",
    firstName: json["firstName"] ?? "",
    lastName: json["lastName"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    address: json["address"] ?? "",
    isActive: json["isActive"] ?? false,
    userId: json["userId"] ?? "",
    vendorPortal: json["vendorPortal"] ?? false,
    vendorVerification: json["vendorVerification"] ?? false,
    attachPhotoIndentification: json["attachPhotoIndentification"] ?? "",
    attachProofofAddress: json["attachProofofAddress"] ?? "",
    businessId: json["businessId"] ?? "",
    resource: json["resource"] ?? false,
    payment: json["payment"] ?? false,
    confirmation: json["confirmation"] ?? false,
    applicationUser: json["applicationUser"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: /*DateTime.parse(json["modifiedOn"] ?? DateTime.now())*/json["modifiedOn"] ?? "",
    applicationUserModifier: json["applicationUserModifier"] ?? "",
    review: json["review"] ?? "",
    vendorWorkingHours: json["vendorWorkingHours"] ?? 0,
    status: json["status"] ?? false,
    category: json["category"] ?? "",
    passwordHash: json["passwordHash"] ?? "",

    workingHoursStatus: json["workingHoursStatus"] ?? false,
    avilableTime: json["avilableTime"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id.toString().isEmpty ? 0 : id,
    "categories": categories.isEmpty ? "": categories,
    "categoryId": categoryId.toString().isEmpty ? 0 : categoryId,
    //"workingHours": workingHours.isEmpty ? "": workingHours,
    "businessName": businessName.isEmpty ? "": businessName,
    "businessLogo": businessLogo.isEmpty ? "": businessLogo,
    "street": street.isEmpty ? "": street,
    "suburb": suburb.isEmpty ? "": suburb,
    "postcode": postcode.isEmpty ? "": postcode,
    "state": state.isEmpty ? "": state,
    "country": country.isEmpty ? "": country,
    "firstName": firstName.isEmpty ? "": firstName,
    "lastName": lastName.isEmpty ? "": lastName,
    "email": email.isEmpty ? "": email,
    "phoneNo": phoneNo.isEmpty ? "": phoneNo,
    "address1": address.isEmpty ? "": address,
    //"address2": address2.isEmpty ? "": address2,
    "isActive": isActive.toString().isEmpty ? false : isActive,
    "userId": userId.isEmpty ? "": userId,
    "vendorPortal": vendorPortal.toString().isEmpty ? false : vendorPortal,
    "vendorVerification": vendorVerification.toString().isEmpty ? false : vendorVerification,
    "attachPhotoIndentification": attachPhotoIndentification.isEmpty ? "": attachPhotoIndentification,
    "attachProofofAddress": attachProofofAddress.isEmpty ? "": attachProofofAddress,
    "businessId": businessId.isEmpty ? "": businessId,
    "resource": resource,
    "payment": payment,
    "confirmation": confirmation,
    "applicationUser": applicationUser.isEmpty ? "": applicationUser,
    "modifiedBy": modifiedBy.isEmpty ? "": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserModifier": applicationUserModifier.isEmpty ? "": applicationUserModifier,
    "review": review.isEmpty ? "": review,
    "vendorWorkingHours": vendorWorkingHours.toString().isEmpty ? 0: vendorWorkingHours,
    "status": status.toString().isEmpty ? false : status,
    "category": category.isEmpty ? "": category,
    "passwordHash": passwordHash.isEmpty ? "": passwordHash,
    "workingHoursStatus": workingHoursStatus.toString().isEmpty ? false : workingHoursStatus,
    "avilableTime": avilableTime.isEmpty ? "": avilableTime,
  };
}
