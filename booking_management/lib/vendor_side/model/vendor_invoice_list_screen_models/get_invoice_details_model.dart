/*import 'dart:convert';

GetInvoiceDetailsModel getOrderDetailsModelFromJson(String str) => GetInvoiceDetailsModel.fromJson(json.decode(str));

String getOrderDetailsModelToJson(GetInvoiceDetailsModel data) => json.encode(data.toJson());

class GetInvoiceDetailsModel {
  GetInvoiceDetailsModel({
    required this.statusCode,
    required this.success,
    required this.data,
    required this.list,
  });

  int statusCode;
  bool success;
  OrderDetailsData data;
  List<String> list;

  factory GetInvoiceDetailsModel.fromJson(Map<String, dynamic> json) => GetInvoiceDetailsModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: OrderDetailsData.fromJson(json["data"] ?? {}),
    list: List<String>.from(json["list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": data.toJson(),
    "list": List<dynamic>.from(list.map((x) => x)),
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
  String latitude;
  String longitude;
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
    latitude: json["latitude"] ?? "",
    longitude: json["longitude"] ?? "",
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
}*/

// To parse this JSON data, do
//
//     final getInvoiceDetailsModel = getInvoiceDetailsModelFromJson(jsonString);

import 'dart:convert';

GetInvoiceDetailsModel getInvoiceDetailsModelFromJson(String str) => GetInvoiceDetailsModel.fromJson(json.decode(str));

String getInvoiceDetailsModelToJson(GetInvoiceDetailsModel data) => json.encode(data.toJson());

class GetInvoiceDetailsModel {
  GetInvoiceDetailsModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
    required this.list,
  });

  int statusCode;
  bool success;
  WorkerList workerList;
  List<String> list;

  factory GetInvoiceDetailsModel.fromJson(Map<String, dynamic> json) => GetInvoiceDetailsModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: WorkerList.fromJson(json["workerList"] ?? {}),
    list: List<String>.from(json["list"].map((x) => x) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": workerList.toJson(),
    "list": List<dynamic>.from(list.map((x) => x)),
  };
}

class WorkerList {
  WorkerList({
     this.id,
     this.bookingId,
     this.vendorId,
     this.vendor,
     this.customer,
     this.customerId,
     this.bookingFor,
     this.bookingForId,
     this.bookingForName,
     this.startDateTime,
     this.endDateTime,
     this.firstName,
     this.email,
     this.phoneNo,
     this.notes,
     this.status,
     this.bookingItems,
     this.serviceName,
     this.service,
     this.price,
  });

  int ? id;
  String ?  bookingId;
  int ? vendorId;
  Vendor ? vendor;
  Customer ? customer;
  int ? customerId;
  String ? bookingFor;
  String ? bookingForId;
  String ? bookingForName;
  String ? startDateTime;
  String ? endDateTime;
  String ? firstName;
  String ? email;
  String ? phoneNo;
  String ? notes;
  String ? status;
  BookingItems ? bookingItems;
  String ? serviceName;
  String ? service;
  String ? price;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"] ?? 0,
    bookingId: json["bookingId"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    vendor: Vendor.fromJson(json["vendor"] ?? {}),
    customer: Customer.fromJson(json["customer"] ?? {}),
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
    bookingItems: BookingItems.fromJson(json["bookingItems"] ?? {}),
    serviceName: json["serviceName"] ?? "",
    service: json["service"] ?? "",
    price: json["price"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookingId": bookingId,
    "vendorId": vendorId,
    "vendor": vendor!.toJson(),
    "customer": customer!.toJson(),
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
    "bookingItems": bookingItems!.toJson(),
    "serviceName": serviceName,
    "service": service,
    "price": price,
  };
}

class BookingItems {
  BookingItems({
    required this.id,
    required this.bookingId,
    required this.price,
    required this.quantity,
    required this.booking,
    required this.review,
  });

  int id;
  String bookingId;
  double price;
  int quantity;
  String booking;
  String review;

