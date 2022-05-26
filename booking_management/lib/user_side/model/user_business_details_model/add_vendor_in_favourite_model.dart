// To parse this JSON data, do
//
//     final addVendorInFavouriteModel = addVendorInFavouriteModelFromJson(jsonString);

import 'dart:convert';

AddVendorInFavouriteModel addVendorInFavouriteModelFromJson(String str) => AddVendorInFavouriteModel.fromJson(json.decode(str));

String addVendorInFavouriteModelToJson(AddVendorInFavouriteModel data) => json.encode(data.toJson());

class AddVendorInFavouriteModel {
  AddVendorInFavouriteModel({
    required this.statusCode,
    required this.success,
    // this.workerList,
  });

  int statusCode;
  bool success;
  // WorkerList workerList;

  factory AddVendorInFavouriteModel.fromJson(Map<String, dynamic> json) => AddVendorInFavouriteModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    // workerList: WorkerList.fromJson(json["workerList"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    // "workerList": workerList.toJson(),
  };
}

// class WorkerList {
//   WorkerList({
//     this.id,
//     this.vendorId,
//     this.vendor,
//     this.customer,
//     this.customerId,
//     this.isLike,
//   });
//
//   int id;
//   int vendorId;
//   dynamic vendor;
//   Customer customer;
//   int customerId;
//   bool isLike;
//
//   factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
//     id: json["id"],
//     vendorId: json["vendorId"],
//     vendor: json["vendor"],
//     customer: Customer.fromJson(json["customer"]),
//     customerId: json["customerId"],
//     isLike: json["isLike"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "vendorId": vendorId,
//     "vendor": vendor,
//     "customer": customer.toJson(),
//     "customerId": customerId,
//     "isLike": isLike,
//   };
// }



