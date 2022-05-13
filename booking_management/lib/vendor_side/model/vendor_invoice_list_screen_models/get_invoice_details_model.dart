import 'dart:convert';

GetInvoiceDetailsModel getOrderDetailsModelFromJson(String str) => GetInvoiceDetailsModel.fromJson(json.decode(str));

String getOrderDetailsModelToJson(GetInvoiceDetailsModel data) => json.encode(data.toJson());

class GetInvoiceDetailsModel {
  GetInvoiceDetailsModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  OrderDetailsData data;

  factory GetInvoiceDetailsModel.fromJson(Map<String, dynamic> json) => GetInvoiceDetailsModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: OrderDetailsData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": data.toJson(),
  };
}

class OrderDetailsData {
  OrderDetailsData({
    required this.id,
    required this.transactionFor,
    required this.transactionForId,
    required this.transactionDate,
    required this.transactionCode,
    required this.transactionStatus,
    required this.detail,
    required this.transactionBy,
    required this.applicationUsercustomer,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.bookingId,
    required this.paymentIntentId,
    required this.customer,
    required this.vendor,
    required this.order,
  });

  int id;
  String transactionFor;
  String transactionForId;
  String transactionDate;
  String transactionCode;
  String transactionStatus;
  String detail;
  String transactionBy;
  ApplicationUser applicationUsercustomer;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  String bookingId;
  String paymentIntentId;
  Customer customer;
  Vendor vendor;
  String order;

  factory OrderDetailsData.fromJson(Map<String, dynamic> json) => OrderDetailsData(
    id: json["id"] ?? 0,
    transactionFor: json["transactionFor"] ?? "",
    transactionForId: json["transactionForId"] ?? "",
    transactionDate: json["transactionDate"] ?? "",
    transactionCode: json["transactionCode"] ?? "",
    transactionStatus: json["transactionStatus"] ?? "",
    detail: json["detail"] ?? "",
    transactionBy: json["transactionBy"] ?? "",
    applicationUsercustomer: ApplicationUser.fromJson(json["applicationUsercustomer"] ?? {}),
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    bookingId: json["bookingId"] ?? "",
    paymentIntentId: json["paymentIntentId"] ?? "",
    customer: Customer.fromJson(json["customer"] ?? {}),
    vendor: Vendor.fromJson(json["vendor"] ?? {}),
    order: json["order"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transactionFor": transactionFor,
    "transactionForId": transactionForId,
    "transactionDate": transactionDate,
    "transactionCode": transactionCode,
    "transactionStatus": transactionStatus,
    "detail": detail,
    "transactionBy": transactionBy,
    "applicationUsercustomer": applicationUsercustomer.toJson(),
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "bookingId": bookingId,
    "paymentIntentId": paymentIntentId,
    "customer": customer.toJson(),
    "vendor": vendor.toJson(),
    "order": order,
  };
}

class ApplicationUser {
  ApplicationUser({
    required this.apiToken,
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

  String apiToken;
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
    apiToken: json["apiToken"] ?? "",
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
    "apiToken": apiToken,
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

class Vendor {
  Vendor({
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
  });

  int id;
  // String categories;
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
  int latitude;
  int longitude;
  String vendorVerificationDate;
  // String applicationUser;
  String modifiedBy;
  String modifiedOn;
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
  String vendorList;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
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
    latitude: json["latitude"] ?? 0,
    longitude: json["longitude"] ?? 0,
    vendorVerificationDate: json["vendorVerificationDate"] ?? "",
    // applicationUser: json["applicationUser"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
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
    vendorList: json["vendorList"] ?? "",
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
    // "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
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
    // this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    // this.applicationUserModifier,
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
  // ApplicationUser applicationUser;
  String modifiedBy;
  String modifiedOn;
  // dynamic applicationUserModifier;
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
    // applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    // applicationUserModifier: json["applicationUserModifier"],
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
    // "applicationUser": applicationUser.toJson(),
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


