// To parse this JSON data, do
//
//     final userSignUpModel = userSignUpModelFromJson(jsonString);

import 'dart:convert';

import 'dart:math';

UserSignUpModel userSignUpModelFromJson(String str) => UserSignUpModel.fromJson(json.decode(str));

String userSignUpModelToJson(UserSignUpModel data) => json.encode(data.toJson());

class UserSignUpModel {
  UserSignUpModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  int statusCode;
  bool success;
  String message;
  Data data;

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) => UserSignUpModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode.toString().isEmpty ? 0 : statusCode,
    "success": success.toString().isEmpty ? false : success,
    "message": message.isEmpty ? "": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.state,
    required this.city,
    required this.email,
    required this.phoneNo,
    required this.image,
    required this.gender,
    required this.about,
    required this.lastVisit,
    required this.firstName,
    required this.lastName,
    required this.faxNumber,
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
  String state;
  String city;
  String email;
  String phoneNo;
  String image;
  String gender;
  String about;
  String lastVisit;
  String firstName;
  String lastName;
  String faxNumber;
  String dateOfBirth;
  bool isActive;
  String userId;
  ApplicationUser applicationUser;
  String modifiedBy;
  String modifiedOn;
  String applicationUserModifier;
  String passwordHash;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    state: json["state"] ?? "",
    city: json["city"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    image: json["image"] ?? "",
    gender: json["gender"] ?? "",
    about: json["about"] ?? "",
    lastVisit: json["lastVisit"] ?? "",
    firstName: json["firstName"] ?? "",
    lastName: json["lastName"] ?? "",
    faxNumber: json["faxNumber"] ?? "",
    dateOfBirth: json["dateOfBirth"] ?? "",
    isActive: json["isActive"] ?? false,
    userId: json["userId"] ?? "",
    applicationUser: ApplicationUser.fromJson(json["applicationUser"] ?? {}),
    modifiedBy: json["modifiedBy"]?? "",
    modifiedOn: json["modifiedOn"]?? "",
    applicationUserModifier: json["applicationUserModifier"]?? "",
    passwordHash: json["passwordHash"]?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id.toString().isEmpty ? 0: id,
    "state": state.isEmpty ? "": state,
    "city": city.isEmpty ? "" : city,
    "email": email.isEmpty ? "" : email,
    "phoneNo": phoneNo.isEmpty ? "" : phoneNo,
    "image": image.isEmpty ? "" : image,
    "gender": gender.isEmpty ? "" : gender,
    "about": about.isEmpty ? "" : about,
    "lastVisit": lastVisit,
    "firstName": firstName.isEmpty ? "": firstName,
    "lastName": lastName.isEmpty ? "": lastName,
    "faxNumber": faxNumber.isEmpty ? "": faxNumber,
    "dateOfBirth": dateOfBirth,
    "isActive": isActive.toString().isEmpty ? false : isActive,
    "userId": userId.isEmpty ? "": userId,
    "applicationUser": applicationUser.toJson(),
    "modifiedBy": modifiedBy.isEmpty ? "": modifiedBy,
    "modifiedOn": modifiedOn.isEmpty ? "" : modifiedOn,
    "applicationUserModifier": applicationUserModifier.isEmpty ? "": applicationUserModifier,
    "passwordHash": passwordHash.isEmpty ? "": passwordHash,
  };
}

class ApplicationUser {
  ApplicationUser({
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

  factory ApplicationUser.fromJson(Map<String, dynamic> json) => ApplicationUser(
    frogotToken: json["frogotToken"] ?? "",
    id: json["id"] ?? "",
    userName: json["userName"] ?? "",
    normalizedUserName: json["normalizedUserName"] ?? "",
    email: json["email"] ?? "",
    normalizedEmail: json["normalizedEmail"] ?? "",
    emailConfirmed: json["emailConfirmed"] ?? false,
    passwordHash: json["passwordHash"] ?? "",
    securityStamp: json["securityStamp"]?? "",
    concurrencyStamp: json["concurrencyStamp"] ?? "",
    phoneNumber: json["phoneNumber"]?? "",
    phoneNumberConfirmed: json["phoneNumberConfirmed"] ?? false,
    twoFactorEnabled: json["twoFactorEnabled"] ?? false,
    lockoutEnd: json["lockoutEnd"] ?? "",
    lockoutEnabled: json["lockoutEnabled"] ?? false,
    accessFailedCount: json["accessFailedCount"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "frogotToken": frogotToken.isEmpty ? "": frogotToken,
    "id": id.isEmpty ? "": id,
    "userName": userName.isEmpty ? "": userName,
    "normalizedUserName": normalizedUserName.isEmpty ? "": normalizedUserName,
    "email": email.isEmpty ? "": email,
    "normalizedEmail": normalizedEmail.isEmpty ? "": normalizedEmail,
    "emailConfirmed": emailConfirmed.toString().isEmpty ? false : emailConfirmed,
    "passwordHash": passwordHash.isEmpty ? "": passwordHash,
    "securityStamp": securityStamp.isEmpty ? "": securityStamp,
    "concurrencyStamp": concurrencyStamp.isEmpty ? "": concurrencyStamp,
    "phoneNumber": phoneNumber.isEmpty ? "": phoneNumber,
    "phoneNumberConfirmed": phoneNumberConfirmed.toString().isEmpty ?false : phoneNumberConfirmed,
    "twoFactorEnabled": twoFactorEnabled.toString().isEmpty ? false: twoFactorEnabled,
    "lockoutEnd": lockoutEnd.isEmpty ? "": lockoutEnd,
    "lockoutEnabled": lockoutEnabled.toString().isEmpty ? false : lockoutEnabled,
    "accessFailedCount": accessFailedCount.toString().isEmpty ? 0 : accessFailedCount,
  };
}
