import 'dart:convert';

ProfileImageModel profileImageModelFromJson(String str) => ProfileImageModel.fromJson(json.decode(str));

String profileImageModelToJson(ProfileImageModel data) => json.encode(data.toJson());

class ProfileImageModel {
  ProfileImageModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  Data data;

  factory ProfileImageModel.fromJson(Map<String, dynamic> json) => ProfileImageModel(
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
    required this.businessLogo,
  });

  String businessLogo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    businessLogo: json["businessLogo"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "businessLogo": businessLogo,
  };
}
