import 'dart:convert';

InvoiceDetailsModel invoiceDetailsModelFromJson(String str) =>
    InvoiceDetailsModel.fromJson(json.decode(str));

String invoiceDetailsModelToJson(InvoiceDetailsModel data) =>
    json.encode(data.toJson());

class InvoiceDetailsModel {
  InvoiceDetailsModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
    required this.list,
  });

  int statusCode;
  bool success;
  InvoiceDetailsData workerList;
  List<String> list;

  factory InvoiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailsModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        workerList: InvoiceDetailsData.fromJson(json["workerList"] ?? {}),
        list: List<String>.from(json["list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "workerList": workerList.toJson(),
        "list": List<dynamic>.from(list.map((x) => x)),
      };
}

class InvoiceDetailsData {
  InvoiceDetailsData({
    this.id,
    this.transactionFor,
    this.transactionForId,
    this.transactionDate,
    this.transactionCode,
    this.transactionStatus,
    this.detail,
    this.transactionBy,
    // required this.applicationUsercustomer,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.firstName,
    this.email,
    this.phoneNo,
    this.startDateTime,
    // required this.applicationUserCreator,
    // required this.applicationUserModifier,
    this.bookingId,
    this.paymentIntentId,
    this.customer,
    this.vendor,
    this.order,
    this.bookingItems,
    // this.resourceList,
    // this.service,
  });

  int? id;
  String? transactionFor;
  String? transactionForId;
  String? transactionDate;
  String? transactionCode;
  String? transactionStatus;
  String? detail;
  String? transactionBy;
  // ApplicationUser applicationUsercustomer;
  bool? isActive;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  String? startDateTime;

  String? firstName;
  String? email;
  String? phoneNo;
  // ApplicationUser applicationUserCreator;
  // dynamic applicationUserModifier;
  String? bookingId;
  String? paymentIntentId;
  Customer? customer;
  Vendor? vendor;
  Order? order;
  BookingItems? bookingItems;
  // List<String>? resourceList;
  // String? service;

  factory InvoiceDetailsData.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailsData(
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
        firstName: json["firstName"] ?? "",
        email: json["email"] ?? "",
        phoneNo: json["phoneNo"] ?? "",
        startDateTime: json["startDateTime"] ?? "",
        // applicationUserCreator: ApplicationUser.fromJson(json["applicationUserCreator"]),
        // applicationUserModifier: json["applicationUserModifier"],
        bookingId: json["bookingId"] ?? "",
        paymentIntentId: json["paymentIntentId"] ?? "",
        customer: Customer.fromJson(json["customer"] ?? {}),
        vendor: Vendor.fromJson(json["vendor"] ?? {}),
        order: Order.fromJson(json["order"] ?? {}),
        bookingItems: BookingItems.fromJson(json["bookingItems"] ?? {}),
        // resourceList: List<String>.from(json["serviceName"].map((x) => x)).isEmpty
        // ? []
        // : List<String>.from(json["serviceName"].map((x) => x)),
        // service: json["service"] ?? "",
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
        "firstName": firstName,
        "email": email,
        "phoneNo": phoneNo,
        // "applicationUserCreator": applicationUserCreator.toJson(),
        // "applicationUserModifier": applicationUserModifier,
        "bookingId": bookingId,
        "paymentIntentId": paymentIntentId,
        "customer": customer!.toJson(),
        "vendor": vendor!.toJson(),
        "order": order!.toJson(),
        "bookingItems": bookingItems!.toJson(),
        // "serviceName": List<dynamic>.from(resourceList!.map((x) => x)),
        // "service": service,
      };
}

class BookingItems {
  BookingItems({
    required this.id,
    required this.bookingId,
    required this.price,
    required this.quantity,
    required this.booking,
  });

  int id;
  String bookingId;
  double price;
  int quantity;
  String booking;

