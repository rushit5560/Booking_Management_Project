// To parse this JSON data, do
//
//     final vendorSignUpModel = vendorSignUpModelFromJson(jsonString);

import 'dart:convert';

VendorSignUpModel vendorSignUpModelFromJson(String str) => VendorSignUpModel.fromJson(json.decode(str));

String vendorSignUpModelToJson(VendorSignUpModel data) => json.encode(data.toJson());

class VendorSignUpModel {
  VendorSignUpModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  int statusCode;
  bool success;
  String message;
  Data data;

  factory VendorSignUpModel.fromJson(Map<String, dynamic> json) => VendorSignUpModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    this.categories,
    required this.categoryId,
    this.workingHours,
    required this.businessName,
    this.businessLogo,
    required this.street,
    required this.suburb,
    required this.postcode,
    required this.state,
    required this.country,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.address1,
    required this.address2,
    required this.isActive,
    required this.userId,
    this.vendorPortal,
    required this.vendorVerification,
    this.attachPhotoIndentification,
    this.attachProofofAddress,
    required this.applicationUser,
    this.modifiedBy,
    this.modifiedOn,
    this.applicationUserModifier,
    this.review,
    this.vendorWorkingHours,
    this.status,
    this.category,
    this.passwordHash,
  });

  int id;
  dynamic categories;
  int categoryId;
  dynamic workingHours;
  String businessName;
  dynamic businessLogo;
  String street;
  String suburb;
  String postcode;
  String state;
  String country;
  String firstName;
  String lastName;
  String email;
  String phoneNo;
  String address1;
  String address2;
  bool isActive;
  String userId;
  dynamic vendorPortal;
  bool vendorVerification;
  dynamic attachPhotoIndentification;
  dynamic attachProofofAddress;
  ApplicationUser applicationUser;
  dynamic modifiedBy;
  dynamic modifiedOn;
  dynamic applicationUserModifier;
  dynamic review;
  dynamic vendorWorkingHours;
  dynamic status;
  dynamic category;
  dynamic passwordHash;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    categories: json["categories"],
    categoryId: json["categoryId"],
    workingHours: json["workingHours"],
    businessName: json["businessName"],
    businessLogo: json["businessLogo"],
    street: json["street"],
    suburb: json["suburb"],
    postcode: json["postcode"],
    state: json["state"],
    country: json["country"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phoneNo: json["phoneNo"],
    address1: json["address1"],
    address2: json["address2"],
    isActive: json["isActive"],
    userId: json["userId"],
    vendorPortal: json["vendorPortal"],
    vendorVerification: json["vendorVerification"],
    attachPhotoIndentification: json["attachPhotoIndentification"],
    attachProofofAddress: json["attachProofofAddress"],
    applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
    modifiedBy: json["modifiedBy"],
    modifiedOn: json["modifiedOn"],
    applicationUserModifier: json["applicationUserModifier"],
    review: json["review"],
    vendorWorkingHours: json["vendorWorkingHours"],
    status: json["status"],
    category: json["category"],
    passwordHash: json["passwordHash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": categories,
    "categoryId": categoryId,
    "workingHours": workingHours,
    "businessName": businessName,
    "businessLogo": businessLogo,
    "street": street,
    "suburb": suburb,
    "postcode": postcode,
    "state": state,
    "country": country,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNo": phoneNo,
    "address1": address1,
    "address2": address2,
    "isActive": isActive,
    "userId": userId,
    "vendorPortal": vendorPortal,
    "vendorVerification": vendorVerification,
    "attachPhotoIndentification": attachPhotoIndentification,
    "attachProofofAddress": attachProofofAddress,
    "applicationUser": applicationUser.toJson(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserModifier": applicationUserModifier,
    "review": review,
    "vendorWorkingHours": vendorWorkingHours,
    "status": status,
    "category": category,
    "passwordHash": passwordHash,
  };
}

class ApplicationUser {
  ApplicationUser({
    this.frogotToken,
    required this.id,
    required this.userName,
    required this.normalizedUserName,
    required this.email,
    required this.normalizedEmail,
    required this.emailConfirmed,
    required this.passwordHash,
    required this.securityStamp,
    required this.concurrencyStamp,
    required this.phoneNumber,
    required this.phoneNumberConfirmed,
    required this.twoFactorEnabled,
    required this.lockoutEnd,
    required this.lockoutEnabled,
    required this.accessFailedCount,
  });

  dynamic frogotToken;
  String id;
  String userName;
  String normalizedUserName;
  String email;
  String normalizedEmail;
  bool emailConfirmed;
  String passwordHash;
  String securityStamp;
  String concurrencyStamp;
  String phoneNumber;
  bool phoneNumberConfirmed;
  bool twoFactorEnabled;
  dynamic lockoutEnd;
  bool lockoutEnabled;
  int accessFailedCount;

  factory ApplicationUser.fromJson(Map<String, dynamic> json) => ApplicationUser(
    frogotToken: json["frogotToken"],
    id: json["id"],
    userName: json["userName"],
    normalizedUserName: json["normalizedUserName"],
    email: json["email"],
    normalizedEmail: json["normalizedEmail"],
    emailConfirmed: json["emailConfirmed"],
    passwordHash: json["passwordHash"],
    securityStamp: json["securityStamp"],
    concurrencyStamp: json["concurrencyStamp"],
    phoneNumber: json["phoneNumber"],
    phoneNumberConfirmed: json["phoneNumberConfirmed"],
    twoFactorEnabled: json["twoFactorEnabled"],
    lockoutEnd: json["lockoutEnd"],
    lockoutEnabled: json["lockoutEnabled"],
    accessFailedCount: json["accessFailedCount"],
  );

  Map<String, dynamic> toJson() => {
    "frogotToken": frogotToken,
    "id": id,
    "userName": userName,
    "normalizedUserName": normalizedUserName,
    "email": email,
    "normalizedEmail": normalizedEmail,
    "emailConfirmed": emailConfirmed,
    "passwordHash": passwordHash,
    "securityStamp": securityStamp,
    "concurrencyStamp": concurrencyStamp,
    "phoneNumber": phoneNumber,
    "phoneNumberConfirmed": phoneNumberConfirmed,
    "twoFactorEnabled": twoFactorEnabled,
    "lockoutEnd": lockoutEnd,
    "lockoutEnabled": lockoutEnabled,
    "accessFailedCount": accessFailedCount,
  };
}
