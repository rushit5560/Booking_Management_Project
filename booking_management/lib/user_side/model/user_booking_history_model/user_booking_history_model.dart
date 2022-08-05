// To parse this JSON data, do
//
//     final userBookingHistoryModel = userBookingHistoryModelFromJson(jsonString);

import 'dart:convert';

UserBookingHistoryModel userBookingHistoryModelFromJson(String str) => UserBookingHistoryModel.fromJson(json.decode(str));

String userBookingHistoryModelToJson(UserBookingHistoryModel data) => json.encode(data.toJson());

class UserBookingHistoryModel {
  UserBookingHistoryModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<Datum> data;

  factory UserBookingHistoryModel.fromJson(Map<String, dynamic> json) => UserBookingHistoryModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.bookingId,
    required this.vendorId,
    required this.vendor,
    required this.customer,
    required this.customerId,
    required this.bookingFor,
    required this.bookingForId,
    required this.bookingForName,
    required this.startDateTime,
    required this.endDateTime,
    required this.firstName,
    required this.email,
    required this.phoneNo,
    required this.notes,
    required this.status,
    required this.bookingItems,
    required this.serviceName,
    required this.service,
    required this.price,
  });

  int id;
  String bookingId;
  int vendorId;
  Vendor vendor;
  Customer customer;
  int customerId;
  String bookingFor;
  String bookingForId;
  String bookingForName;
  String startDateTime;
  String endDateTime;
  String firstName;
  String email;
  String phoneNo;
  String notes;
  String status;
  String bookingItems;
  String serviceName;
  String service;
  String price;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    bookingId: json["bookingId"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    vendor: Vendor.fromJson(json["vendor"]),
    customer: Customer.fromJson(json["customer"]),
    customerId: json["customerId"] ?? 0,
    bookingFor: json["bookingFor"] ?? "",
    bookingForId: json["bookingForId"] ?? "",
    bookingForName: json["bookingForName"] ?? "",
    startDateTime: json["startDateTime"] ?? "",
    endDateTime: json["endDateTime"] ?? "",
    firstName: json["firstName"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    notes: json["notes"] ?? "",
    status: json["status"] ?? "",
    bookingItems: json["bookingItems"] ?? "",
    serviceName: json["serviceName"] ?? "",
    service: json["service"] ?? "",
    price: json["price"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookingId": bookingId,
    "vendorId": vendorId,
    "vendor": vendor.toJson(),
    "customer": customer.toJson(),
    "customerId": customerId,
    "bookingFor": bookingFor,
    "bookingForId": bookingForId,
    "bookingForName": bookingForName,
    "startDateTime": startDateTime,
    "endDateTime": endDateTime,
    "firstName": firstName,
    "email": email,
    "phoneNo": phoneNo,
    "notes": notes,
    "status": status,
    "bookingItems": bookingItems,
    "serviceName": serviceName,
    "service": service,
    "price": price,
  };


}

class Customer {
  Customer({
    this.id,
    this.email,
    this.phoneNo,
    this.gender,
    this.userName,
    this.dateOfBirth,
    this.isActive,
    this.userId,
    this.applicationUser,
    this.modifiedBy,
    this.modifiedOn,
    this.applicationUserModifier,
    this.image,
    this.passwordHash,
    this.notes,
    this.resourceId,
    this.bookingId,
    this.isPriceDisplay,
    this.duration,
    this.termsConditions,
    this.fullName,
    this.fullId,
  });

  int? id;
  String? email;
  String? phoneNo;
  dynamic gender;
  String? userName;
  dynamic dateOfBirth;
  bool? isActive;
  String? userId;
  ApplicationUser? applicationUser;
  String? modifiedBy;
  DateTime? modifiedOn;
  ApplicationUser? applicationUserModifier;
  String? image;
  dynamic passwordHash;
  dynamic notes;
  dynamic resourceId;
  dynamic bookingId;
  bool? isPriceDisplay;
  dynamic duration;
  bool? termsConditions;
  dynamic fullName;
  dynamic fullId;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    email: json["email"],
    phoneNo: json["phoneNo"],
    gender: json["gender"],
    userName: json["userName"],
    dateOfBirth: json["dateOfBirth"],
    isActive: json["isActive"],
    userId: json["userId"],
    applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
    modifiedBy: json["modifiedBy"],
    modifiedOn: DateTime.parse(json["modifiedOn"]),
    applicationUserModifier: ApplicationUser.fromJson(json["applicationUserModifier"]),
    image: json["image"],
    passwordHash: json["passwordHash"],
    notes: json["notes"],
    resourceId: json["resourceId"],
    bookingId: json["bookingId"],
    isPriceDisplay: json["isPriceDisplay"],
    duration: json["duration"],
    termsConditions: json["termsConditions"],
    fullName: json["fullName"],
    fullId: json["fullId"],
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
    "applicationUser": applicationUser!.toJson(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn!.toIso8601String(),
    "applicationUserModifier": applicationUserModifier!.toJson(),
    "image": image,
    "passwordHash": passwordHash,
    "notes": notes,
    "resourceId": resourceId,
    "bookingId": bookingId,
    "isPriceDisplay": isPriceDisplay,
    "duration": duration,
    "termsConditions": termsConditions,
    "fullName": fullName,
    "fullId": fullId,
  };
}

class ApplicationUser {
  ApplicationUser({
    this.apiToken,
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
    this.accessFailedCount,
  });

  String? apiToken;
  dynamic frogotToken;
  String? fcmToken;
  bool? termsConditions;
  String? fullName;
  dynamic returnUrl;
  dynamic externalLogins;
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
  dynamic lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  factory ApplicationUser.fromJson(Map<String, dynamic> json) => ApplicationUser(
    apiToken: json["apiToken"],
    frogotToken: json["frogotToken"],
    fcmToken: json["fcmToken"],
    termsConditions: json["termsConditions"],
    fullName: json["fullName"],
    returnUrl: json["returnUrl"],
    externalLogins: json["externalLogins"],
    id: json["id"],
    userName: json["userName"],
    normalizedUserName: json["normalizedUserName"],
    email: json["email"],
    normalizedEmail: json["normalizedEmail"],
    emailConfirmed: json["emailConfirmed"],
    passwordHash: json["passwordHash"],
    securityStamp: json["securityStamp"],
    concurrencyStamp: json["concurrencyStamp"],
    phoneNumber: json["phoneNumber"],
    phoneNumberConfirmed: json["phoneNumberConfirmed"],
    twoFactorEnabled: json["twoFactorEnabled"],
    lockoutEnd: json["lockoutEnd"],
    lockoutEnabled: json["lockoutEnabled"],
    accessFailedCount: json["accessFailedCount"],
  );

  Map<String, dynamic> toJson() => {
    "apiToken": apiToken,
    "frogotToken": frogotToken,
    "fcmToken": fcmToken,
    "termsConditions": termsConditions,
    "fullName": fullName,
    "returnUrl": returnUrl,
    "externalLogins": externalLogins,
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

class Vendor {
  Vendor({
    this.id,
    this.categories,
    this.categoryId,
    this.businessName,
    this.businessLogo,
    this.street,
    this.suburb,
    this.postcode,
    this.state,
    this.country,
    this.userName,
    this.email,
    this.phoneNo,
    this.address,
    this.isActive,
    this.userId,
    this.vendorPortal,
    this.vendorVerification,
    this.businessId,
    this.isResource,
    this.isPriceDisplay,
    this.confirmation,
    this.isServiceSlots,
    this.latitude,
    this.longitude,
    this.firstPayment,
    this.nextPayment,
    this.vendorVerificationDate,
    this.applicationUser,
    this.modifiedBy,
    this.modifiedOn,
    this.applicationUserModifier,
    this.review,
    this.rating,
    this.vendorWorkingHours,
    this.status,
    this.category,
    this.passwordHash,
    this.workingHoursStatus,
    this.avilableTime,
    this.dDate,
    this.duration,
    this.startTime,
    this.endTime,
    this.vendorList,
    this.additionalSlot,
    this.resourceList,
    this.resourceId,
    this.service,
    this.resource,
    this.termsConditions,
    this.fullName,
    this.stripeId,
    this.vendorStripeAccountId,
    this.financialInstitutionName,
    this.accountName,
    this.accountCode,
    this.accountNumber,
    this.countryList,
  });

  int? id;
  dynamic categories;
  int? categoryId;
  String? businessName;
  String? businessLogo;
  dynamic street;
  dynamic suburb;
  dynamic postcode;
  dynamic state;
  String? country;
  String? userName;
  String? email;
  String? phoneNo;
  String? address;
  bool? isActive;
  String? userId;
  bool? vendorPortal;
  bool? vendorVerification;
  String? businessId;
  bool? isResource;
  bool? isPriceDisplay;
  bool? confirmation;
  bool? isServiceSlots;
  String? latitude;
  String? longitude;
  DateTime? firstPayment;
  DateTime? nextPayment;
  DateTime? vendorVerificationDate;
  dynamic applicationUser;
  String? modifiedBy;
  DateTime? modifiedOn;
  dynamic applicationUserModifier;
  dynamic review;
  dynamic rating;
  dynamic vendorWorkingHours;
  dynamic status;
  dynamic category;
  dynamic passwordHash;
  dynamic workingHoursStatus;
  dynamic avilableTime;
  DateTime? dDate;
  dynamic duration;
  dynamic startTime;
  dynamic endTime;
  dynamic vendorList;
  dynamic additionalSlot;
  dynamic resourceList;
  dynamic resourceId;
  dynamic service;
  dynamic resource;
  bool? termsConditions;
  dynamic fullName;
  String? stripeId;
  String? vendorStripeAccountId;
  String? financialInstitutionName;
  String? accountName;
  String? accountCode;
  String? accountNumber;
  dynamic countryList;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    categories: json["categories"],
    categoryId: json["categoryId"],
    businessName: json["businessName"],
    businessLogo: json["businessLogo"],
    street: json["street"],
    suburb: json["suburb"],
    postcode: json["postcode"],
    state: json["state"],
    country: json["country"],
    userName: json["userName"],
    email: json["email"],
    phoneNo: json["phoneNo"],
    address: json["address"],
    isActive: json["isActive"],
    userId: json["userId"],
    vendorPortal: json["vendorPortal"],
    vendorVerification: json["vendorVerification"],
    businessId: json["businessId"],
    isResource: json["isResource"],
    isPriceDisplay: json["isPriceDisplay"],
    confirmation: json["confirmation"],
    isServiceSlots: json["isServiceSlots"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    firstPayment: DateTime.parse(json["firstPayment"]),
    nextPayment: DateTime.parse(json["nextPayment"]),
    vendorVerificationDate: DateTime.parse(json["vendorVerificationDate"]),
    applicationUser: json["applicationUser"],
    modifiedBy: json["modifiedBy"],
    modifiedOn: DateTime.parse(json["modifiedOn"]),
    applicationUserModifier: json["applicationUserModifier"],
    review: json["review"],
    rating: json["rating"],
    vendorWorkingHours: json["vendorWorkingHours"],
    status: json["status"],
    category: json["category"],
    passwordHash: json["passwordHash"],
    workingHoursStatus: json["workingHoursStatus"],
    avilableTime: json["avilableTime"],
    dDate: DateTime.parse(json["dDate"]),
    duration: json["duration"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    vendorList: json["vendorList"],
    additionalSlot: json["additionalSlot"],
    resourceList: json["resourceList"],
    resourceId: json["resourceId"],
    service: json["service"],
    resource: json["resource"],
    termsConditions: json["termsConditions"],
    fullName: json["fullName"],
    stripeId: json["stripeId"],
    vendorStripeAccountId: json["vendorStripeAccountId"],
    financialInstitutionName: json["financialInstitutionName"],
    accountName: json["accountName"],
    accountCode: json["accountCode"],
    accountNumber: json["accountNumber"],
    countryList: json["countryList"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": categories,
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
    "firstPayment": firstPayment!.toIso8601String(),
    "nextPayment": nextPayment!.toIso8601String(),
    "vendorVerificationDate": vendorVerificationDate!.toIso8601String(),
    "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn!.toIso8601String(),
    "applicationUserModifier": applicationUserModifier,
    "review": review,
    "rating": rating,
    "vendorWorkingHours": vendorWorkingHours,
    "status": status,
    "category": category,
    "passwordHash": passwordHash,
    "workingHoursStatus": workingHoursStatus,
    "avilableTime": avilableTime,
    "dDate": dDate!.toIso8601String(),
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
    "stripeId": stripeId,
    "vendorStripeAccountId": vendorStripeAccountId,
    "financialInstitutionName": financialInstitutionName,
    "accountName": accountName,
    "accountCode": accountCode,
    "accountNumber": accountNumber,
    "countryList": countryList,
  };
}

