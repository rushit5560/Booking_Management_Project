// To parse this JSON data, do
//
//     final forgotPasswordModel = forgotPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
  ForgotPasswordModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
    required this.message,
  });

  int statusCode;
  bool success;
  WorkerList workerList;
  String message;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: WorkerList.fromJson(json["workerList"] ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": workerList.toJson(),
    "message": message,
  };
}

class WorkerList {
  WorkerList({
    required this.id,
    required this.email,
    required this.password,
    required this.userName,
    required this.phoneNumber,
    required this.apiToken,
    required this.frogotToken,
    required this.role,
  });

  String id;
  String email;
  String password;
  String userName;
  String phoneNumber;
  String apiToken;
  String frogotToken;
  String role;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"] ?? "",
    email: json["email"] ?? "",
    password: json["password"] ?? "",
    userName: json["userName"] ?? "",
    phoneNumber: json["phoneNumber"] ?? "",
    apiToken: json["apiToken"] ?? "",
    frogotToken: json["frogotToken"] ?? "",
    role: json["role"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "userName": userName,
    "phoneNumber": phoneNumber,
    "apiToken": apiToken,
    "frogotToken": frogotToken,
    "role": role,
  };
}
