// import 'dart:convert';
//
// VendorEditProfileModel vendorEditProfileModelFromJson(String str) =>
//     VendorEditProfileModel.fromJson(json.decode(str));
//
// String vendorEditProfileModelToJson(VendorEditProfileModel data) =>
//     json.encode(data.toJson());
//
// class VendorEditProfileModel {
//   VendorEditProfileModel({
//     required this.statusCode,
//     required this.success,
//     required this.message,
//     // required this.dataVendor,
//     // required this.dataWorkingHours,
//   });
//
//   int statusCode;
//   bool success;
//   String message;
//   // DataVendor dataVendor;
//   // DataWorkingHours dataWorkingHours;
//
//   factory VendorEditProfileModel.fromJson(Map<String, dynamic> json) =>
//       VendorEditProfileModel(
//         statusCode: json["statusCode"] ?? 0,
//         success: json["success"] ?? false,
//         message: json["message"] ?? "",
//         // dataVendor: DataVendor.fromJson(json["dataVendor"] ?? {}),
//         // dataWorkingHours:
//         //     DataWorkingHours.fromJson(json["dataWorkingHours"] ?? {}),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "statusCode": statusCode,
//         "success": success,
//         "message": message,
//         // "dataVendor": dataVendor.toJson(),
//         // "dataWorkingHours": dataWorkingHours.toJson(),
//       };
// }
//
// /*class DataVendor {
//   DataVendor({
//     required this.id,
//     required this.categories,
//     required this.categoryId,
//     required this.businessName,
//     required this.businessLogo,
//     required this.street,
//     required this.suburb,
//     required this.postcode,
//     required this.state,
//     required this.country,
//     required this.userName,
//     required this.email,
//     required this.phoneNo,
//     required this.address,
//     required this.isActive,
//     required this.userId,
//     required this.vendorPortal,
//     required this.vendorVerification,
//     required this.businessId,
//     required this.isResource,
//     required this.isPriceDisplay,
//     required this.confirmation,
//     required this.isServiceSlots,
//     required this.latitude,
//     required this.longitude,
//     required this.vendorVerificationDate,
//     required this.applicationUser,
//     required this.modifiedBy,
//     required this.modifiedOn,
//     required this.applicationUserModifier,
//     required this.review,
//     required this.rating,
//     required this.vendorWorkingHours,
//     required this.status,
//     required this.category,
//     required this.passwordHash,
//     required this.workingHoursStatus,
//     required this.avilableTime,
//     required this.dDate,
//     required this.duration,
//     required this.startTime,
//     required this.endTime,
//   });
//
//   int id;
//   String categories;
//   int categoryId;
//   String businessName;
//   String businessLogo;
//   String street;
//   String suburb;
//   String postcode;
//   String state;
//   String country;
//   String userName;
//   String email;
//   String phoneNo;
//   String address;
//   bool isActive;
//   String userId;
//   bool vendorPortal;
//   bool vendorVerification;
//   String businessId;
//   bool isResource;
//   bool isPriceDisplay;
//   bool confirmation;
//   bool isServiceSlots;
//   String latitude;
//   String longitude;
//   String vendorVerificationDate;
//   ApplicationUser applicationUser;
//   String modifiedBy;
//   String modifiedOn;
//   String applicationUserModifier;
//   String review;
//   String rating;
//   String vendorWorkingHours;
//   String status;
//   String category;
//   String passwordHash;
//   String workingHoursStatus;
//   String avilableTime;
//   String dDate;
//   String duration;
//   String startTime;
//   String endTime;
//
//   factory DataVendor.fromJson(Map<String, dynamic> json) => DataVendor(
//         id: json["id"] ?? 0,
//         categories: json["categories"] ?? "",
//         categoryId: json["categoryId"] ?? 0,
//         businessName: json["businessName"] ?? "",
//         businessLogo: json["businessLogo"] ?? "",
//         street: json["street"] ?? "",
//         suburb: json["suburb"] ?? "",
//         postcode: json["postcode"] ?? "",
//         state: json["state"] ?? "",
//         country: json["country"] ?? "",
//         userName: json["userName"] ?? "",
//         email: json["email"] ?? "",
//         phoneNo: json["phoneNo"] ?? "",
//         address: json["address"] ?? "",
//         isActive: json["isActive"] ?? false,
//         userId: json["userId"] ?? "",
//         vendorPortal: json["vendorPortal"] ?? false,
//         vendorVerification: json["vendorVerification"] ?? false,
//         businessId: json["businessId"] ?? "",
//         isResource: json["isResource"] ?? false,
//         isPriceDisplay: json["isPriceDisplay"] ?? false,
//         confirmation: json["confirmation"] ?? false,
//         isServiceSlots: json["isServiceSlots"] ?? false,
//         latitude: json["latitude"] ?? "",
//         longitude: json["longitude"] ?? "",
//         vendorVerificationDate: json["vendorVerificationDate"] ?? "",
//         applicationUser:
//             ApplicationUser.fromJson(json["applicationUser"] ?? {}),
//         modifiedBy: json["modifiedBy"] ?? "",
//         modifiedOn: json["modifiedOn"] ?? "",
//         applicationUserModifier: json["applicationUserModifier"] ?? "",
//         review: json["review"] ?? "",
//         rating: json["rating"] ?? "",
//         vendorWorkingHours: json["vendorWorkingHours"] ?? "",
//         status: json["status"] ?? "",
//         category: json["category"] ?? "",
//         passwordHash: json["passwordHash"] ?? "",
//         workingHoursStatus: json["workingHoursStatus"] ?? "",
//         avilableTime: json["avilableTime"] ?? "",
//         dDate: json["dDate"] ?? "",
//         duration: json["duration"] ?? "",
//         startTime: json["startTime"] ?? "",
//         endTime: json["endTime"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "categories": categories,
//         "categoryId": categoryId,
//         "businessName": businessName,
//         "businessLogo": businessLogo,
//         "street": street,
//         "suburb": suburb,
//         "postcode": postcode,
//         "state": state,
//         "country": country,
//         "userName": userName,
//         "email": email,
//         "phoneNo": phoneNo,
//         "address": address,
//         "isActive": isActive,
//         "userId": userId,
//         "vendorPortal": vendorPortal,
//         "vendorVerification": vendorVerification,
//         "businessId": businessId,
//         "isResource": isResource,
//         "isPriceDisplay": isPriceDisplay,
//         "confirmation": confirmation,
//         "isServiceSlots": isServiceSlots,
//         "latitude": latitude,
//         "longitude": longitude,
//         "vendorVerificationDate": vendorVerificationDate,
//         "applicationUser": applicationUser.toJson(),
//         "modifiedBy": modifiedBy,
//         "modifiedOn": modifiedOn,
//         "applicationUserModifier": applicationUserModifier,
//         "review": review,
//         "rating": rating,
//         "vendorWorkingHours": vendorWorkingHours,
//         "status": status,
//         "category": category,
//         "passwordHash": passwordHash,
//         "workingHoursStatus": workingHoursStatus,
//         "avilableTime": avilableTime,
//         "dDate": dDate,
//         "duration": duration,
//         "startTime": startTime,
//         "endTime": endTime,
//       };
// }*/
//
// /*class ApplicationUser {
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
//   factory ApplicationUser.fromJson(Map<String, dynamic> json) =>
//       ApplicationUser(
//         apiToken: json["apiToken"] ?? "",
//         frogotToken: json["frogotToken"] ?? "",
//         id: json["id"] ?? "",
//         userName: json["userName"] ?? "",
//         normalizedUserName: json["normalizedUserName"] ?? "",
//         email: json["email"] ?? "",
//         normalizedEmail: json["normalizedEmail"] ?? "",
//         emailConfirmed: json["emailConfirmed"] ?? false,
//         passwordHash: json["passwordHash"] ?? "",
//         securityStamp: json["securityStamp"] ?? "",
//         concurrencyStamp: json["concurrencyStamp"] ?? "",
//         phoneNumber: json["phoneNumber"] ?? "",
//         phoneNumberConfirmed: json["phoneNumberConfirmed"] ?? false,
//         twoFactorEnabled: json["twoFactorEnabled"] ?? false,
//         lockoutEnd: json["lockoutEnd"] ?? "",
//         lockoutEnabled: json["lockoutEnabled"] ?? false,
//         accessFailedCount: json["accessFailedCount"] ?? 0,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "apiToken": apiToken,
//         "frogotToken": frogotToken,
//         "id": id,
//         "userName": userName,
//         "normalizedUserName": normalizedUserName,
//         "email": email,
//         "normalizedEmail": normalizedEmail,
//         "emailConfirmed": emailConfirmed,
//         "passwordHash": passwordHash,
//         "securityStamp": securityStamp,
//         "concurrencyStamp": concurrencyStamp,
//         "phoneNumber": phoneNumber,
//         "phoneNumberConfirmed": phoneNumberConfirmed,
//         "twoFactorEnabled": twoFactorEnabled,
//         "lockoutEnd": lockoutEnd,
//         "lockoutEnabled": lockoutEnabled,
//         "accessFailedCount": accessFailedCount,
//       };
// }*/
//
// /*class DataWorkingHours {
//   DataWorkingHours({
//     required this.id,
//     required this.vendorId,
//     required this.vendors,
//     required this.startTime,
//     required this.endTime,
//     required this.isActive,
//     required this.createdBy,
//     required this.createdOn,
//     required this.modifiedBy,
//     required this.modifiedOn,
//     // required this.applicationUserCreator,
//     // required this.applicationUserModifier,
//     required this.timeDuration,
//     required this.duration,
//     required this.slot,
//     required this.resource,
//     required this.slotList,
//     required this.startTimeList,
//     required this.endTimeList,
//     required this.resourceId,
//   });
//
//   int id;
//   int vendorId;
//   DataVendor vendors;
//   String startTime;
//   String endTime;
//   bool isActive;
//   String createdBy;
//   String createdOn;
//   String modifiedBy;
//   String modifiedOn;
//   //String applicationUserCreator;
//   //String applicationUserModifier;
//   int timeDuration;
//   int duration;
//   String slot;
//   String resource;
//   String slotList;
//   String startTimeList;
//   String endTimeList;
//   String resourceId;
//
//   factory DataWorkingHours.fromJson(Map<String, dynamic> json) =>
//       DataWorkingHours(
//         id: json["id"] ?? 0,
//         vendorId: json["vendorId"] ?? 0,
//         vendors: DataVendor.fromJson(json["vendors"] ?? {}),
//         startTime: json["startTime"] ?? "",
//         endTime: json["endTime"] ?? "",
//         isActive: json["isActive"] ?? false,
//         createdBy: json["createdBy"] ?? "",
//         createdOn: json["createdOn"] ?? "",
//         modifiedBy: json["modifiedBy"] ?? "",
//         modifiedOn: json["modifiedOn"] ?? "",
//         //applicationUserCreator: json["applicationUserCreator"] ?? "",
//         // applicationUserModifier: json["applicationUserModifier"] ?? "",
//         timeDuration: json["timeDuration"] ?? 0,
//         duration: json["duration"] ?? 0,
//         slot: json["slot"] ?? "",
//         resource: json["resource"] ?? "",
//         slotList: json["slotList"] ?? "",
//         startTimeList: json["startTimeList"] ?? "",
//         endTimeList: json["endTimeList"] ?? "",
//         resourceId: json["resourceId"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "vendorId": vendorId,
//         "vendors": vendors.toJson(),
//         "startTime": startTime,
//         "endTime": endTime,
//         "isActive": isActive,
//         "createdBy": createdBy,
//         "createdOn": createdOn,
//         "modifiedBy": modifiedBy,
//         "modifiedOn": modifiedOn,
//         //"applicationUserCreator": applicationUserCreator,
//         // "applicationUserModifier": applicationUserModifier,
//         "timeDuration": timeDuration,
//         "duration": duration,
//         "slot": slot,
//         "resource": resource,
//         "slotList": slotList,
//         "startTimeList": startTimeList,
//         "endTimeList": endTimeList,
//         "resourceId": resourceId,
//       };
// }*/

import 'dart:convert';

VendorEditProfileModel vendorEditProfileModelFromJson(String str) => VendorEditProfileModel.fromJson(json.decode(str));

String vendorEditProfileModelToJson(VendorEditProfileModel data) => json.encode(data.toJson());

class VendorEditProfileModel {
  VendorEditProfileModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory VendorEditProfileModel.fromJson(Map<String, dynamic> json) => VendorEditProfileModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
  };
}