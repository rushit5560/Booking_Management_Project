// To parse this JSON data, do
//
//     final userProfileDetailsModel = userProfileDetailsModelFromJson(jsonString);

import 'dart:convert';

UserProfileDetailsModel userProfileDetailsModelFromJson(String str) => UserProfileDetailsModel.fromJson(json.decode(str));

String userProfileDetailsModelToJson(UserProfileDetailsModel data) => json.encode(data.toJson());

class UserProfileDetailsModel {
  UserProfileDetailsModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  Data data;

  factory UserProfileDetailsModel.fromJson(Map<String, dynamic> json) => UserProfileDetailsModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.phoneNo,
    required this.gender,
    required this.userName,
    required this.dateOfBirth,
    required this.isActive,
    required this.userId,
    // required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    // required this.applicationUserModifier,
    required this.passwordHash,
    required this.notes,
    required this.resourceId,
    required this.bookingId,
    required this.isPriceDisplay,
    required this.duration,
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
  DateTime modifiedOn;
  // ApplicationUser applicationUserModifier;
  String passwordHash;
  String notes;
  String resourceId;
  String bookingId;
  bool isPriceDisplay;
  String duration;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    gender: json["gender"] ?? "",
    userName: json["userName"] ?? "",
    dateOfBirth: json["dateOfBirth"] ?? "",
    isActive: json["isActive"] ?? false,
    userId: json["userId"] ?? "",
    // applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: DateTime.parse(json["modifiedOn"] ?? DateTime.now()),
    // applicationUserModifier: ApplicationUser.fromJson(json["applicationUserModifier"]),
    passwordHash: json["passwordHash"] ?? "",
    notes: json["notes"] ?? "",
    resourceId: json["resourceId"] ?? "",
    bookingId: json["bookingId"] ?? "",
    isPriceDisplay: json["isPriceDisplay"] ?? false,
    duration: json["duration"] ?? "",
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
    // "applicationUser": applicationUser.toJson(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn.toIso8601String(),
    // "applicationUserModifier": applicationUserModifier.toJson(),
    "passwordHash": passwordHash,
    "notes": notes,
    "resourceId": resourceId,
    "bookingId": bookingId,
    "isPriceDisplay": isPriceDisplay,
    "duration": duration,
  };
}

// class Data {
//   Data({
//     required this.id,
//     required this.email,
//     required this.phoneNo,
//     required this.gender,
//     required this.userName,
//     required this.dateOfBirth,
//     required this.isActive,
//     required this.userId,
//     // required this.applicationUser,
//     required this.modifiedBy,
//     required this.modifiedOn,
//     // required this.applicationUserModifier,
//     required this.passwordHash,
//     required this.notes,
//     required this.resourceId,
//     required this.bookingId,
//     required this.isPriceDisplay,
//     required this.duration,
//   });
//
//   int id;
//   String email;
//   String phoneNo;
//   String gender;
//   String userName;
//   DateTime dateOfBirth;
//   bool isActive;
//   String userId;
//   // ApplicationUser applicationUser;
//   String modifiedBy;
//   String modifiedOn;
//   // ApplicationUser applicationUserModifier;
//   String passwordHash;
//   String notes;
//   String resourceId;
//   String bookingId;
//   bool isPriceDisplay;
//   String duration;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"] ?? 0,
//     email: json["email"] ?? "",
//     phoneNo: json["phoneNo"] ?? "",
//     gender: json["gender"] ?? "",
//     userName: json["userName"] ?? "",
//     dateOfBirth: DateTime(json["dateOfBirth"] ?? DateTime.now()),
//     isActive: json["isActive"] ?? false,
//     userId: json["userId"] ?? "",
//     // applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
//     modifiedBy: json["modifiedBy"] ?? "",
//     modifiedOn: json["modifiedOn"] ?? "",
//     // applicationUserModifier: ApplicationUser.fromJson(json["applicationUserModifier"]),
//     passwordHash: json["passwordHash"] ?? "",
//     notes: json["notes"] ?? "",
//     resourceId: json["resourceId"] ?? "",
//     bookingId: json["bookingId"] ?? "",
//     isPriceDisplay: json["isPriceDisplay"] ?? false,
//     duration: json["duration"] ?? "",
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "email": email,
//     "phoneNo": phoneNo,
//     "gender": gender,
//     "userName": userName,
//     "dateOfBirth": dateOfBirth.toIso8601String(),
//     "isActive": isActive,
//     "userId": userId,
//     // "applicationUser": applicationUser.toJson(),
//     "modifiedBy": modifiedBy,
//     "modifiedOn": modifiedOn,
//     // "applicationUserModifier": applicationUserModifier.toJson(),
//     "passwordHash": passwordHash,
//     "notes": notes,
//     "resourceId": resourceId,
//     "bookingId": bookingId,
//     "isPriceDisplay": isPriceDisplay,
//     "duration": duration,
//   };
// }

