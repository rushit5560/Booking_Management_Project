/*
import 'dart:convert';

GetFavouriteVendorModel getFavouriteVendorModelFromJson(String str) => GetFavouriteVendorModel.fromJson(json.decode(str));

String getFavouriteVendorModelToJson(GetFavouriteVendorModel data) => json.encode(data.toJson());

class GetFavouriteVendorModel {
  GetFavouriteVendorModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<FavouriteVendorDetails> data;

  factory GetFavouriteVendorModel.fromJson(Map<String, dynamic> json) => GetFavouriteVendorModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<FavouriteVendorDetails>.from(json["data"].map((x) => FavouriteVendorDetails.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class FavouriteVendorDetails {
  FavouriteVendorDetails({
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
  // String applicationUser;
  String modifiedBy;
  String modifiedOn;
  // String applicationUserModifier;
  String review;
  int rating;
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

  factory FavouriteVendorDetails.fromJson(Map<String, dynamic> json) => FavouriteVendorDetails(
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
    rating: json["rating"] ?? 0,
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
    "resourceList": resourceList,
    "resourceId": resourceId,
  };
}*/


import 'dart:convert';

GetFavouriteVendorModel getFavouriteVendorModelFromJson(String str) => GetFavouriteVendorModel.fromJson(json.decode(str));

String getFavouriteVendorModelToJson(GetFavouriteVendorModel data) => json.encode(data.toJson());

class GetFavouriteVendorModel {
  GetFavouriteVendorModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<FavouriteVendorDetails> data;

