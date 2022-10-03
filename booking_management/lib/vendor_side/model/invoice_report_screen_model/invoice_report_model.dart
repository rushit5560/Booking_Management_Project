import 'dart:convert';

InvoiceReportModel invoiceReportModelFromJson(String str) =>
    InvoiceReportModel.fromJson(json.decode(str));

String invoiceReportModelToJson(InvoiceReportModel data) =>
    json.encode(data.toJson());

class InvoiceReportModel {
  InvoiceReportModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<InvoiceReportData> data;

  factory InvoiceReportModel.fromJson(Map<String, dynamic> json) =>
      InvoiceReportModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        data: List<InvoiceReportData>.from(
            json["data"].map((x) => InvoiceReportData.fromJson(x ?? {})) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class InvoiceReportData {
  InvoiceReportData({
    required this.id,
    required this.transactionFor,
    required this.transactionForId,
    required this.transactionDate,
    required this.transactionCode,
    required this.transactionStatus,
    required this.detail,
    required this.transactionBy,
    // required this.applicationUsercustomer,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserCreator,
    // required this.applicationUserModifier,
    required this.bookingId,
    required this.paymentIntentId,
    required this.customer,
    required this.vendor,
    required this.order,
    required this.bookingItems,
    required this.subscriptionUser,
  });

  int id;
  String transactionFor;
  String transactionForId;
  String transactionDate;
  String transactionCode;
  String transactionStatus;
  String detail;
  String transactionBy;
  // ApplicationUser applicationUsercustomer;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  ApplicationUserCreator applicationUserCreator;
  // String applicationUserModifier;
  String bookingId;
  String paymentIntentId;
  String customer;
  String vendor;
  Order order;
  String bookingItems;
  String subscriptionUser;

  factory InvoiceReportData.fromJson(Map<String, dynamic> json) =>
      InvoiceReportData(
        id: json["id"] ?? 0,
        transactionFor: json["transactionFor"] ?? "",
        transactionForId: json["transactionForId"] ?? "",
        transactionDate: json["transactionDate"] ?? "",
        transactionCode: json["transactionCode"] ?? "",
        transactionStatus: json["transactionStatus"] ?? "",
        detail: json["detail"] ?? "",
        transactionBy: json["transactionBy"] ?? "",
        // applicationUsercustomer: ApplicationUser.fromJson(json["applicationUsercustomer"]),
        isActive: json["isActive"] ?? false,
        createdBy: json["createdBy"] ?? "",
        createdOn: json["createdOn"] ?? "",
        modifiedBy: json["modifiedBy"] ?? "",
        modifiedOn: json["modifiedOn"] ?? "",
        applicationUserCreator: ApplicationUserCreator.fromJson(
            json["applicationUserCreator"] ?? {}),
        // applicationUserModifier: json["applicationUserModifier"] ?? "",
        bookingId: json["bookingId"] ?? "",
        paymentIntentId: json["paymentIntentId"] ?? "",
        customer: json["customer"] ?? "",
        vendor: json["vendor"] ?? "",
        order: Order.fromJson(json["order"] ?? {}),
        bookingItems: json["bookingItems"] ?? "",
        subscriptionUser: json["subscriptionUser"] ?? "",
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
        // "applicationUsercustomer": applicationUsercustomer.toJson(),
        "isActive": isActive,
        "createdBy": createdBy,
        "createdOn": createdOn,
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        "applicationUserCreator": applicationUserCreator,
        // "applicationUserModifier": applicationUserModifier,
        "bookingId": bookingId,
        "paymentIntentId": paymentIntentId,
        "customer": customer,
        "vendor": vendor,
        "order": order.toJson(),
        "bookingItems": bookingItems,
        "subscriptionUser": subscriptionUser,
      };
}

class ApplicationUser {
  ApplicationUser({
    required this.apiToken,
    required this.frogotToken,
    required this.fcmToken,
    required this.returnUrl,
    required this.externalLogins,
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
  String fcmToken;
  String returnUrl;
  String externalLogins;
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

  factory ApplicationUser.fromJson(Map<String, dynamic> json) =>
      ApplicationUser(
        apiToken: json["apiToken"] ?? "",
        frogotToken: json["frogotToken"] ?? "",
        fcmToken: json["fcmToken"] ?? "",
        returnUrl: json["returnUrl"] ?? "",
        externalLogins: json["externalLogins"] ?? "",
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
        "fcmToken": fcmToken,
        "returnUrl": returnUrl,
        "externalLogins": externalLogins,
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
    // required this.applicationUserCreator,
  });

  int id;
  String bookingId;
  String orderDate;
  String price;
  String paidBy;
  // ApplicationUser applicationUserCreator;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] ?? 0,
        bookingId: json["bookingId"] ?? "",
        orderDate: json["orderDate"] ?? "",
        price: json["price"] == "" ? "" : json["price"].toString(),
        paidBy: json["paidBy"] ?? "",
        // applicationUserCreator: ApplicationUser.fromJson(json["applicationUserCreator"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingId": bookingId,
        "orderDate": orderDate,
        "price": price,
        "paidBy": paidBy,
        // "applicationUserCreator": applicationUserCreator.toJson(),
      };
}

class ApplicationUserCreator {
  ApplicationUserCreator({
    // required this.apiToken,
    // required this.frogotToken,
    // required this.fcmToken,
    // required this.termsConditions,
    required this.fullName,
    // required this.returnUrl,
    // required this.externalLogins,
    // required this.id,
    // required this.userName,
    // required this.normalizedUserName,
    // required this.email,
    // required this.normalizedEmail,
    // required this.emailConfirmed,
    // required this.passwordHash,
    // required this.securityStamp,
    // required this.concurrencyStamp,
    // required this.phoneNumber,
    // required this.phoneNumberConfirmed,
    // required this.twoFactorEnabled,
    // required this.lockoutEnd,
    // required this.lockoutEnabled,
    // required this.accessFailedCount,
  });

  // String apiToken;
  // dynamic frogotToken;
  // String fcmToken;
  // bool termsConditions;
  String fullName;
  // dynamic returnUrl;
  // dynamic externalLogins;
  // String id;
  // String userName;
  // String normalizedUserName;
  // String email;
  // String normalizedEmail;
  // bool emailConfirmed;
  // String passwordHash;
  // String securityStamp;
  // String concurrencyStamp;
  // dynamic phoneNumber;
  // bool phoneNumberConfirmed;
  // bool twoFactorEnabled;
  // dynamic lockoutEnd;
  // bool lockoutEnabled;
  // int accessFailedCount;

  factory ApplicationUserCreator.fromJson(Map<String, dynamic> json) =>
      ApplicationUserCreator(
        // apiToken: json["apiToken"],
        // frogotToken: json["frogotToken"],
        // fcmToken: json["fcmToken"],
        // termsConditions: json["termsConditions"],
        fullName: json["fullName"] ?? "",
        // returnUrl: json["returnUrl"],
        // externalLogins: json["externalLogins"],
        // id: json["id"],
        // userName: json["userName"],
        // normalizedUserName: json["normalizedUserName"],
        // email: json["email"],
        // normalizedEmail: json["normalizedEmail"],
        // emailConfirmed: json["emailConfirmed"],
        // passwordHash: json["passwordHash"],
        // securityStamp: json["securityStamp"],
        // concurrencyStamp: json["concurrencyStamp"],
        // phoneNumber: json["phoneNumber"],
        // phoneNumberConfirmed: json["phoneNumberConfirmed"],
        // twoFactorEnabled: json["twoFactorEnabled"],
        // lockoutEnd: json["lockoutEnd"],
        // lockoutEnabled: json["lockoutEnabled"],
        // accessFailedCount: json["accessFailedCount"],
      );

  Map<String, dynamic> toJson() => {
        // "apiToken": apiToken,
        // "frogotToken": frogotToken,
        // "fcmToken": fcmToken,
        // "termsConditions": termsConditions,
        "fullName": fullName,
        // "returnUrl": returnUrl,
        // "externalLogins": externalLogins,
        // "id": id,
        // "userName": userName,
        // "normalizedUserName": normalizedUserName,
        // "email": email,
        // "normalizedEmail": normalizedEmail,
        // "emailConfirmed": emailConfirmed,
        // "passwordHash": passwordHash,
        // "securityStamp": securityStamp,
        // "concurrencyStamp": concurrencyStamp,
        // "phoneNumber": phoneNumber,
        // "phoneNumberConfirmed": phoneNumberConfirmed,
        // "twoFactorEnabled": twoFactorEnabled,
        // "lockoutEnd": lockoutEnd,
        // "lockoutEnabled": lockoutEnabled,
        // "accessFailedCount": accessFailedCount,
      };
}
