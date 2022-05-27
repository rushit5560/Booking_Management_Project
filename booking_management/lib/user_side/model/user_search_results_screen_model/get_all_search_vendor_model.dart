import 'dart:convert';

GetAllSearchVendorModel getAllSearchVendorModelFromJson(String str) => GetAllSearchVendorModel.fromJson(json.decode(str));

String getAllSearchVendorModelToJson(GetAllSearchVendorModel data) => json.encode(data.toJson());

class GetAllSearchVendorModel {
  GetAllSearchVendorModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<SearchVendorDatum> data;

  factory GetAllSearchVendorModel.fromJson(Map<String, dynamic> json) => GetAllSearchVendorModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<SearchVendorDatum>.from(json["data"].map((x) => SearchVendorDatum.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SearchVendorDatum {
  SearchVendorDatum({
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
    // required this.applicationUser,
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
  // ApplicationUser applicationUser;
  String modifiedBy;
  String modifiedOn;
  // dynamic applicationUserModifier;
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

  factory SearchVendorDatum.fromJson(Map<String, dynamic> json) => SearchVendorDatum(
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
    // applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
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
    // "applicationUser": applicationUser.toJson(),
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

// class ApplicationUser {
//   ApplicationUser({
//     this.apiToken,
//     this.frogotToken,
//     this.id,
//     this.userName,
//     this.normalizedUserName,
//     this.email,
//     this.normalizedEmail,
//     this.emailConfirmed,
//     this.passwordHash,
//     this.securityStamp,
//     this.concurrencyStamp,
//     this.phoneNumber,
//     this.phoneNumberConfirmed,
//     this.twoFactorEnabled,
//     this.lockoutEnd,
//     this.lockoutEnabled,
//     this.accessFailedCount,
//   });
//
//   String apiToken;
//   dynamic frogotToken;
//   String id;
//   String userName;
//   String normalizedUserName;
//   String email;
//   String normalizedEmail;
//   bool emailConfirmed;
//   String passwordHash;
//   String securityStamp;
//   String concurrencyStamp;
//   String phoneNumber;
//   bool phoneNumberConfirmed;
//   bool twoFactorEnabled;
//   dynamic lockoutEnd;
//   bool lockoutEnabled;
//   int accessFailedCount;
//
//   factory ApplicationUser.fromJson(Map<String, dynamic> json) => ApplicationUser(
//     apiToken: json["apiToken"],
//     frogotToken: json["frogotToken"],
//     id: json["id"],
//     userName: json["userName"],
//     normalizedUserName: json["normalizedUserName"],
//     email: json["email"],
//     normalizedEmail: json["normalizedEmail"],
//     emailConfirmed: json["emailConfirmed"],
//     passwordHash: json["passwordHash"],
//     securityStamp: json["securityStamp"],
//     concurrencyStamp: json["concurrencyStamp"],
//     phoneNumber: json["phoneNumber"],
//     phoneNumberConfirmed: json["phoneNumberConfirmed"],
//     twoFactorEnabled: json["twoFactorEnabled"],
//     lockoutEnd: json["lockoutEnd"],
//     lockoutEnabled: json["lockoutEnabled"],
//     accessFailedCount: json["accessFailedCount"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "apiToken": apiToken,
//     "frogotToken": frogotToken,
//     "id": id,
//     "userName": userName,
//     "normalizedUserName": normalizedUserName,
//     "email": email,
//     "normalizedEmail": normalizedEmail,
//     "emailConfirmed": emailConfirmed,
//     "passwordHash": passwordHash,
//     "securityStamp": securityStamp,
//     "concurrencyStamp": concurrencyStamp,
//     "phoneNumber": phoneNumber,
//     "phoneNumberConfirmed": phoneNumberConfirmed,
//     "twoFactorEnabled": twoFactorEnabled,
//     "lockoutEnd": lockoutEnd,
//     "lockoutEnabled": lockoutEnabled,
//     "accessFailedCount": accessFailedCount,
//   };
// }