  factory BookingItems.fromJson(Map<String, dynamic> json) => BookingItems(
        id: json["id"] ?? 0,
        bookingId: json["bookingId"] ?? "",
        price: double.parse((json["price"] ?? 0).toString()),
        quantity: json["quantity"] ?? 0,
        booking: json["booking"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingId": bookingId,
        "price": price,
        "quantity": quantity,
        "booking": booking,
      };
}

class Customer {
  Customer({
    required this.id,
    required this.email,
    required this.phoneNo,
    required this.gender,
    required this.userName,
    required this.dateOfBirth,
    required this.isActive,
    required this.userId,
    // required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    // required this.applicationUserModifier,
    required this.passwordHash,
    required this.notes,
    required this.bookingId,
    required this.isPriceDisplay,
  });

  int id;
  String email;
  String phoneNo;
  String gender;
  String userName;
  String dateOfBirth;
  bool isActive;
  String userId;
  // ApplicationUser applicationUser;
  String modifiedBy;
  String modifiedOn;
  // ApplicationUser applicationUserModifier;
  String passwordHash;
  String notes;
  String bookingId;
  bool isPriceDisplay;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"] ?? 0,
        email: json["email"] ?? "",
        phoneNo: json["phoneNo"] ?? "",
        gender: json["gender"] ?? "",
        userName: json["userName"] ?? "",
        dateOfBirth: json["dateOfBirth"] ?? "",
        isActive: json["isActive"] ?? false,
        userId: json["userId"] ?? "",
        // applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
        modifiedBy: json["modifiedBy"] ?? "",
        modifiedOn: json["modifiedOn"] ?? "",
        // applicationUserModifier: ApplicationUser.fromJson(json["applicationUserModifier"]),
        passwordHash: json["passwordHash"] ?? "",
        notes: json["notes"] ?? "",
        bookingId: json["bookingId"] ?? "",
        isPriceDisplay: json["isPriceDisplay"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phoneNo": phoneNo,
        "gender": gender,
        "userName": userName,
        "dateOfBirth": dateOfBirth,
        "isActive": isActive,
        "userId": userId,
        // "applicationUser": applicationUser.toJson(),
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        // "applicationUserModifier": applicationUserModifier.toJson(),
        "passwordHash": passwordHash,
        "notes": notes,
        "bookingId": bookingId,
        "isPriceDisplay": isPriceDisplay,
      };
}

class Order {
  Order({
    required this.id,
    required this.bookingId,
    required this.orderDate,
    required this.price,
    required this.paidBy,
    // this.applicationUserCreator,
  });

  int id;
  String bookingId;
  String orderDate;
  double price;
  String paidBy;
  // ApplicationUser applicationUserCreator;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] ?? 0,
        bookingId: json["bookingId"] ?? "",
        orderDate: json["orderDate"] ?? "",
        price: json["price"] ?? 0.0,
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

class Vendor {
  Vendor({
    required this.id,
    // this.categories,
    required this.categoryId,
    required this.businessName,
    required this.businessLogo,
    required this.street,
    required this.suburb,
    required this.postcode,
    required this.state,
    required this.country,
    required this.userName,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.isActive,
    required this.userId,
    required this.vendorPortal,
    required this.vendorVerification,
    required this.businessId,
    required this.isResource,
    required this.isPriceDisplay,
    required this.confirmation,
    required this.isServiceSlots,
    required this.latitude,
    required this.longitude,
    required this.vendorVerificationDate,
    // this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    // this.applicationUserModifier,
    required this.review,
    required this.rating,
    required this.vendorWorkingHours,
    required this.status,
    required this.category,
    required this.passwordHash,
    required this.workingHoursStatus,
    required this.avilableTime,
    required this.dDate,
    required this.duration,
    required this.startTime,
    required this.endTime,
    required this.vendorList,
    required this.additionalSlot,
    required this.resourceList,
    required this.resourceId,
  });

