import 'dart:convert';

GetBusinessHoursModel getBusinessHoursModelFromJson(String str) => GetBusinessHoursModel.fromJson(json.decode(str));

String getBusinessHoursModelToJson(GetBusinessHoursModel data) => json.encode(data.toJson());

class GetBusinessHoursModel {
  GetBusinessHoursModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<BusinessHoursDatum> data;

  factory GetBusinessHoursModel.fromJson(Map<String, dynamic> json) => GetBusinessHoursModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<BusinessHoursDatum>.from(json["data"].map((x) => BusinessHoursDatum.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BusinessHoursDatum {
  BusinessHoursDatum({
    required this.id,
    required this.vendorId,
    // this.vendors,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.isActive,
  });

  int id;
  int vendorId;
  // Vendors vendors;
  String day;
  String startTime;
  String endTime;
  bool isActive;

  factory BusinessHoursDatum.fromJson(Map<String, dynamic> json) => BusinessHoursDatum(
    id: json["id"] ?? 0,
    vendorId: json["vendorId"] ?? 0,
    // vendors: Vendors.fromJson(json["vendors"]),
    day: json["day"] ?? "",
    startTime: json["startTime"] ?? "00:00",
    endTime: json["endTime"] ?? "00:00",
    isActive: json["isActive"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendorId": vendorId,
    // "vendors": vendors.toJson(),
    "day": day,
    "startTime": startTime,
    "endTime": endTime,
    "isActive": isActive,
  };
}

// class Vendors {
//   Vendors({
//     this.id,
//     this.categories,
//     this.categoryId,
//     this.businessName,
//     this.businessLogo,
//     this.street,
//     this.suburb,
//     this.postcode,
//     this.state,
//     this.country,
//     this.userName,
//     this.email,
//     this.phoneNo,
//     this.address,
//     this.isActive,
//     this.userId,
//     this.vendorPortal,
//     this.vendorVerification,
//     this.businessId,
//     this.isResource,
//     this.isPriceDisplay,
//     this.confirmation,
//     this.isServiceSlots,
//     this.latitude,
//     this.longitude,
//     this.vendorVerificationDate,
//     this.applicationUser,
//     this.modifiedBy,
//     this.modifiedOn,
//     this.applicationUserModifier,
//     this.review,
//     this.rating,
//     this.vendorWorkingHours,
//     this.status,
//     this.category,
//     this.passwordHash,
//     this.workingHoursStatus,
//     this.avilableTime,
//     this.dDate,
//     this.duration,
//     this.startTime,
//     this.endTime,
//     this.vendorList,
//     this.additionalSlot,
//   });
//
//   int id;
//   dynamic categories;
//   int categoryId;
//   String businessName;
//   dynamic businessLogo;
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
//   int latitude;
//   int longitude;
//   DateTime vendorVerificationDate;
//   dynamic applicationUser;
//   String modifiedBy;
//   DateTime modifiedOn;
//   dynamic applicationUserModifier;
//   dynamic review;
//   dynamic rating;
//   dynamic vendorWorkingHours;
//   dynamic status;
//   dynamic category;
//   dynamic passwordHash;
//   dynamic workingHoursStatus;
//   dynamic avilableTime;
//   dynamic dDate;
//   dynamic duration;
//   dynamic startTime;
//   dynamic endTime;
//   dynamic vendorList;
//   dynamic additionalSlot;
//
//   factory Vendors.fromJson(Map<String, dynamic> json) => Vendors(
//     id: json["id"],
//     categories: json["categories"],
//     categoryId: json["categoryId"],
//     businessName: json["businessName"],
//     businessLogo: json["businessLogo"],
//     street: json["street"],
//     suburb: json["suburb"],
//     postcode: json["postcode"],
//     state: json["state"],
//     country: json["country"],
//     userName: json["userName"],
//     email: json["email"],
//     phoneNo: json["phoneNo"],
//     address: json["address"],
//     isActive: json["isActive"],
//     userId: json["userId"],
//     vendorPortal: json["vendorPortal"],
//     vendorVerification: json["vendorVerification"],
//     businessId: json["businessId"],
//     isResource: json["isResource"],
//     isPriceDisplay: json["isPriceDisplay"],
//     confirmation: json["confirmation"],
//     isServiceSlots: json["isServiceSlots"],
//     latitude: json["latitude"],
//     longitude: json["longitude"],
//     vendorVerificationDate: DateTime.parse(json["vendorVerificationDate"]),
//     applicationUser: json["applicationUser"],
//     modifiedBy: json["modifiedBy"],
//     modifiedOn: DateTime.parse(json["modifiedOn"]),
//     applicationUserModifier: json["applicationUserModifier"],
//     review: json["review"],
//     rating: json["rating"],
//     vendorWorkingHours: json["vendorWorkingHours"],
//     status: json["status"],
//     category: json["category"],
//     passwordHash: json["passwordHash"],
//     workingHoursStatus: json["workingHoursStatus"],
//     avilableTime: json["avilableTime"],
//     dDate: json["dDate"],
//     duration: json["duration"],
//     startTime: json["startTime"],
//     endTime: json["endTime"],
//     vendorList: json["vendorList"],
//     additionalSlot: json["additionalSlot"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "categories": categories,
//     "categoryId": categoryId,
//     "businessName": businessName,
//     "businessLogo": businessLogo,
//     "street": street,
//     "suburb": suburb,
//     "postcode": postcode,
//     "state": state,
//     "country": country,
//     "userName": userName,
//     "email": email,
//     "phoneNo": phoneNo,
//     "address": address,
//     "isActive": isActive,
//     "userId": userId,
//     "vendorPortal": vendorPortal,
//     "vendorVerification": vendorVerification,
//     "businessId": businessId,
//     "isResource": isResource,
//     "isPriceDisplay": isPriceDisplay,
//     "confirmation": confirmation,
//     "isServiceSlots": isServiceSlots,
//     "latitude": latitude,
//     "longitude": longitude,
//     "vendorVerificationDate": vendorVerificationDate.toIso8601String(),
//     "applicationUser": applicationUser,
//     "modifiedBy": modifiedBy,
//     "modifiedOn": modifiedOn.toIso8601String(),
//     "applicationUserModifier": applicationUserModifier,
//     "review": review,
//     "rating": rating,
//     "vendorWorkingHours": vendorWorkingHours,
//     "status": status,
//     "category": category,
//     "passwordHash": passwordHash,
//     "workingHoursStatus": workingHoursStatus,
//     "avilableTime": avilableTime,
//     "dDate": dDate,
//     "duration": duration,
//     "startTime": startTime,
//     "endTime": endTime,
//     "vendorList": vendorList,
//     "additionalSlot": additionalSlot,
//   };
// }
