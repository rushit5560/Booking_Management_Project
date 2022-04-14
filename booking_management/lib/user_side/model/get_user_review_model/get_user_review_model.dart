// To parse this JSON data, do
//
//     final getUserReviewModel = getUserReviewModelFromJson(jsonString);

import 'dart:convert';

GetUserReviewModel getUserReviewModelFromJson(String str) => GetUserReviewModel.fromJson(json.decode(str));

String getUserReviewModelToJson(GetUserReviewModel data) => json.encode(data.toJson());

class GetUserReviewModel {
  GetUserReviewModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<Datum> data;

  factory GetUserReviewModel.fromJson(Map<String, dynamic> json) => GetUserReviewModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
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
    required this.applicationUserCreator,
    required this.applicationUserModifier,
  });

  int id;
  Vendor vendor;
  int vendorId;
  Customer customer;
  int customerId;
  String description;
  int ratting;
  DateTime date;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  String applicationUserCreator;
  String applicationUserModifier;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    vendor: Vendor.fromJson(json["vendor"]),
    vendorId: json["vendorId"] ?? 0,
    customer: Customer.fromJson(json["customer"]),
    customerId: json["customerId"] ?? 0,
    description: json["description"] ?? "",
    ratting: json["ratting"] ?? 0,
    date: DateTime.parse(json["date"] ?? DateTime.now()),
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    applicationUserCreator: json["applicationUserCreator"] ?? "",
    applicationUserModifier: json["applicationUserModifier"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor": vendor.toJson(),
    "vendorId": vendorId,
    "customer": customer.toJson(),
    "customerId": customerId,
    "description": description,
    "ratting": ratting,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserCreator": applicationUserCreator,
    "applicationUserModifier": applicationUserModifier,
  };
}

class Customer {
  Customer({
    required this.id,
    //required this.state,
    //required this.city,
    required this.email,
    required this.phoneNo,
    //required this.image,
    required this.gender,
    //required this.about,
    //required this.lastVisit,
    required this.userName,
    //required this.lastName,
    //required this.faxNumber,
    required this.dateOfBirth,
    required this.isActive,
    required this.userId,
    required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserModifier,
    required this.passwordHash,
  });

  int id;
  // String state;
  // String city;
  String email;
  String phoneNo;
  //String image;
  String gender;
  // String about;
  // String lastVisit;
  String userName;
  //String lastName;
  //String faxNumber;
  DateTime dateOfBirth;
  bool isActive;
  String userId;
  String applicationUser;
  String modifiedBy;
  String modifiedOn;
  String applicationUserModifier;
  String passwordHash;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"] ?? 0,
    // state: json["state"] ?? "",
    // city: json["city"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
   // image: json["image"] ?? "",
    gender: json["gender"] ?? "",
    // about: json["about"] ?? "",
    // lastVisit: json["lastVisit"] ?? "",
    userName: json["userName"] ?? "",
    // lastName: json["lastName"] ?? "",
    // faxNumber: json["faxNumber"] ?? "",
    dateOfBirth: DateTime.parse(json["dateOfBirth"] ?? DateTime.now()),
    isActive: json["isActive"] ?? false,
    userId: json["userId"] ?? "",
    applicationUser: json["applicationUser"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    applicationUserModifier: json["applicationUserModifier"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "state": state,
    // "city": city,
    "email": email,
    "phoneNo": phoneNo,
    //"image": image,
    "gender": gender,
    // "about": about,
    // "lastVisit": lastVisit,
    "userName": userName,
    // "lastName": lastName,
    // "faxNumber": faxNumber,
    "dateOfBirth": dateOfBirth.toIso8601String(),
    "isActive": isActive,
    "userId": userId,
    "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserModifier": applicationUserModifier,
    "passwordHash": passwordHash,
  };
}

class Vendor {
  Vendor({
    required this.id,
    required this.categories,
    required this.categoryId,
    //required this.workingHours,
    required this.businessName,
    required this.businessLogo,
    required this.street,
    required this.suburb,
    required this.postcode,
    required this.state,
    required this.country,
    required this.userName,
    //required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.address,
    //required this.address2,
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
    required this.vendorVerificationDate,
    required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserModifier,
    required this.review,
    required this.rating,
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
  String userName;
  //String lastName;
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
  String businessId;
  bool resource;
  bool payment;
  bool confirmation;
  DateTime vendorVerificationDate;
  String applicationUser;
  String modifiedBy;
  DateTime modifiedOn;
  String applicationUserModifier;
  String review;
  String rating;
  String vendorWorkingHours;
  String status;
  String category;
  String passwordHash;
  String workingHoursStatus;
  String avilableTime;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
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
    userName: json["userName"] ?? "",
    //lastName: json["lastName"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    address: json["address"] ?? "",
    //address2: json["address2"] ?? "",
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
    vendorVerificationDate: DateTime.parse(json["vendorVerificationDate"] ?? DateTime.now()),
    applicationUser: json["applicationUser"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: DateTime.parse(json["modifiedOn"] ?? DateTime.now()),
    applicationUserModifier: json["applicationUserModifier"] ?? "",
    review: json["review"] ?? "",
    rating: json["rating"] ?? "",
    vendorWorkingHours: json["vendorWorkingHours"] ?? "",
    status: json["status"] ?? "",
    category: json["category"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
    workingHoursStatus: json["workingHoursStatus"] ?? "",
    avilableTime: json["avilableTime"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": categories,
    "categoryId": categoryId,
    //"workingHours": workingHours,
    "businessName": businessName,
    "businessLogo": businessLogo,
    "street": street,
    "suburb": suburb,
    "postcode": postcode,
    "state": state,
    "country": country,
    "userName": userName,
    //"lastName": lastName,
    "email": email,
    "phoneNo": phoneNo,
    "address": address,
    //"address2": address2,
    "isActive": isActive,
    "userId": userId,
    "vendorPortal": vendorPortal,
    "vendorVerification": vendorVerification,
    "attachPhotoIndentification": attachPhotoIndentification,
    "attachProofofAddress": attachProofofAddress,
    "businessId": businessId,
    "resource": resource,
    "payment": payment,
    "confirmation": confirmation,
    "vendorVerificationDate": vendorVerificationDate.toIso8601String(),
    "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn.toIso8601String(),
    "applicationUserModifier": applicationUserModifier,
    "review": review,
    "rating": rating,
    "vendorWorkingHours": vendorWorkingHours,
    "status": status,
    "category": category,
    "passwordHash": passwordHash,
    //"businessId": businessId,
    "workingHoursStatus": workingHoursStatus,
    "avilableTime": avilableTime,
  };
}
