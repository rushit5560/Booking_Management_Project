import 'dart:convert';

BookAppointmentModel bookAppointmentModelFromJson(String str) => BookAppointmentModel.fromJson(json.decode(str));

String bookAppointmentModelToJson(BookAppointmentModel data) => json.encode(data.toJson());

class BookAppointmentModel {
  BookAppointmentModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.id,
  });

  int statusCode;
  bool success;
  String message;
  String id;

  factory BookAppointmentModel.fromJson(Map<String, dynamic> json) => BookAppointmentModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    id: json["id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "id": id,
  };
}