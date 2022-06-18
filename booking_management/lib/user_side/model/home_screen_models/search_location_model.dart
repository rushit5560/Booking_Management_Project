import 'dart:convert';

SearchLocationModel searchLocationModelFromJson(String str) => SearchLocationModel.fromJson(json.decode(str));

String searchLocationModelToJson(SearchLocationModel data) => json.encode(data.toJson());

class SearchLocationModel {
  SearchLocationModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<Datum> data;

  factory SearchLocationModel.fromJson(Map<String, dynamic> json) => SearchLocationModel(
    statusCode: json["statusCode"],
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.postcode,
    required this.suburb,
  });

  String postcode;
  String suburb;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    postcode: json["postcode"],
    suburb: json["suburb"],
  );

  Map<String, dynamic> toJson() => {
    "postcode": postcode,
    "suburb": suburb,
  };
}