  int id;
  // dynamic categories;
  int categoryId;
  String businessName;
  String businessLogo;
  String street;
  String suburb;
  String postcode;
  String state;
  String country;
  String userName;
  String email;
  String phoneNo;
  String address;
  bool isActive;
  String userId;
  bool vendorPortal;
  bool vendorVerification;
  String businessId;
  bool isResource;
  bool isPriceDisplay;
  bool confirmation;
  bool isServiceSlots;
  String latitude;
  String longitude;
  String vendorVerificationDate;
  // dynamic applicationUser;
  String modifiedBy;
  String modifiedOn;
  // dynamic applicationUserModifier;
  String review;
  String rating;
  String vendorWorkingHours;
  String status;
  String category;
  String passwordHash;
  String workingHoursStatus;
  String avilableTime;
  String dDate;
  String duration;
  String startTime;
  String endTime;
  String vendorList;
  String additionalSlot;
  String resourceList;
  String resourceId;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"] ?? 0,
        // categories: json["categories"],
        categoryId: json["categoryId"] ?? 0,
        businessName: json["businessName"] ?? "",
        businessLogo: json["businessLogo"] ?? "",
        street: json["street"] ?? "",
        suburb: json["suburb"] ?? "",
        postcode: json["postcode"] ?? "",
        state: json["state"] ?? "",
        country: json["country"] ?? "",
        userName: json["userName"] ?? "",
        email: json["email"] ?? "",
        phoneNo: json["phoneNo"] ?? "",
        address: json["address"] ?? "",
        isActive: json["isActive"] ?? false,
        userId: json["userId"] ?? "",
        vendorPortal: json["vendorPortal"] ?? false,
        vendorVerification: json["vendorVerification"] ?? false,
        businessId: json["businessId"] ?? "",
        isResource: json["isResource"] ?? false,
        isPriceDisplay: json["isPriceDisplay"] ?? false,
        confirmation: json["confirmation"] ?? false,
        isServiceSlots: json["isServiceSlots"] ?? false,
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        vendorVerificationDate: json["vendorVerificationDate"] ?? "",
        // applicationUser: json["applicationUser"],
        modifiedBy: json["modifiedBy"] ?? "",
        modifiedOn: json["modifiedOn"] ?? "",
        // applicationUserModifier: json["applicationUserModifier"],
        review: json["review"] ?? "",
        rating: json["rating"] ?? "",
        vendorWorkingHours: json["vendorWorkingHours"] ?? "",
        status: json["status"] ?? "",
        category: json["category"] ?? "",
        passwordHash: json["passwordHash"] ?? "",
        workingHoursStatus: json["workingHoursStatus"] ?? "",
        avilableTime: json["avilableTime"] ?? "",
        dDate: json["dDate"] ?? "",
        duration: json["duration"] ?? "",
        startTime: json["startTime"] ?? "",
        endTime: json["endTime"] ?? "",
        vendorList: json["vendorList"] ?? "",
        additionalSlot: json["additionalSlot"] ?? "",
        resourceList: json["resourceList"] ?? "",
        resourceId: json["resourceId"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "categories": categories,
        "categoryId": categoryId,
        "businessName": businessName,
        "businessLogo": businessLogo,
        "street": street,
        "suburb": suburb,
        "postcode": postcode,
        "state": state,
        "country": country,
        "userName": userName,
        "email": email,
        "phoneNo": phoneNo,
        "address": address,
        "isActive": isActive,
        "userId": userId,
        "vendorPortal": vendorPortal,
        "vendorVerification": vendorVerification,
        "businessId": businessId,
        "isResource": isResource,
        "isPriceDisplay": isPriceDisplay,
        "confirmation": confirmation,
        "isServiceSlots": isServiceSlots,
        "latitude": latitude,
        "longitude": longitude,
        "vendorVerificationDate": vendorVerificationDate,
        // "applicationUser": applicationUser,
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        // "applicationUserModifier": applicationUserModifier,
        "review": review,
        "rating": rating,
        "vendorWorkingHours": vendorWorkingHours,
        "status": status,
        "category": category,
        "passwordHash": passwordHash,
        "workingHoursStatus": workingHoursStatus,
        "avilableTime": avilableTime,
        "dDate": dDate,
        "duration": duration,
        "startTime": startTime,
        "endTime": endTime,
        "vendorList": vendorList,
        "additionalSlot": additionalSlot,
        "resourceList": resourceList,
        "resourceId": resourceId,
      };
}
