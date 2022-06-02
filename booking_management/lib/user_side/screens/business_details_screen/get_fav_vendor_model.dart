import 'dart:convert';

GetFavoriteVendorModel getFavoriteVendorModelFromJson(String str) => GetFavoriteVendorModel.fromJson(json.decode(str));

String getFavoriteVendorModelToJson(GetFavoriteVendorModel data) => json.encode(data.toJson());

class GetFavoriteVendorModel {
  GetFavoriteVendorModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  FavoriteData workerList;

  factory GetFavoriteVendorModel.fromJson(Map<String, dynamic> json) => GetFavoriteVendorModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: FavoriteData.fromJson(json["workerList"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": workerList.toJson(),
  };
}

class FavoriteData {
  FavoriteData({
    required this.isLike,
  });

  bool isLike;

  factory FavoriteData.fromJson(Map<String, dynamic> json) => FavoriteData(
    isLike: json["isLike"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "isLike": isLike,
  };
}