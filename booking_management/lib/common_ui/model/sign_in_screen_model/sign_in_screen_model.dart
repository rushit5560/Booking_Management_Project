import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
    required this.role,
    required this.vendor,
    required this.customer,
    required this.apiToken
  });

  int statusCode;
  bool success;
  String message;
  Data data;
  List<String> role;
  Vendor vendor;
  Customer customer;
  String apiToken;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    data: Data.fromJson(json["data"] ?? {}),
    role: List<String>.from(json["role"].map((x) => x)),
    vendor: Vendor.fromJson(json["vendor"] ?? {}),
    customer: Customer.fromJson(json["customer"] ?? {}),
    apiToken: json["apiToken"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data.toJson(),
    "role": List<dynamic>.from(role.map((x) => x)),
    "vendor": vendor.toJson(),
    "customer": customer.toJson(),
    "apiToken": apiToken,
  };
}

class Data {
  Data({
    required this.apiToken,
    required this.frogotToken,
    required this.fcmToken,
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

  String apiToken;
  String frogotToken;
  String fcmToken;
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
  String lockoutEnd;
  bool lockoutEnabled;
  int accessFailedCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    apiToken: json["apiToken"] ?? "",
    frogotToken: json["frogotToken"] ?? "",
    fcmToken: json["fcmToken"] ?? "",
    id: json["id"] ?? "",
    userName: json["userName"] ?? "",
    normalizedUserName: json["normalizedUserName"] ?? "",
    email: json["email"] ?? "",
    normalizedEmail: json["normalizedEmail"] ?? "",
    emailConfirmed: json["emailConfirmed"] ?? false,
    passwordHash: json["passwordHash"] ?? "",
    securityStamp: json["securityStamp"] ?? "",
    concurrencyStamp: json["concurrencyStamp"] ?? "",
    phoneNumber: json["phoneNumber"] ?? "",
    phoneNumberConfirmed: json["phoneNumberConfirmed"] ?? false,
    twoFactorEnabled: json["twoFactorEnabled"] ?? false,
    lockoutEnd: json["lockoutEnd"] ?? "",
    lockoutEnabled: json["lockoutEnabled"] ?? false,
    accessFailedCount: json["accessFailedCount"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "frogotToken": frogotToken,
    "id": id,
    "fcmToken": fcmToken,
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
    required this.businessId,
    required this.isResource,
    required this.isPriceDisplay,
    required this.confirmation,
    required this.isServiceSlots,
    required this.latitude,
    required this.longitude,
    required this.vendorVerificationDate,
    required this.applicationUser,
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
  String email;
  String phoneNo;
  String address;
  //String address2;
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
  Data applicationUser;
  String modifiedBy;
  String modifiedOn;
  // Data applicationUserModifier;
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
    businessId: json["businessId"] ?? "",
    isResource: json["isResource"] ?? false,
    isPriceDisplay: json["isPriceDisplay"] ?? false,
    confirmation: json["confirmation"] ?? false,
    isServiceSlots: json["isServiceSlots"] ?? false,
    latitude: json["latitude"] ?? "",
    longitude: json["longitude"] ?? "",
    vendorVerificationDate: json["vendorVerificationDate"] ?? "",
    applicationUser: Data.fromJson(json["applicationUser"] ?? {}),
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    // applicationUserModifier: Data.fromJson(json["applicationUserModifier"] ?? {}),
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
   // "address2": address2,
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
    "applicationUser": applicationUser.toJson(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    // "applicationUserModifier": applicationUserModifier.toJson(),
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
    required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    // required this.applicationUserModifier,
    required this.passwordHash,
    required this.notes,
    required this.bookingId,
    required this.bookingAvailabilityId,
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
  Data applicationUser;
  String modifiedBy;
  String modifiedOn;
  // String applicationUserModifier;
  String passwordHash;
  String notes;
  String bookingId;
  String bookingAvailabilityId;
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
    applicationUser: Data.fromJson(json["applicationUser"] ?? {}),
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    // applicationUserModifier: json["applicationUserModifier"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
    notes: json["notes"] ?? "",
    bookingId: json["bookingId"] ?? "",
    bookingAvailabilityId: json["bookingAvailabilityId"] ?? "",
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
    "applicationUser": applicationUser.toJson(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    // "applicationUserModifier": applicationUserModifier,
    "passwordHash": passwordHash,
    "notes": notes,
    "bookingId": bookingId,
    "bookingAvailabilityId": bookingAvailabilityId,
    "isPriceDisplay": isPriceDisplay,
  };
}

// class ApplicationUser {
//   ApplicationUser({
//     required this.apiToken,
//     required this.frogotToken,
//     required this.id,
//     required this.userName,
//     required this.normalizedUserName,
//     required this.email,
//     required this.normalizedEmail,
//     required this.emailConfirmed,
//     required this.passwordHash,
//     required this.securityStamp,
//     required this.concurrencyStamp,
//     required this.phoneNumber,
//     required this.phoneNumberConfirmed,
//     required this.twoFactorEnabled,
//     required this.lockoutEnd,
//     required this.lockoutEnabled,
//     required this.accessFailedCount,
//   });
//
//   String apiToken;
//   String frogotToken;
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
//   String lockoutEnd;
//   bool lockoutEnabled;
//   int accessFailedCount;
//
//   factory ApplicationUser.fromJson(Map<String, dynamic> json) => ApplicationUser(
//     apiToken: json["apiToken"] ?? "",
//     frogotToken: json["frogotToken"] ?? "",
//     id: json["id"] ?? "",
//     userName: json["userName"] ?? "",
//     normalizedUserName: json["normalizedUserName"] ?? "",
//     email: json["email"] ?? "",
//     normalizedEmail: json["normalizedEmail"] ?? "",
//     emailConfirmed: json["emailConfirmed"] ?? false,
//     passwordHash: json["passwordHash"] ?? "",
//     securityStamp: json["securityStamp"] ?? "",
//     concurrencyStamp: json["concurrencyStamp"] ?? "",
//     phoneNumber: json["phoneNumber"] ?? "",
//     phoneNumberConfirmed: json["phoneNumberConfirmed"] ?? false,
//     twoFactorEnabled: json["twoFactorEnabled"] ?? false,
//     lockoutEnd: json["lockoutEnd"] ?? "",
//     lockoutEnabled: json["lockoutEnabled"] ?? false,
//     accessFailedCount: json["accessFailedCount"] ?? 0,
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
