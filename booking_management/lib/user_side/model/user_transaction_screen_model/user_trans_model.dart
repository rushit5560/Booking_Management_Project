import 'dart:convert';

GetUserTransModel getUserTransModelFromJson(String str) => GetUserTransModel.fromJson(json.decode(str));

// String getUserTransModelToJson(GetUserTransModel data) => json.encode(data.toJson());

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
    // "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class WorkerListTrans {
  WorkerListTrans({
    // this.id,
    required this.transactionFor,
    // this.transactionForId,
    required this.transactionDate,
    required this.vendor,
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
    required this.bookingId,
    // this.paymentIntentId,
    // this.customer,
    // this.vendor,
    required this.order,
    required this.vendorBussiness,
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
  Vendor vendor;
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
  String bookingId;
  // dynamic paymentIntentId;
  // dynamic customer;
  // dynamic vendor;
  Order order;
  String vendorBussiness;
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
    vendor: Vendor.fromJson(json["vendor"] ?? {}),
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
    bookingId: json["bookingId"] ?? "",
    // paymentIntentId: json["paymentIntentId"],
    // customer: json["customer"],
    // vendor: json["vendor"],
    order: Order.fromJson(json["order"] ?? {}),
    vendorBussiness: json["vendorBussiness"] ?? "",
    // bookingItems: json["bookingItems"],
    // subscriptionUser: json["subscriptionUser"],
    // startDate: json["startDate"],
    // invoiceId: json["invoiceId"],
    // notes: json["notes"],
    // email: json["email"],
    // fullName: json["fullName"],
    // mobile: json["mobile"],
  );

  // Map<String, dynamic> toJson() => {
  //   // "id": id,
  //   "transactionFor": transactionFor,
  //   // "transactionForId": transactionForId,
  //   "transactionDate": transactionDate,
  //   // "transactionCode": transactionCode,
  //   // "transactionStatus": transactionStatus,
  //   // "detail": detail == null ? null : detail,
  //   // "transactionBy": transactionBy,
  //   // "applicationUsercustomer": applicationUsercustomer,
  //   // "transactionByGuest": transactionByGuest,
  //   // "guestUserCustomer": guestUserCustomer,
  //   // "isActive": isActive,
  //   // "createdBy": createdBy,
  //   // "createdOn": createdOn.toIso8601String(),
  //   // "modifiedBy": modifiedBy,
  //   // "modifiedOn": modifiedOn,
  //   // "applicationUserCreator": applicationUserCreator,
  //   // "applicationUserModifier": applicationUserModifier,
  //   "bookingId": bookingId,
  //   // "paymentIntentId": paymentIntentId,
  //   // "customer": customer,
  //   // "vendor": vendor,
  //   "order": order.toJson(),
  //   // "bookingItems": bookingItems,
  //   // "subscriptionUser": subscriptionUser,
  //   // "startDate": startDate,
  //   // "invoiceId": invoiceId,
  //   // "notes": notes,
  //   // "email": email,
  //   // "fullName": fullName,
  //   // "mobile": mobile,
  // };
}

class Order {
  Order({
    // this.id,
    // this.bookingId,
    required this.orderDate,
    required this.price,
    // this.paidBy,
    // this.applicationUserCreator,
    // this.vendor,
    // this.booking,
    // this.quantity,
  });

  // int id;
  // String bookingId;
  DateTime orderDate;
  String price;
  // String paidBy;
  // dynamic applicationUserCreator;
  // dynamic vendor;
  // dynamic booking;
  // int quantity;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    // id: json["id"],
    // bookingId: json["bookingId"],
    orderDate: DateTime.parse(json["orderDate"] ?? DateTime.now()),
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


class Vendor {
  Vendor({
    // this.id,
    // this.categories,
    // this.categoryId,
    required this.businessName,
    // this.businessLogo,
    // this.street,
    // this.suburb,
    // this.postcode,
    // this.state,
    // this.country,
    // this.userName,
    // this.email,
    // this.phoneNo,
    // this.address,
    // this.isActive,
    // this.userId,
    // this.vendorPortal,
    // this.vendorVerification,
    // this.businessId,
    // this.isResource,
    // this.isPriceDisplay,
    // this.confirmation,
    // this.isServiceSlots,
    // this.latitude,
    // this.longitude,
    // this.firstPayment,
    // this.nextPayment,
    // this.vendorVerificationDate,
    // this.applicationUser,
    // this.modifiedBy,
    // this.modifiedOn,
    // this.applicationUserModifier,
    // this.review,
    // this.rating,
    // this.vendorWorkingHours,
    // this.status,
    // this.category,
    // this.passwordHash,
    // this.workingHoursStatus,
    // this.avilableTime,
    // this.dDate,
    // this.duration,
    // this.startTime,
    // this.endTime,
    // this.vendorList,
    // this.additionalSlot,
    // this.resourceList,
    // this.resourceId,
    // this.service,
    // this.resource,
    // this.termsConditions,
    // this.fullName,
    // this.stripeId,
    // this.vendorStripeAccountId,
    // this.financialInstitutionName,
    // this.accountName,
    // this.accountCode,
    // this.accountNumber,
    // this.countryList,
    // this.userDateTime,
  });

