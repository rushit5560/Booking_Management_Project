import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<CountryData> workerList;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        workerList: List<CountryData>.from(
            json["workerList"].map((x) => CountryData.fromJson(x ?? {}))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
      };
}

class CountryData {
  CountryData({
    this.id,
    this.country,
    this.code,
  });

  int? id;
  String? country;
  String? code;

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        id: json["id"] ?? 0,
        country: json["country"] ?? "",
        code: json["code"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "code": code,
      };
}
