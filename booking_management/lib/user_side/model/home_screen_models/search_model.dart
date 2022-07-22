// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.statusCode,
    required this.success,
    required this.data,
    required this.message
  });

  int statusCode;
  bool success;
  List<String> data;
  String message;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<String>.from(json["data"].map((x) => x ?? "")),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x)),
    "message": message,
  };
}
