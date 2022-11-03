import 'dart:convert';

GetUserTransModel getUserTransModelFromJson(String str) => GetUserTransModel.fromJson(json.decode(str));

String getUserTransModelToJson(GetUserTransModel data) => json.encode(data.toJson());

class GetUserTransModel {
  GetUserTransModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<WorkerListTrans> workerList;

  factory GetUserTransModel.fromJson(Map<String, dynamic> json) => GetUserTransModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<WorkerListTrans>.from((json["workerList"] ?? []).map((x) => WorkerListTrans.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class WorkerListTrans {
  WorkerListTrans({
    // this.id,
    required this.transactionFor,
    // this.transactionForId,
    required this.transactionDate,
    // this.transactionCode,
    // this.transactionStatus,
    // this.detail,
    // this.transactionBy,
    // this.applicationUsercustomer,
    // this.transactionByGuest,
    // this.guestUserCustomer,
    // this.isActive,
    // this.createdBy,
    // this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    // this.applicationUserCreator,
    // this.applicationUserModifier,
    // this.bookingId,
    // this.paymentIntentId,
    // this.customer,
    // this.vendor,
    required this.order,
    // this.bookingItems,
    // this.subscriptionUser,
    // this.startDate,
    // this.invoiceId,
    // this.notes,
    // this.email,
    // this.fullName,
    // this.mobile,
  });

  // int id;
  String transactionFor;
  // String transactionForId;
  String transactionDate;
  // dynamic transactionCode;
  // String transactionStatus;
  // String detail;
  // String transactionBy;
  // dynamic applicationUsercustomer;
  // dynamic transactionByGuest;
  // dynamic guestUserCustomer;
  // bool isActive;
  // String createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  // dynamic applicationUserCreator;
  // dynamic applicationUserModifier;
  // String bookingId;
  // dynamic paymentIntentId;
  // dynamic customer;
  // dynamic vendor;
  Order order;
  // dynamic bookingItems;
  // dynamic subscriptionUser;
  // dynamic startDate;
  // int invoiceId;
  // dynamic notes;
  // dynamic email;
  // dynamic fullName;
  // dynamic mobile;

  factory WorkerListTrans.fromJson(Map<String, dynamic> json) => WorkerListTrans(
    // id: json["id"],
    transactionFor: json["transactionFor"] ?? "",
    // transactionForId: json["transactionForId"],
    transactionDate: json["transactionDate"].toString(),
    // transactionCode: json["transactionCode"],
    // transactionStatus: json["transactionStatus"],
    // detail: json["detail"] == null ? null : json["detail"],
    // transactionBy: json["transactionBy"],
    // applicationUsercustomer: json["applicationUsercustomer"],
    // transactionByGuest: json["transactionByGuest"],
    // guestUserCustomer: json["guestUserCustomer"],
    // isActive: json["isActive"],
    // createdBy: json["createdBy"],
    // createdOn: DateTime.parse(json["createdOn"]),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    // applicationUserCreator: json["applicationUserCreator"],
    // applicationUserModifier: json["applicationUserModifier"],
    // bookingId: json["bookingId"],
    // paymentIntentId: json["paymentIntentId"],
    // customer: json["customer"],
    // vendor: json["vendor"],
    order: Order.fromJson(json["order"] ?? {}),
    // bookingItems: json["bookingItems"],
    // subscriptionUser: json["subscriptionUser"],
    // startDate: json["startDate"],
    // invoiceId: json["invoiceId"],
    // notes: json["notes"],
    // email: json["email"],
    // fullName: json["fullName"],
    // mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "transactionFor": transactionFor,
    // "transactionForId": transactionForId,
    "transactionDate": transactionDate,
    // "transactionCode": transactionCode,
    // "transactionStatus": transactionStatus,
    // "detail": detail == null ? null : detail,
    // "transactionBy": transactionBy,
    // "applicationUsercustomer": applicationUsercustomer,
    // "transactionByGuest": transactionByGuest,
    // "guestUserCustomer": guestUserCustomer,
    // "isActive": isActive,
    // "createdBy": createdBy,
    // "createdOn": createdOn.toIso8601String(),
    // "modifiedBy": modifiedBy,
    // "modifiedOn": modifiedOn,
    // "applicationUserCreator": applicationUserCreator,
    // "applicationUserModifier": applicationUserModifier,
    // "bookingId": bookingId,
    // "paymentIntentId": paymentIntentId,
    // "customer": customer,
    // "vendor": vendor,
    "order": order.toJson(),
    // "bookingItems": bookingItems,
    // "subscriptionUser": subscriptionUser,
    // "startDate": startDate,
    // "invoiceId": invoiceId,
    // "notes": notes,
    // "email": email,
    // "fullName": fullName,
    // "mobile": mobile,
  };
}

class Order {
  Order({
    // this.id,
    // this.bookingId,
    // this.orderDate,
    required this.price,
    // this.paidBy,
    // this.applicationUserCreator,
    // this.vendor,
    // this.booking,
    // this.quantity,
  });

  // int id;
  // String bookingId;
  // DateTime orderDate;
  String price;
  // String paidBy;
  // dynamic applicationUserCreator;
  // dynamic vendor;
  // dynamic booking;
  // int quantity;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    // id: json["id"],
    // bookingId: json["bookingId"],
    // orderDate: DateTime.parse(json["orderDate"]),
    price: json["price"].toString(),
    // paidBy: json["paidBy"],
    // applicationUserCreator: json["applicationUserCreator"],
    // vendor: json["vendor"],
    // booking: json["booking"],
    // quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    // "bookingId": bookingId,
    // "orderDate": orderDate.toIso8601String(),
    "price": price,
    // "paidBy": paidBy,
    // "applicationUserCreator": applicationUserCreator,
    // "vendor": vendor,
    // "booking": booking,
    // "quantity": quantity,
  };
}
