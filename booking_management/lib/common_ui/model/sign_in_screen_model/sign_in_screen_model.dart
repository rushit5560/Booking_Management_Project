/*


// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

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
  });

  int statusCode;
  bool success;
  String message;
  Data data;
  Role role;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    data: Data.fromJson(json["data"]),
    role: Role.fromJson(json["role"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data.toJson(),
    "role": role.toJson(),
  };
}

class Data {
  Data({
    required this.frogotToken,
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

  String frogotToken;
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
    frogotToken: json["frogotToken"] ?? "",
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

class Role {
  Role({
    required this.id,
    required this.name,
    required this.normalizedName,
    required this.concurrencyStamp,
  });

  String id;
  String name;
  String normalizedName;
  String concurrencyStamp;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    normalizedName: json["normalizedName"]?? "",
    concurrencyStamp: json["concurrencyStamp"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "normalizedName": normalizedName,
    "concurrencyStamp": concurrencyStamp,
  };
}

*/

// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

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
  });

  int statusCode;
  bool success;
  String message;
  Data data;
  Role role;
  Vendor vendor;
  Customer customer;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    data: Data.fromJson(json["data"] ?? {}),
    role: Role.fromJson(json["role"] ?? {}),
    vendor: Vendor.fromJson(json["vendor"] ?? {}),
    customer: Customer.fromJson(json["customer"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data.toJson(),
    "role": role.toJson(),
    "vendor": vendor.toJson(),
    "customer": customer.toJson(),
  };
}

class Data {
  Data({
    required this.frogotToken,
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

  String frogotToken;
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
    frogotToken: json["frogotToken"] ?? "",
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

class Role {
  Role({
    required this.id,
    required this.name,
    required this.normalizedName,
    required this.concurrencyStamp,
  });

  String id;
  String name;
  String normalizedName;
  String concurrencyStamp;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    normalizedName: json["normalizedName"] ?? "",
    concurrencyStamp: json["concurrencyStamp"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "normalizedName": normalizedName,
    "concurrencyStamp": concurrencyStamp,
  };
}

class Vendor {
  Vendor({
    required this.id,
    required this.categories,
    required this.categoryId,
    required this.workingHours,
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
    required this.address1,
    required this.address2,
    required this.isActive,
    required this.userId,
    required this.vendorPortal,
    required this.vendorVerification,
    required this.attachPhotoIndentification,
    required this.attachProofofAddress,
    required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserModifier,
    required this.review,
    required this.vendorWorkingHours,
    required this.status,
    required this.category,
    required this.passwordHash,
    required this.businessId,
    required this.workingHoursStatus,
    required this.avilableTime,
  });

  int id;
  String categories;
  int categoryId;
  String workingHours;
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
  String address1;
  String address2;
  bool isActive;
  String userId;
  bool vendorPortal;
  bool vendorVerification;
  String attachPhotoIndentification;
  String attachProofofAddress;
  Data applicationUser;
  String modifiedBy;
  String modifiedOn;
  Data applicationUserModifier;
  String review;
  String vendorWorkingHours;
  String status;
  String category;
  String passwordHash;
  String businessId;
  String workingHoursStatus;
  String avilableTime;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"] ?? 0,
    categories: json["categories"] ?? "",
    categoryId: json["categoryId"] ?? 0,
    workingHours: json["workingHours"] ?? "",
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
    address1: json["address1"] ?? "",
    address2: json["address2"] ?? "",
    isActive: json["isActive"] ?? false,
    userId: json["userId"] ?? "",
    vendorPortal: json["vendorPortal"] ?? false,
    vendorVerification: json["vendorVerification"] ?? false,
    attachPhotoIndentification: json["attachPhotoIndentification"] ?? "",
    attachProofofAddress: json["attachProofofAddress"] ?? "",
    applicationUser: Data.fromJson(json["applicationUser"] ?? {}),
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"]  ?? "",
    applicationUserModifier: Data.fromJson(json["applicationUserModifier"] ?? {}),
    review: json["review"] ?? "",
    vendorWorkingHours: json["vendorWorkingHours"] ?? "",
    status: json["status"] ?? "",
    category: json["category"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
    businessId: json["businessId"] ?? "",
    workingHoursStatus: json["workingHoursStatus"] ?? "",
    avilableTime: json["avilableTime"] ?? "",
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
    "applicationUserModifier": applicationUserModifier.toJson(),
    "review": review,
    "vendorWorkingHours": vendorWorkingHours,
    "status": status,
    "category": category,
    "passwordHash": passwordHash,
    "businessId": businessId,
    "workingHoursStatus": workingHoursStatus,
    "avilableTime": avilableTime,
  };
}

class Customer {
  Customer({
    required this.id,
    // required this.state,
    // required this.city,
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
  //String about;
  //String lastVisit;
  String userName;
  //String lastName;
  //String faxNumber;
  String dateOfBirth;
  bool isActive;
  String userId;
  Data applicationUser;
  String modifiedBy;
  String modifiedOn;
  String applicationUserModifier;
  String passwordHash;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"] ?? 0,
    //state: json["state"] ?? "",
    //city: json["city"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    //image: json["image"] ?? "",
    gender: json["gender"] ?? "",
    //about: json["about"] ?? "",
    //lastVisit: json["lastVisit"] ?? "",
    userName: json["userName"] ?? "",
    //lastName: json["lastName"] ?? "",
    //faxNumber: json["faxNumber"] ?? "",
    dateOfBirth: json["dateOfBirth"] ?? "",
    isActive: json["isActive"] ?? false,
    userId: json["userId"] ?? "",
    applicationUser: Data.fromJson(json["applicationUser"] ?? {}),
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    applicationUserModifier: json["applicationUserModifier"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    //"state": state,
    //"city": city,
    "email": email,
    "phoneNo": phoneNo,
    //"image": image,
    "gender": gender,
    //"about": about,
    //"lastVisit": lastVisit,
    "userName": userName,
    //"lastName": lastName,
    //"faxNumber": faxNumber,
    "dateOfBirth": dateOfBirth,
    "isActive": isActive,
    "userId": userId,
    "applicationUser": applicationUser.toJson(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserModifier": applicationUserModifier,
    "passwordHash": passwordHash,
  };
}
