import 'dart:convert';

AppointmentStatusChangeModel appointmentStatusChangeModelFromJson(String str) => AppointmentStatusChangeModel.fromJson(json.decode(str));

String appointmentStatusChangeModelToJson(AppointmentStatusChangeModel data) => json.encode(data.toJson());

class AppointmentStatusChangeModel {
  AppointmentStatusChangeModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  Data data;

  factory AppointmentStatusChangeModel.fromJson(Map<String, dynamic> json) => AppointmentStatusChangeModel(
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
    required this.bookingId,
    required this.vendorId,
    // this.vendor,
    // this.customer,
    required this.customerId,
    required this.bookingFor,
    required this.bookingForId,
    required this.startDateTime,
    required this.endDateTime,
    required this.firstName,
    required this.email,
    required this.phoneNo,
    required this.notes,
    required this.status,
    required this.bookingItems,
    required this.serviceName,
  });

  int id;
  String bookingId;
  int vendorId;
  // Vendor vendor;
  // dynamic customer;
  int customerId;
  String bookingFor;
  String bookingForId;
  String startDateTime;
  String endDateTime;
  String firstName;
  String email;
  String phoneNo;
  String notes;
  String status;
  String bookingItems;
  String serviceName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    bookingId: json["bookingId"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    // vendor: Vendor.fromJson(json["vendor"]),
    // customer: json["customer"],
    customerId: json["customerId"] ?? 0,
    bookingFor: json["bookingFor"] ?? "",
    bookingForId: json["bookingForId"] ?? "",
    startDateTime: json["startDateTime"] ?? "",
    endDateTime: json["endDateTime"] ?? "",
    firstName: json["firstName"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    notes: json["notes"] ?? "",
    status: json["status"] ?? "",
    bookingItems: json["bookingItems"] ?? "",
    serviceName: json["serviceName"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookingId": bookingId,
    "vendorId": vendorId,
    // "vendor": vendor.toJson(),
    // "customer": customer,
    "customerId": customerId,
    "bookingFor": bookingFor,
    "bookingForId": bookingForId,
    "startDateTime": startDateTime,
    "endDateTime": endDateTime,
    "firstName": firstName,
    "email": email,
    "phoneNo": phoneNo,
    "notes": notes,
    "status": status,
    "bookingItems": bookingItems,
    "serviceName": serviceName,
  };
}

// class Vendor {
//   Vendor({
//     required this.id,
//     // this.categories,
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
//     // this.applicationUser,
//     required this.modifiedBy,
//     required this.modifiedOn,
//     // this.applicationUserModifier,
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
//     required this.vendorList,
//     required this.additionalSlot,
//     required this.resourceList,
//     required this.resourceId,
//   });
//
//   int id;
//   // dynamic categories;
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
//   int latitude;
//   int longitude;
//   String vendorVerificationDate;
//   // ApplicationUser applicationUser;
//   String modifiedBy;
//   String modifiedOn;
//   // ApplicationUser applicationUserModifier;
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
//   String vendorList;
//   String additionalSlot;
//   String resourceList;
//   String resourceId;
//
//   factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
//     id: json["id"] ?? 0,
//     // categories: json["categories"],
//     categoryId: json["categoryId"] ?? 0,
//     businessName: json["businessName"] ?? "",
//     businessLogo: json["businessLogo"] ?? "",
//     street: json["street"] ?? "",
//     suburb: json["suburb"] ?? "",
//     postcode: json["postcode"] ?? "",
//     state: json["state"] ?? "",
//     country: json["country"] ?? "",
//     userName: json["userName"] ?? "",
//     email: json["email"] ?? "",
//     phoneNo: json["phoneNo"] ?? "",
//     address: json["address"] ?? "",
//     isActive: json["isActive"] ?? false,
//     userId: json["userId"] ?? "",
//     vendorPortal: json["vendorPortal"] ?? false,
//     vendorVerification: json["vendorVerification"] ?? false,
//     businessId: json["businessId"] ?? "",
//     isResource: json["isResource"] ?? false,
//     isPriceDisplay: json["isPriceDisplay"] ?? false,
//     confirmation: json["confirmation"] ?? false,
//     isServiceSlots: json["isServiceSlots"] ?? false,
//     latitude: json["latitude"] ?? 0,
//     longitude: json["longitude"] ?? 0,
//     vendorVerificationDate: json["vendorVerificationDate"] ?? "",
//     // applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
//     modifiedBy: json["modifiedBy"] ?? "",
//     modifiedOn: json["modifiedOn"] ?? "",
//     // applicationUserModifier: ApplicationUser.fromJson(json["applicationUserModifier"]),
//     review: json["review"] ?? "",
//     rating: json["rating"] ?? "",
//     vendorWorkingHours: json["vendorWorkingHours"] ?? "",
//     status: json["status"] ?? "",
//     category: json["category"] ?? "",
//     passwordHash: json["passwordHash"] ?? "",
//     workingHoursStatus: json["workingHoursStatus"] ?? "",
//     avilableTime: json["avilableTime"] ?? "",
//     dDate: json["dDate"] ?? "",
//     duration: json["duration"] ?? "",
//     startTime: json["startTime"] ?? "",
//     endTime: json["endTime"] ?? "",
//     vendorList: json["vendorList"] ?? "",
//     additionalSlot: json["additionalSlot"] ?? "",
//     resourceList: json["resourceList"] ?? "",
//     resourceId: json["resourceId"] ?? "",
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     // "categories": categories,
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
//     "vendorVerificationDate": vendorVerificationDate,
//     // "applicationUser": applicationUser.toJson(),
//     "modifiedBy": modifiedBy,
//     "modifiedOn": modifiedOn,
//     // "applicationUserModifier": applicationUserModifier.toJson(),
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
//     "resourceList": resourceList,
//     "resourceId": resourceId,
//   };
// }

