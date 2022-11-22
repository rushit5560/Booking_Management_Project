import 'dart:convert';

SubscribeUserInStripeModel subscribeUserInStripeModelFromJson(String str) => SubscribeUserInStripeModel.fromJson(json.decode(str));

String subscribeUserInStripeModelToJson(SubscribeUserInStripeModel data) => json.encode(data.toJson());

class SubscribeUserInStripeModel {
  SubscribeUserInStripeModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  Data data;

  factory SubscribeUserInStripeModel.fromJson(Map<String, dynamic> json) => SubscribeUserInStripeModel(
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
    required this.id,
    // this.userId,
    // this.applicationUser,
    // this.stripeSubscriptionId,
    // this.stripeCustomerId,
    // this.stripeProductId,
    // this.startDate,
    // this.expiryDate,
    // this.price,
    // this.isActive,
    // this.createdBy,
    // this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    // this.applicationUserCreator,
    // this.applicationUserModifier,
  });

  int id;
  // String userId;
  // dynamic applicationUser;
  // dynamic stripeSubscriptionId;
  // String stripeCustomerId;
  // String stripeProductId;
  // DateTime startDate;
  // DateTime expiryDate;
  // int price;
  // bool isActive;
  // String createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  // dynamic applicationUserCreator;
  // dynamic applicationUserModifier;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    // userId: json["userId"],
    // applicationUser: json["applicationUser"],
    // stripeSubscriptionId: json["stripeSubscriptionId"],
    // stripeCustomerId: json["stripeCustomerId"],
    // stripeProductId: json["stripeProductId"],
    // startDate: DateTime.parse(json["startDate"]),
    // expiryDate: DateTime.parse(json["expiryDate"]),
    // price: json["price"],
    // isActive: json["isActive"],
    // createdBy: json["createdBy"],
    // createdOn: DateTime.parse(json["createdOn"]),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    // applicationUserCreator: json["applicationUserCreator"],
    // applicationUserModifier: json["applicationUserModifier"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "userId": userId,
    // "applicationUser": applicationUser,
    // "stripeSubscriptionId": stripeSubscriptionId,
    // "stripeCustomerId": stripeCustomerId,
    // "stripeProductId": stripeProductId,
    // "startDate": startDate.toIso8601String(),
    // "expiryDate": expiryDate.toIso8601String(),
    // "price": price,
    // "isActive": isActive,
    // "createdBy": createdBy,
    // "createdOn": createdOn.toIso8601String(),
    // "modifiedBy": modifiedBy,
    // "modifiedOn": modifiedOn,
    // "applicationUserCreator": applicationUserCreator,
    // "applicationUserModifier": applicationUserModifier,
  };
}
