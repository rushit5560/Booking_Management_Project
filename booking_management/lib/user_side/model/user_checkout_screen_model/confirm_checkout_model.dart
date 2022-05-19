import 'dart:convert';

ConfirmCheckoutModel confirmCheckoutModelFromJson(String str) => ConfirmCheckoutModel.fromJson(json.decode(str));

String confirmCheckoutModelToJson(ConfirmCheckoutModel data) => json.encode(data.toJson());

class ConfirmCheckoutModel {
  ConfirmCheckoutModel({
    required this.statusCode,
    required this.success,
    required this.id,
  });

  int statusCode;
  bool success;
  String id;

  factory ConfirmCheckoutModel.fromJson(Map<String, dynamic> json) => ConfirmCheckoutModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    id: json["id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "id": id,
  };
}
