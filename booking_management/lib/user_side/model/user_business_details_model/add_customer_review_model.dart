import 'dart:convert';

AddCustomerReviewsModel addCustomerReviewsModelFromJson(String str) => AddCustomerReviewsModel.fromJson(json.decode(str));

String addCustomerReviewsModelToJson(AddCustomerReviewsModel data) => json.encode(data.toJson());

class AddCustomerReviewsModel {
  AddCustomerReviewsModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  String data;

  factory AddCustomerReviewsModel.fromJson(Map<String, dynamic> json) => AddCustomerReviewsModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: json["data"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": data,
  };
}
