import 'dart:convert';

BookingSuccessModel bookingSuccessModelFromJson(String str) => BookingSuccessModel.fromJson(json.decode(str));

String bookingSuccessModelToJson(BookingSuccessModel data) => json.encode(data.toJson());

class BookingSuccessModel {
  BookingSuccessModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  WorkerList workerList;

  factory BookingSuccessModel.fromJson(Map<String, dynamic> json) => BookingSuccessModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: WorkerList.fromJson(json["workerList"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": workerList.toJson(),
  };
}

class WorkerList {
  WorkerList({
    required this.id,
    required this.bookingId,
    required this.vendorId,
    required this.vendor,
    // required this.customer,
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
  Vendor vendor;
  // Customer customer;
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

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"] ?? 0,
    bookingId: json["bookingId"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    vendor: Vendor.fromJson(json["vendor"] ?? {}),
    // customer: Customer.fromJson(json["customer"] ?? {}),
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
    "vendor": vendor.toJson(),
    // "customer": customer.toJson(),
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
  // ApplicationUser applicationUserModifier;
  String passwordHash;
  String notes;
  String bookingId;
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
    // applicationUserModifier: ApplicationUser.fromJson(json["applicationUserModifier"]),
    passwordHash: json["passwordHash"] ?? "",
    notes: json["notes"] ?? "",
    bookingId: json["bookingId"] ?? "",
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
    // "applicationUserModifier": applicationUserModifier.toJson(),
    "passwordHash": passwordHash,
    "notes": notes,
    "bookingId": bookingId,
    "isPriceDisplay": isPriceDisplay,
  };
}


class Vendor {
  Vendor({
    required this.businessName,
    required this.userId,
  });

  String businessName;
  String userId;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    businessName: json["businessName"] ?? "",
     userId: json["userId"] ?? "", 
  );

  Map<String, dynamic> toJson() => {
    "businessName": businessName,
    "userId": userId,
  };
}

