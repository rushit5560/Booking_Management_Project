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
  });

  int statusCode;
  bool success;
  WorkerList workerList;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
    statusCode: json["statusCode"],
    success: json["success"],
    workerList: WorkerList.fromJson(json["workerList"]),
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
    required this.email,
    this.password,
    required this.userName,
    this.phoneNumber,
    this.apiToken,
    required this.frogotToken,
    this.role,
  });

  String id;
  String email;
  dynamic password;
  String userName;
  dynamic phoneNumber;
  dynamic apiToken;
  String frogotToken;
  dynamic role;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    userName: json["userName"],
    phoneNumber: json["phoneNumber"],
    apiToken: json["apiToken"],
    frogotToken: json["frogotToken"],
    role: json["role"],
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