  factory GetFavouriteVendorModel.fromJson(Map<String, dynamic> json) => GetFavouriteVendorModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<FavouriteVendorDetails>.from((json["data"] ?? []).map((x) => FavouriteVendorDetails.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class FavouriteVendorDetails {
  FavouriteVendorDetails({
    required this.id,
    // this.categories,
    required this.categoryId,
    required this.businessName,
    required this.businessLogo,
    // this.street,
    // this.suburb,
    // this.postcode,
    // this.state,
    // this.country,
    // this.userName,
    required this.email,
    // this.phoneNo,
    // this.address,
    // this.isActive,
    required this.userId,
    // this.vendorPortal,
    // this.vendorVerification,
    // this.businessId,
    // this.isResource,
    // this.isPriceDisplay,
    // this.confirmation,
    // this.isServiceSlots,
    // this.latitude,
    // this.longitude,
    // this.firstPayment,
    // this.nextPayment,
    // this.vendorVerificationDate,
    // this.applicationUser,
    // this.modifiedBy,
    // this.modifiedOn,
    // this.applicationUserModifier,
    // this.review,
    // this.rating,
    // this.vendorWorkingHours,
    // this.status,
    // this.category,
    // this.passwordHash,
    // this.workingHoursStatus,
    // this.avilableTime,
    // this.dDate,
    // this.duration,
    // this.startTime,
    // this.endTime,
    // this.vendorList,
    // this.additionalSlot,
    // this.resourceList,
    // this.resourceId,
    // this.service,
    // this.resource,
    // this.termsConditions,
    // this.fullName,
    // this.stripeId,
    // this.vendorStripeAccountId,
    // this.financialInstitutionName,
    // this.accountName,
    // this.accountCode,
    // this.accountNumber,
    // this.countryList,
    // this.userDateTime,
  });

  int id;
  // dynamic categories;
  int categoryId;
  String businessName;
  String businessLogo;
  // dynamic street;
  // dynamic suburb;
  // dynamic postcode;
  // dynamic state;
  // String country;
  // String userName;
  String email;
  // String phoneNo;
  // String address;
  // bool isActive;
  String userId;
  // bool vendorPortal;
  // bool vendorVerification;
  // String businessId;
  // bool isResource;
  // bool isPriceDisplay;
  // bool confirmation;
  // bool isServiceSlots;
  // String latitude;
  // String longitude;
  // DateTime firstPayment;
  // DateTime nextPayment;
  // DateTime vendorVerificationDate;
  // dynamic applicationUser;
  // String modifiedBy;
  // DateTime modifiedOn;
  // dynamic applicationUserModifier;
  // Review review;
  // dynamic rating;
  // dynamic vendorWorkingHours;
  // dynamic status;
  // dynamic category;
  // dynamic passwordHash;
  // String workingHoursStatus;
  // String avilableTime;
  // DateTime dDate;
  // dynamic duration;
  // dynamic startTime;
  // dynamic endTime;
  // dynamic vendorList;
  // dynamic additionalSlot;
  // dynamic resourceList;
  // dynamic resourceId;
  // dynamic service;
  // dynamic resource;
  // bool termsConditions;
  // dynamic fullName;
  // String stripeId;
  // String vendorStripeAccountId;
  // String financialInstitutionName;
  // String accountName;
  // String accountCode;
  // String accountNumber;
  // dynamic countryList;
  // DateTime userDateTime;

  factory FavouriteVendorDetails.fromJson(Map<String, dynamic> json) => FavouriteVendorDetails(
    id: json["id"] ?? 0,
    // categories: json["categories"],
    categoryId: json["categoryId"] ?? 0,
    businessName: json["businessName"] ?? "",
    businessLogo: json["businessLogo"] ?? "",
    // street: json["street"],
    // suburb: json["suburb"],
    // postcode: json["postcode"],
    // state: json["state"],
    // country: json["country"],
    // userName: json["userName"],
    email: json["email"] ?? "",
    // phoneNo: json["phoneNo"],
    // address: json["address"],
    // isActive: json["isActive"],
    userId: json["userId"] ?? "",
    // vendorPortal: json["vendorPortal"],
    // vendorVerification: json["vendorVerification"],
    // businessId: json["businessId"],
    // isResource: json["isResource"],
    // isPriceDisplay: json["isPriceDisplay"],
    // confirmation: json["confirmation"],
    // isServiceSlots: json["isServiceSlots"],
    // latitude: json["latitude"],
    // longitude: json["longitude"],
    // firstPayment: json["firstPayment"] == null ? null : DateTime.parse(json["firstPayment"]),
    // nextPayment: json["nextPayment"] == null ? null : DateTime.parse(json["nextPayment"]),
    // vendorVerificationDate: DateTime.parse(json["vendorVerificationDate"]),
    // applicationUser: json["applicationUser"],
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: DateTime.parse(json["modifiedOn"]),
    // applicationUserModifier: json["applicationUserModifier"],
    // review: Review.fromJson(json["review"]),
    // rating: json["rating"],
    // vendorWorkingHours: json["vendorWorkingHours"],
    // status: json["status"],
    // category: json["category"],
    // passwordHash: json["passwordHash"],
    // workingHoursStatus: json["workingHoursStatus"],
    // avilableTime: json["avilableTime"],
    // dDate: DateTime.parse(json["dDate"]),
    // duration: json["duration"],
    // startTime: json["startTime"],
    // endTime: json["endTime"],
    // vendorList: json["vendorList"],
    // additionalSlot: json["additionalSlot"],
    // resourceList: json["resourceList"],
    // resourceId: json["resourceId"],
    // service: json["service"],
    // resource: json["resource"],
    // termsConditions: json["termsConditions"],
    // fullName: json["fullName"],
    // stripeId: json["stripeId"] == null ? null : json["stripeId"],
    // vendorStripeAccountId: json["vendorStripeAccountId"] == null ? null : json["vendorStripeAccountId"],
    // financialInstitutionName: json["financialInstitutionName"] == null ? null : json["financialInstitutionName"],
    // accountName: json["accountName"] == null ? null : json["accountName"],
    // accountCode: json["accountCode"] == null ? null : json["accountCode"],
    // accountNumber: json["accountNumber"] == null ? null : json["accountNumber"],
    // countryList: json["countryList"],
    // userDateTime: DateTime.parse(json["userDateTime"]),
  );

  /*Map<String, dynamic> toJson() => {
    "id": id,
    "categories": categories,
    "categoryId": categoryId,
    "businessName": businessName,
    "businessLogo": businessLogo == null ? null : businessLogo,
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
    "firstPayment": firstPayment == null ? null : firstPayment.toIso8601String(),
    "nextPayment": nextPayment == null ? null : nextPayment.toIso8601String(),
    "vendorVerificationDate": vendorVerificationDate.toIso8601String(),
    "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn.toIso8601String(),
    "applicationUserModifier": applicationUserModifier,
    "review": review.toJson(),
    "rating": rating,
    "vendorWorkingHours": vendorWorkingHours,
    "status": status,
    "category": category,
    "passwordHash": passwordHash,
    "workingHoursStatus": workingHoursStatus,
    "avilableTime": avilableTime,
    "dDate": dDate.toIso8601String(),
    "duration": duration,
    "startTime": startTime,
    "endTime": endTime,
    "vendorList": vendorList,
    "additionalSlot": additionalSlot,
    "resourceList": resourceList,
    "resourceId": resourceId,
    "service": service,
    "resource": resource,
    "termsConditions": termsConditions,
    "fullName": fullName,
    "stripeId": stripeId == null ? null : stripeId,
    "vendorStripeAccountId": vendorStripeAccountId == null ? null : vendorStripeAccountId,
    "financialInstitutionName": financialInstitutionName == null ? null : financialInstitutionName,
    "accountName": accountName == null ? null : accountName,
    "accountCode": accountCode == null ? null : accountCode,
    "accountNumber": accountNumber == null ? null : accountNumber,
    "countryList": countryList,
    "userDateTime": userDateTime.toIso8601String(),
  };*/

}

// class Review {
//   Review({
//     this.id,
//     this.vendor,
//     this.vendorId,
//     this.customer,
//     this.customerId,
//     this.description,
//     this.ratting,
//     this.date,
//     this.isActive,
//     this.createdBy,
//     this.createdOn,
//     this.modifiedBy,
//     this.modifiedOn,
//     this.applicationUserCreator,
//     this.applicationUserModifier,
//     this.favourites,
//     this.category,
//   });
//
//   int id;
//   dynamic vendor;
//   int vendorId;
//   dynamic customer;
//   int customerId;
//   dynamic description;
//   int ratting;
//   dynamic date;
//   dynamic isActive;
//   dynamic createdBy;
//   dynamic createdOn;
//   dynamic modifiedBy;
//   dynamic modifiedOn;
//   dynamic applicationUserCreator;
//   dynamic applicationUserModifier;
//   bool favourites;
//   dynamic category;
//
//   factory Review.fromJson(Map<String, dynamic> json) => Review(
//     id: json["id"],
//     vendor: json["vendor"],
//     vendorId: json["vendorId"],
//     customer: json["customer"],
//     customerId: json["customerId"],
//     description: json["description"],
//     ratting: json["ratting"],
//     date: json["date"],
//     isActive: json["isActive"],
//     createdBy: json["createdBy"],
//     createdOn: json["createdOn"],
//     modifiedBy: json["modifiedBy"],
//     modifiedOn: json["modifiedOn"],
//     applicationUserCreator: json["applicationUserCreator"],
//     applicationUserModifier: json["applicationUserModifier"],
//     favourites: json["favourites"],
//     category: json["category"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "vendor": vendor,
//     "vendorId": vendorId,
//     "customer": customer,
//     "customerId": customerId,
//     "description": description,
//     "ratting": ratting,
//     "date": date,
//     "isActive": isActive,
//     "createdBy": createdBy,
//     "createdOn": createdOn,
//     "modifiedBy": modifiedBy,
//     "modifiedOn": modifiedOn,
//     "applicationUserCreator": applicationUserCreator,
//     "applicationUserModifier": applicationUserModifier,
//     "favourites": favourites,
//     "category": category,
//   };
// }
