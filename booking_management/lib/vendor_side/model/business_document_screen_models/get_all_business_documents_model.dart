import 'dart:convert';

GetAllBusinessDocumentsModel getAllBusinessDocumentsModelFromJson(String str) => GetAllBusinessDocumentsModel.fromJson(json.decode(str));

String getAllBusinessDocumentsModelToJson(GetAllBusinessDocumentsModel data) => json.encode(data.toJson());

class GetAllBusinessDocumentsModel {
  GetAllBusinessDocumentsModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<DocumentWorkerList> workerList;

  factory GetAllBusinessDocumentsModel.fromJson(Map<String, dynamic> json) => GetAllBusinessDocumentsModel(
    statusCode: json["statusCode"],
    success: json["success"],
    workerList: List<DocumentWorkerList>.from(json["workerList"].map((x) => DocumentWorkerList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class DocumentWorkerList {
  DocumentWorkerList({
    required this.id,
    required this.vendorId,
    // this.vendor,
    required this.documentType,
    required this.documentPath,
    required this.isActive,
    required this.isVerify,
    required this.verifyBy,
    required this.verifyOn,
    required this.isCancel,
    required this.cancelBy,
    required this.cancelOn,
    required this.notes,
  });

  int id;
  int vendorId;
  // dynamic vendor;
  String documentType;
  String documentPath;
  bool isActive;
  bool isVerify;
  String verifyBy;
  String verifyOn;
  bool isCancel;
  String cancelBy;
  String cancelOn;
  String notes;

  factory DocumentWorkerList.fromJson(Map<String, dynamic> json) => DocumentWorkerList(
    id: json["id"] ?? 0,
    vendorId: json["vendorId"] ?? 0,
    // vendor: json["vendor"],
    documentType: json["documentType"] ?? "",
    documentPath: json["documentPath"] ?? "",
    isActive: json["isActive"] ?? false,
    isVerify: json["isVerify"] ?? false,
    verifyBy: json["verifyBy"] ?? "",
    verifyOn: json["verifyOn"] ?? "",
    isCancel: json["isCancel"] ?? false,
    cancelBy: json["cancelBy"] ?? "",
    cancelOn: json["cancelOn"] ?? "",
    notes: json["notes"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendorId": vendorId,
    // "vendor": vendor,
    "documentType": documentType,
    "documentPath": documentPath,
    "isActive": isActive,
    "isVerify": isVerify,
    "verifyBy": verifyBy,
    "verifyOn": verifyOn,
    "isCancel": isCancel,
    "cancelBy": cancelBy,
    "cancelOn": cancelOn,
    "notes": notes,
  };
}
