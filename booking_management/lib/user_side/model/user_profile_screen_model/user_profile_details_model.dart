// To parse this JSON data, do
//
//     final userProfileDetailsModel = userProfileDetailsModelFromJson(jsonString);

import 'dart:convert';

UserProfileDetailsModel userProfileDetailsModelFromJson(String str) => UserProfileDetailsModel.fromJson(json.decode(str));

String userProfileDetailsModelToJson(UserProfileDetailsModel data) => json.encode(data.toJson());
class UserProfileDetailsModel {
  int? statusCode;
  bool? success;
  Data? data;

  UserProfileDetailsModel({this.statusCode, this.success, this.data});

  UserProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? phoneNo;
  String? gender;
  String? userName;
  String? dateOfBirth;
  bool? isActive;
  String? userId;
  // ApplicationUser? applicationUser;
  String? modifiedBy;
  String? modifiedOn;
  // ApplicationUser? applicationUserModifier;
  String? image;
  String? passwordHash;
  String? notes;
  String? resourceId;
  String? bookingId;
  bool? isPriceDisplay;
  String? duration;
  bool? termsConditions;
  String? fullName;
  String? fullId;

  Data(
      {this.id,
        this.email,
        this.phoneNo,
        this.gender,
        this.userName,
        this.dateOfBirth,
        this.isActive,
        this.userId,
        // this.applicationUser,
        this.modifiedBy,
        this.modifiedOn,
        // this.applicationUserModifier,
        this.image,
        this.passwordHash,
        this.notes,
        this.resourceId,
        this.bookingId,
        this.isPriceDisplay,
        this.duration,
        this.termsConditions,
        this.fullName,
        this.fullId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    gender = json['gender'];
    userName = json['userName'];
    dateOfBirth = json['dateOfBirth'];
    isActive = json['isActive'];
    userId = json['userId'];
    // applicationUser = json['applicationUser'] != null
    //     ? new ApplicationUser.fromJson(json['applicationUser'])
    //     : null;
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    // applicationUserModifier = json['applicationUserModifier'] != null
    //     ? new ApplicationUser.fromJson(json['applicationUserModifier'])
    //     : null;
    image = json['image'];
    passwordHash = json['passwordHash'];
    notes = json['notes'];
    resourceId = json['resourceId'];
    bookingId = json['bookingId'];
    isPriceDisplay = json['isPriceDisplay'];
    duration = json['duration'];
    termsConditions = json['termsConditions'];
    fullName = json['fullName'];
    fullId = json['fullId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    data['gender'] = this.gender;
    data['userName'] = this.userName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['isActive'] = this.isActive;
    data['userId'] = this.userId;
    // if (this.applicationUser != null) {
    //   data['applicationUser'] = this.applicationUser!.toJson();
    // }
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    // if (this.applicationUserModifier != null) {
    //   data['applicationUserModifier'] = this.applicationUserModifier!.toJson();
    // }
    data['image'] = this.image;
    data['passwordHash'] = this.passwordHash;
    data['notes'] = this.notes;
    data['resourceId'] = this.resourceId;
    data['bookingId'] = this.bookingId;
    data['isPriceDisplay'] = this.isPriceDisplay;
    data['duration'] = this.duration;
    data['termsConditions'] = this.termsConditions;
    data['fullName'] = this.fullName;
    data['fullId'] = this.fullId;
    return data;
  }
}

class ApplicationUser {
  String? apiToken;
  String? frogotToken;
  String? fcmToken;
  bool? termsConditions;
  String? fullName;
  String? returnUrl;
  String? externalLogins;
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  String? lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  ApplicationUser(
      {this.apiToken,
        this.frogotToken,
        this.fcmToken,
        this.termsConditions,
        this.fullName,
        this.returnUrl,
        this.externalLogins,
        this.id,
        this.userName,
        this.normalizedUserName,
        this.email,
        this.normalizedEmail,
        this.emailConfirmed,
        this.passwordHash,
        this.securityStamp,
        this.concurrencyStamp,
        this.phoneNumber,
        this.phoneNumberConfirmed,
        this.twoFactorEnabled,
        this.lockoutEnd,
        this.lockoutEnabled,
        this.accessFailedCount});

  ApplicationUser.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    frogotToken = json['frogotToken'];
    fcmToken = json['fcmToken'];
    termsConditions = json['termsConditions'];
    fullName = json['fullName'];
    returnUrl = json['returnUrl'];
    externalLogins = json['externalLogins'];
    id = json['id'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd = json['lockoutEnd'];
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiToken'] = this.apiToken;
    data['frogotToken'] = this.frogotToken;
    data['fcmToken'] = this.fcmToken;
    data['termsConditions'] = this.termsConditions;
    data['fullName'] = this.fullName;
    data['returnUrl'] = this.returnUrl;
    data['externalLogins'] = this.externalLogins;
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['normalizedUserName'] = this.normalizedUserName;
    data['email'] = this.email;
    data['normalizedEmail'] = this.normalizedEmail;
    data['emailConfirmed'] = this.emailConfirmed;
    data['passwordHash'] = this.passwordHash;
    data['securityStamp'] = this.securityStamp;
    data['concurrencyStamp'] = this.concurrencyStamp;
    data['phoneNumber'] = this.phoneNumber;
    data['phoneNumberConfirmed'] = this.phoneNumberConfirmed;
    data['twoFactorEnabled'] = this.twoFactorEnabled;
    data['lockoutEnd'] = this.lockoutEnd;
    data['lockoutEnabled'] = this.lockoutEnabled;
    data['accessFailedCount'] = this.accessFailedCount;
    return data;
  }
}