  factory BookingItems.fromJson(Map<String, dynamic> json) => BookingItems(
    id: json["id"] ?? 0,
    bookingId: json["bookingId"] ?? "",
    price: json["price"] ?? 0.0,
    quantity: json["quantity"] ?? 0,
    booking: json["booking"] ?? "",
    review: json["review"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookingId": bookingId,
    "price": price,
    "quantity": quantity,
    "booking": booking,
    "review": review,
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
    required this.modifiedBy,
    required this.modifiedOn,
    required this.passwordHash,
    required this.notes,
    required this.resourceId,
    required this.bookingId,
    required this.isPriceDisplay,
    required this.duration,
    required this.termsConditions,
  });

  int id;
  String email;
  String phoneNo;
  String gender;
  String userName;
  String dateOfBirth;
  bool isActive;
  String userId;
  String modifiedBy;
  String modifiedOn;
  String passwordHash;
  String notes;
  String resourceId;
  String bookingId;
  bool isPriceDisplay;
  String duration;
  bool termsConditions;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"] ?? 0,
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    gender: json["gender"] ?? "",
    userName: json["userName"] ?? "",
    dateOfBirth: json["dateOfBirth"] ?? "",
    isActive: json["isActive"] ?? false,
    userId: json["userId"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"]?? "",
    passwordHash: json["passwordHash"] ?? "",
    notes: json["notes"] ?? "",
    resourceId: json["resourceId"] ?? "",
    bookingId: json["bookingId"] ?? "",
    isPriceDisplay: json["isPriceDisplay"] ?? false,
    duration: json["duration"] ?? "",
    termsConditions: json["termsConditions"] ?? false,
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
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "passwordHash": passwordHash,
    "notes": notes,
    "resourceId": resourceId,
    "bookingId": bookingId,
    "isPriceDisplay": isPriceDisplay,
    "duration": duration,
    "termsConditions": termsConditions,
  };
}

class ApplicationUser {
  ApplicationUser({
    required this.apiToken,
    required this.frogotToken,
    required this.fcmToken,
    required this.termsConditions,
    required this.returnUrl,
    required this.externalLogins,
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
  bool termsConditions;
  String returnUrl;
  String externalLogins;
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
    apiToken: json["apiToken"]?? "",
    frogotToken: json["frogotToken"] ?? "",
    fcmToken: json["fcmToken"] ?? "",
    termsConditions: json["termsConditions"] ?? false,
    returnUrl: json["returnUrl"] ?? "",
    externalLogins: json["externalLogins"] ?? "",
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
    "apiToken": apiToken == null ? null : apiToken,
    "frogotToken": frogotToken,
    "fcmToken": fcmToken == null ? null : fcmToken,
    "termsConditions": termsConditions,
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
    required this.id,
    required this.categories,
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
    required this.firstPayment,
    required this.nextPayment,
    required this.vendorVerificationDate,
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
    required this.additionalSlot,
    required this.resourceList,
    required this.resourceId,
    required this.service,
    required this.resource,
    required this.termsConditions,
  });

  int id;
  String categories;
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
  String latitude;
  String longitude;
  String firstPayment;
  String nextPayment;
  String vendorVerificationDate;
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
  String additionalSlot;
  String resourceList;
  String resourceId;
  String service;
  String resource;
  bool termsConditions;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"] ?? 0,
    categories: json["categories"] ?? "",
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
    latitude: json["latitude"] ?? "",
    longitude: json["longitude"] ?? "",
    firstPayment: json["firstPayment"] ?? "",
    nextPayment: json["nextPayment"] ?? "",
    vendorVerificationDate: json["vendorVerificationDate"] ?? "",
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
    additionalSlot: json["additionalSlot"] ?? "",
    resourceList: json["resourceList"] ?? "",
    resourceId: json["resourceId"] ?? "",
    service: json["service"] ?? "",
    resource: json["resource"] ?? "",
    termsConditions: json["termsConditions"] ?? false,
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
    "firstPayment": firstPayment,
    "nextPayment": nextPayment,
    "vendorVerificationDate": vendorVerificationDate,
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
    "additionalSlot": additionalSlot,
    "resourceList": resourceList,
    "resourceId": resourceId,
    "service": service,
    "resource": resource,
    "termsConditions": termsConditions,
  };
}