  // int id;
  // dynamic categories;
  // int categoryId;
  String businessName;
  // String businessLogo;
  // dynamic street;
  // dynamic suburb;
  // dynamic postcode;
  // dynamic state;
  // String country;
  // String userName;
  // String email;
  // String phoneNo;
  // String address;
  // bool isActive;
  // String userId;
  // bool vendorPortal;
  // bool vendorVerification;
  // String businessId;
  // bool isResource;
  // bool isPriceDisplay;
  // bool confirmation;
  // bool isServiceSlots;
  // String latitude;
  // String longitude;
  // DateTime firstPayment;
  // DateTime nextPayment;
  // DateTime vendorVerificationDate;
  // dynamic applicationUser;
  // String modifiedBy;
  // DateTime modifiedOn;
  // dynamic applicationUserModifier;
  // dynamic review;
  // dynamic rating;
  // dynamic vendorWorkingHours;
  // dynamic status;
  // dynamic category;
  // dynamic passwordHash;
  // dynamic workingHoursStatus;
  // dynamic avilableTime;
  // DateTime dDate;
  // dynamic duration;
  // dynamic startTime;
  // dynamic endTime;
  // dynamic vendorList;
  // dynamic additionalSlot;
  // dynamic resourceList;
  // dynamic resourceId;
  // dynamic service;
  // dynamic resource;
  // bool termsConditions;
  // dynamic fullName;
  // String stripeId;
  // String vendorStripeAccountId;
  // String financialInstitutionName;
  // String accountName;
  // String accountCode;
  // String accountNumber;
  // dynamic countryList;
  // DateTime userDateTime;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    // id: json["id"],
    // categories: json["categories"],
    // categoryId: json["categoryId"],
    businessName: json["businessName"] ?? "",
    // businessLogo: json["businessLogo"],
    // street: json["street"],
    // suburb: json["suburb"],
    // postcode: json["postcode"],
    // state: json["state"],
    // country: json["country"],
    // userName: json["userName"],
    // email: json["email"],
    // phoneNo: json["phoneNo"],
    // address: json["address"],
    // isActive: json["isActive"],
    // userId: json["userId"],
    // vendorPortal: json["vendorPortal"],
    // vendorVerification: json["vendorVerification"],
    // businessId: json["businessId"],
    // isResource: json["isResource"],
    // isPriceDisplay: json["isPriceDisplay"],
    // confirmation: json["confirmation"],
    // isServiceSlots: json["isServiceSlots"],
    // latitude: json["latitude"],
    // longitude: json["longitude"],
    // firstPayment: DateTime.parse(json["firstPayment"]),
    // nextPayment: DateTime.parse(json["nextPayment"]),
    // vendorVerificationDate: DateTime.parse(json["vendorVerificationDate"]),
    // applicationUser: json["applicationUser"],
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: DateTime.parse(json["modifiedOn"]),
    // applicationUserModifier: json["applicationUserModifier"],
    // review: json["review"],
    // rating: json["rating"],
    // vendorWorkingHours: json["vendorWorkingHours"],
    // status: json["status"],
    // category: json["category"],
    // passwordHash: json["passwordHash"],
    // workingHoursStatus: json["workingHoursStatus"],
    // avilableTime: json["avilableTime"],
    // dDate: DateTime.parse(json["dDate"]),
    // duration: json["duration"],
    // startTime: json["startTime"],
    // endTime: json["endTime"],
    // vendorList: json["vendorList"],
    // additionalSlot: json["additionalSlot"],
    // resourceList: json["resourceList"],
    // resourceId: json["resourceId"],
    // service: json["service"],
    // resource: json["resource"],
    // termsConditions: json["termsConditions"],
    // fullName: json["fullName"],
    // stripeId: json["stripeId"],
    // vendorStripeAccountId: json["vendorStripeAccountId"],
    // financialInstitutionName: json["financialInstitutionName"],
    // accountName: json["accountName"],
    // accountCode: json["accountCode"],
    // accountNumber: json["accountNumber"],
    // countryList: json["countryList"],
    // userDateTime: DateTime.parse(json["userDateTime"]),
  );

}
