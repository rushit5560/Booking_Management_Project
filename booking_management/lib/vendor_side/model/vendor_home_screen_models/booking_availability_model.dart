import 'dart:convert';

BookingAvailabilityModel bookingAvailabilityModelFromJson(String str) => BookingAvailabilityModel.fromJson(json.decode(str));

String bookingAvailabilityModelToJson(BookingAvailabilityModel data) => json.encode(data.toJson());

class BookingAvailabilityModel {
  BookingAvailabilityModel({
    required this.statusCode,
    required this.success,
    required this.availability,
    required this.message,
  });

  int statusCode;
  bool success;
  bool availability;
  String message;

  factory BookingAvailabilityModel.fromJson(Map<String, dynamic> json) => BookingAvailabilityModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    availability: json["availability"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "availability": availability,
    "message": message,
  };
}