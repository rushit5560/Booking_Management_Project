import 'dart:convert';

AppointmentDetailsModel appointmentDetailsModelFromJson(String str) =>
    AppointmentDetailsModel.fromJson(json.decode(str));

String appointmentDetailsModelToJson(AppointmentDetailsModel data) =>
    json.encode(data.toJson());

class AppointmentDetailsModel {
  AppointmentDetailsModel(
      {required this.statusCode,
      required this.success,
      required this.data,
      required this.list});

  int statusCode;
  bool success;
  AppointmentDetailsData data;
  List<String> list;

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) =>
      AppointmentDetailsModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        data: AppointmentDetailsData.fromJson(json["data"] ?? {}),
        list: List<String>.from(json["list"].map((x) => x) ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "data": data.toJson(),
        "list": List<dynamic>.from(list.map((x) => x)),
      };
}

class AppointmentDetailsData {
  AppointmentDetailsData({
    this.id,
    this.bookingId,
    this.vendorId,
    this.vendor,
    this.customer,
    this.customerId,
    this.bookingFor,
    this.bookingForId,
    this.startDateTime,
    this.endDateTime,
    this.firstName,
    this.email,
    this.phoneNo,
    this.notes,
    this.status,
    this.bookingItems,
    this.serviceName,
  });

  int? id;
  String? bookingId;
  int? vendorId;
  Vendor? vendor;
  AppointmentCustomer? customer;
  int? customerId;
  String? bookingFor;
  String? bookingForId;
  String? startDateTime;
  String? endDateTime;
  String? firstName;
  String? email;
  String? phoneNo;
  String? notes;
  String? status;
  String? bookingItems;
  String? serviceName;

  factory AppointmentDetailsData.fromJson(Map<String, dynamic> json) =>
      AppointmentDetailsData(
        id: json["id"] ?? 0,
        bookingId: json["bookingId"] ?? "",
        vendorId: json["vendorId"] ?? 0,
        vendor: Vendor.fromJson(json["vendor"] ?? {}),
        customer: AppointmentCustomer.fromJson(json["customer"] ?? {}),
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
        "vendor": vendor!.toJson(),
        "customer": customer!.toJson(),
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

class AppointmentCustomer {
  AppointmentCustomer({
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
  // dynamic applicationUser;
  String modifiedBy;
  String modifiedOn;
  // dynamic applicationUserModifier;
  String passwordHash;
  String notes;
  String bookingId;
  bool isPriceDisplay;

  factory AppointmentCustomer.fromJson(Map<String, dynamic> json) =>
      AppointmentCustomer(
        id: json["id"] ?? 0,
        email: json["email"] ?? "",
        phoneNo: json["phoneNo"] ?? "",
        gender: json["gender"] ?? "",
        userName: json["userName"] ?? "",
        dateOfBirth: json["dateOfBirth"] ?? "",
        isActive: json["isActive"] ?? false,
        userId: json["userId"] ?? "",
        // applicationUser: json["applicationUser"],
        modifiedBy: json["modifiedBy"] ?? "",
        modifiedOn: json["modifiedOn"] ?? "",
        // applicationUserModifier: json["applicationUserModifier"],
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
        // "applicationUser": applicationUser,
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        // "applicationUserModifier": applicationUserModifier,
        "passwordHash": passwordHash,
        "notes": notes,
        "bookingId": bookingId,
        "isPriceDisplay": isPriceDisplay,
      };
}

class Vendor {
  Vendor({
    required this.userId,
  });

  String userId;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        userId: json["userId"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
      };
}
