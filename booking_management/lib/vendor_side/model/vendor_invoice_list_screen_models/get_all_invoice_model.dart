import 'dart:convert';

GetAllInvoiceModel getAllOrdersModelFromJson(String str) => GetAllInvoiceModel.fromJson(json.decode(str));

String getAllOrdersModelToJson(GetAllInvoiceModel data) => json.encode(data.toJson());

class GetAllInvoiceModel {
  GetAllInvoiceModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<OrdersDatum> data;

  factory GetAllInvoiceModel.fromJson(Map<String, dynamic> json) => GetAllInvoiceModel(
    statusCode: json["statusCode"],
    success: json["success"],
    data: List<OrdersDatum>.from(json["data"].map((x) => OrdersDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class OrdersDatum {
  OrdersDatum({
    required this.id,
    required this.transactionFor,
    required this.transactionForId,
    required this.transactionDate,
    required this.transactionCode,
    required this.transactionStatus,
    required this.detail,
    required this.transactionBy,
    required this.applicationUsercustomer,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.bookingId,
    required this.paymentIntentId,
    required this.customer,
    required this.vendor,
    required this.order,
  });

  int id;
  String transactionFor;
  String transactionForId;
  String transactionDate;
  String transactionCode;
  String transactionStatus;
  String detail;
  String transactionBy;
  ApplicationUser applicationUsercustomer;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  String bookingId;
  String paymentIntentId;
  String customer;
  String vendor;
  Order order;

  factory OrdersDatum.fromJson(Map<String, dynamic> json) => OrdersDatum(
    id: json["id"] ?? 0,
    transactionFor: json["transactionFor"] ?? "",
    transactionForId: json["transactionForId"] ?? "",
    transactionDate: json["transactionDate"] ?? "",
    transactionCode: json["transactionCode"] ?? "",
    transactionStatus: json["transactionStatus"] ?? "",
    detail: json["detail"] ?? "",
    transactionBy: json["transactionBy"] ?? "",
    applicationUsercustomer: ApplicationUser.fromJson(json["applicationUsercustomer"] ?? {}),
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    bookingId: json["bookingId"] ?? "",
    paymentIntentId: json["paymentIntentId"] ?? "",
    customer: json["customer"] ?? "",
    vendor: json["vendor"] ?? "",
    order: Order.fromJson(json["order"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transactionFor": transactionFor,
    "transactionForId": transactionForId,
    "transactionDate": transactionDate,
    "transactionCode": transactionCode,
    "transactionStatus": transactionStatus,
    "detail": detail,
    "transactionBy": transactionBy,
    "applicationUsercustomer": applicationUsercustomer.toJson(),
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "bookingId": bookingId,
    "paymentIntentId": paymentIntentId,
    "customer": customer,
    "vendor": vendor,
    "order": order.toJson(),
  };
}

class ApplicationUser {
  ApplicationUser({
    required this.apiToken,
    required this.frogotToken,
    required this.id,
    required this.userName,
    required this.normalizedUserName,
    required this.email,
    required this.normalizedEmail,
    required this.emailConfirmed,
    required this.passwordHash,
    required this.securityStamp,
    required this.concurrencyStamp,
    required this.phoneNumber,
    required this.phoneNumberConfirmed,
    required this.twoFactorEnabled,
    required this.lockoutEnd,
    required this.lockoutEnabled,
    required this.accessFailedCount,
  });

  String apiToken;
  String frogotToken;
  String id;
  String userName;
  String normalizedUserName;
  String email;
  String normalizedEmail;
  bool emailConfirmed;
  String passwordHash;
  String securityStamp;
  String concurrencyStamp;
  String phoneNumber;
  bool phoneNumberConfirmed;
  bool twoFactorEnabled;
  String lockoutEnd;
  bool lockoutEnabled;
  int accessFailedCount;

  factory ApplicationUser.fromJson(Map<String, dynamic> json) => ApplicationUser(
    apiToken: json["apiToken"] ?? "",
    frogotToken: json["frogotToken"] ?? "",
    id: json["id"] ?? "",
    userName: json["userName"] ?? "",
    normalizedUserName: json["normalizedUserName"] ?? "",
    email: json["email"] ?? "",
    normalizedEmail: json["normalizedEmail"] ?? "",
    emailConfirmed: json["emailConfirmed"] ?? false,
    passwordHash: json["passwordHash"] ?? "",
    securityStamp: json["securityStamp"] ?? "",
    concurrencyStamp: json["concurrencyStamp"] ?? "",
    phoneNumber: json["phoneNumber"] ?? "",
    phoneNumberConfirmed: json["phoneNumberConfirmed"] ?? false,
    twoFactorEnabled: json["twoFactorEnabled"] ?? false,
    lockoutEnd: json["lockoutEnd"] ?? "",
    lockoutEnabled: json["lockoutEnabled"] ?? false,
    accessFailedCount: json["accessFailedCount"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "apiToken": apiToken,
    "frogotToken": frogotToken,
    "id": id,
    "userName": userName,
    "normalizedUserName": normalizedUserName,
    "email": email,
    "normalizedEmail": normalizedEmail,
    "emailConfirmed": emailConfirmed,
    "passwordHash": passwordHash,
    "securityStamp": securityStamp,
    "concurrencyStamp": concurrencyStamp,
    "phoneNumber": phoneNumber,
    "phoneNumberConfirmed": phoneNumberConfirmed,
    "twoFactorEnabled": twoFactorEnabled,
    "lockoutEnd": lockoutEnd,
    "lockoutEnabled": lockoutEnabled,
    "accessFailedCount": accessFailedCount,
  };
}

class Order {
  Order({
    required this.id,
    required this.bookingId,
    required this.orderDate,
    required this.price,
    required this.paidBy,
    //required this.applicationUserCreator,
    required this.vendor,
    required this.booking,
  });

  int id;
  String bookingId;
  String orderDate;
  double price;
  String paidBy;
  //ApplicationUser applicationUserCreator;
  String vendor;
  String booking;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"] ?? 0,
    bookingId: json["bookingId"] ?? "",
    orderDate: json["orderDate"] ?? "",
    price: json["price"] ?? 0.0,
    paidBy: json["paidBy"] ?? "",
    //applicationUserCreator: json["applicationUserCreator"] == null ? null : ApplicationUser.fromJson(json["applicationUserCreator"]),
    vendor: json["vendor"] ?? "",
    booking: json["booking"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookingId": bookingId,
    "orderDate": orderDate,
    "price": price,
    "paidBy": paidBy,
    //"applicationUserCreator": applicationUserCreator == null ? null : applicationUserCreator.toJson(),
    "vendor": vendor,
    "booking": booking,
  };
}
