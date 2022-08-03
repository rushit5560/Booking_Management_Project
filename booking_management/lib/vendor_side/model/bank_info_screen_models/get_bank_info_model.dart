import 'dart:convert';

GetBankInfoModel getBankInfoModelFromJson(String str) => GetBankInfoModel.fromJson(json.decode(str));

String getBankInfoModelToJson(GetBankInfoModel data) => json.encode(data.toJson());

class GetBankInfoModel {
  GetBankInfoModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.workerList,
  });

  int statusCode;
  bool success;
  String message;
  WorkerList workerList;

  factory GetBankInfoModel.fromJson(Map<String, dynamic> json) => GetBankInfoModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    workerList: WorkerList.fromJson(json["workerList"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "workerList": workerList.toJson(),
  };
}

class WorkerList {
  WorkerList({
    required this.financialInstitutionName,
    required this.accountName,
    required this.accountCode,
    required this.accountNumber,
  });

  String financialInstitutionName;
  String accountName;
  String accountCode;
  String accountNumber;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
    financialInstitutionName: json["financialInstitutionName"] ?? "",
    accountName: json["accountName"] ?? "",
    accountCode: json["accountCode"] ?? "",
    accountNumber: json["accountNumber"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "financialInstitutionName": financialInstitutionName,
    "accountName": accountName,
    "accountCode": accountCode,
    "accountNumber": accountNumber,
  };
}
