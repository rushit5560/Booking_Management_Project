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
