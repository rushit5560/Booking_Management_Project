import 'dart:convert';

GetFcmTokeModel getFcmTokeModelFromJson(String str) => GetFcmTokeModel.fromJson(json.decode(str));

String getFcmTokeModelToJson(GetFcmTokeModel data) => json.encode(data.toJson());

class GetFcmTokeModel {
  GetFcmTokeModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  Data data;

  factory GetFcmTokeModel.fromJson(Map<String, dynamic> json) => GetFcmTokeModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.fcmToken,
  });

  String fcmToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    fcmToken: json["fcmToken"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "fcmToken": fcmToken,
  };
}