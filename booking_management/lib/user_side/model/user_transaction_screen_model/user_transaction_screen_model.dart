import 'dart:convert';

GetUserTransactionModel getUserTransactionModelFromJson(String str) => GetUserTransactionModel.fromJson(json.decode(str));

String getUserTransactionModelToJson(GetUserTransactionModel data) => json.encode(data.toJson());

class GetUserTransactionModel {
  GetUserTransactionModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<WorkerList> workerList;

  factory GetUserTransactionModel.fromJson(Map<String, dynamic> json) => GetUserTransactionModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<WorkerList>.from(json["workerList"].map((x) => WorkerList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}


class WorkerList {
  WorkerList({
    required this.id,
    required this.bookingId,
    required this.orderDate,
    required this.price,
    required this.paidBy,
    required this.vendor,
    required this.quantity,
  });

  int id;
  String bookingId;
  String orderDate;
  double price;
  String paidBy;
  Vendor vendor;
  int quantity;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"] ?? 0,
    bookingId: json["bookingId"] ?? "",
    orderDate: json["orderDate"] ?? "",
    price: json["price"] ?? 0.0,
    quantity: json["quantity"] ?? 0,
    paidBy: json["paidBy"] ?? "",
    vendor: Vendor.fromJson(json["vendor"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookingId": bookingId,
    "orderDate": orderDate,
    "price": price,
    "paidBy": paidBy,
    "vendor": vendor.toJson(),
    "quantity": quantity,
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
    required this.fullName,
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
  String fullName;

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
    fullName: json["fullName"] ?? "",
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
    "fullName": fullName,
  };
}

/*
class ApplicationUserCreator {
  String apiToken;
  String frogotToken;
  String fcmToken;
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

  ApplicationUserCreator(
      {
        required this.apiToken,
        required this.frogotToken,
        required this.fcmToken,
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
        required this.accessFailedCount
      });

  ApplicationUserCreator.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    frogotToken = json['frogotToken'];
    fcmToken = json['fcmToken'];
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
}*/
