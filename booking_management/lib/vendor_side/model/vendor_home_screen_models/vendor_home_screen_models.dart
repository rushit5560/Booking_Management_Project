// To parse this JSON data, do
//
//     final bookingDetailsModel = bookingDetailsModelFromJson(jsonString);

import 'dart:convert';

BookingDetailsModel bookingDetailsModelFromJson(String str) =>
    BookingDetailsModel.fromJson(json.decode(str));

String bookingDetailsModelToJson(BookingDetailsModel data) =>
    json.encode(data.toJson());

class BookingDetailsModel {
  BookingDetailsModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
    required this.list,
  });

  int statusCode;
  bool success;
  WorkerList workerList;
  List<String> list;

  factory BookingDetailsModel.fromJson(Map<String, dynamic> json) =>
      BookingDetailsModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        workerList: WorkerList.fromJson(json["workerList"] ?? {}),
        list: List<String>.from(json["list"].map((x) => x ?? "")),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "workerList": workerList.toJson(),
        "list": List<dynamic>.from(list.map((x) => x)),
      };
}

class WorkerList {
  WorkerList({
    required this.id,
    // required this.bookingServiceId,
    // required this.bookingServices,
    required this.resource,
    required this.resourceId,
    required this.startDateTime,
    required this.endDateTime,
    required this.isActive,
    required this.booking,
    required this.start,
    required this.end,
    required this.scheduleDate,
    required this.vendorId,
    required this.duration,
    required this.serviceId,
    required this.externalLogins,
    required this.returnUrl,
    required this.bookingData,
  });

  int id;
  // dynamic bookingServiceId;
  // dynamic bookingServices;
  Resource resource;
  int resourceId;
  String startDateTime;
  String endDateTime;
  bool isActive;
  bool booking;
  String start;
  String end;
  String scheduleDate;
  String vendorId;
  String duration;
  String serviceId;
  String externalLogins;
  String returnUrl;
  BookingData bookingData;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
        id: json["id"] ?? 0,
        // bookingServiceId: json["bookingServiceId"],
        // bookingServices: json["bookingServices"],
        resource: Resource.fromJson(json["resource"] ?? {}),
        resourceId: json["resourceId"] ?? 0,
        startDateTime: json["startDateTime"] ?? "",
        endDateTime: json["endDateTime"] ?? "",
        isActive: json["isActive"] ?? false,
        booking: json["booking"] ?? false,
        start: json["start"] ?? "",
        end: json["end"] ?? "",
        scheduleDate: json["scheduleDate"] ?? "",
        vendorId: json["vendorId"] ?? "",
        duration: json["duration"] ?? "",
        serviceId: json["serviceId"] ?? "",
        externalLogins: json["externalLogins"] ?? "",
        returnUrl: json["returnUrl"] ?? "",
        bookingData: BookingData.fromJson(json["bookingData"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "bookingServiceId": bookingServiceId,
        // "bookingServices": bookingServices,
        "resource": resource.toJson(),
        "resourceId": resourceId,
        "startDateTime": startDateTime,
        "endDateTime": endDateTime,
        "isActive": isActive,
        "booking": booking,
        "start": start,
        "end": end,
        "scheduleDate": scheduleDate,
        "vendorId": vendorId,
        "duration": duration,
        "serviceId": serviceId,
        "externalLogins": externalLogins,
        "returnUrl": returnUrl,
        "bookingData": bookingData.toJson(),
      };
}

class BookingData {
  BookingData({
    required this.id,
    required this.bookingId,
    required this.vendorId,
    required this.vendor,
    required this.customer,
    required this.customerId,
    required this.bookingFor,
    required this.bookingForId,
    required this.bookingForName,
    required this.startDateTime,
    required this.endDateTime,
    required this.firstName,
    required this.email,
    required this.phoneNo,
    required this.notes,
    required this.status,
    required this.bookingItems,
    required this.serviceName,
    required this.service,
    required this.price,
  });

  int id;
  String bookingId;
  int vendorId;
  Vendor vendor;
  Customer customer;
  int customerId;
  String bookingFor;
  String bookingForId;
  String bookingForName;
  String startDateTime;
  String endDateTime;
  String firstName;
  String email;
  String phoneNo;
  String notes;
  String status;
  BookingItems bookingItems;
  String serviceName;
  String service;
  double price;

  factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        id: json["id"] ?? 0,
        bookingId: json["bookingId"] ?? "",
        vendorId: json["vendorId"] ?? 0,
        vendor: Vendor.fromJson(json["vendor"] ?? {}),
        customer: Customer.fromJson(json["customer"] ?? {}),
        customerId: json["customerId"] ?? 0,
        bookingFor: json["bookingFor"] ?? "",
        bookingForId: json["bookingForId"] ?? "",
        bookingForName: json["bookingForName"] ?? "",
        startDateTime: json["startDateTime"] ?? "",
        endDateTime: json["endDateTime"] ?? "",
        firstName: json["firstName"] ?? "",
        email: json["email"] ?? "",
        phoneNo: json["phoneNo"] ?? "",
        notes: json["notes"] ?? "",
        status: json["status"] ?? "",
        bookingItems: BookingItems.fromJson(json["bookingItems"] ?? {}),
        serviceName: json["serviceName"] ?? "",
        service: json["service"] ?? "",
        price: (json["price"] ?? 0).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingId": bookingId,
        "vendorId": vendorId,
        "vendor": vendor.toJson(),
        "customer": customer.toJson(),
        "customerId": customerId,
        "bookingFor": bookingFor,
        "bookingForId": bookingForId,
        "bookingForName": bookingForName,
        "startDateTime": startDateTime,
        "endDateTime": endDateTime,
        "firstName": firstName,
        "email": email,
        "phoneNo": phoneNo,
        "notes": notes,
        "status": status,
        "bookingItems": bookingItems.toJson(),
        "serviceName": serviceName,
        "service": service,
        "price": price,
      };
}

class BookingItems {
  BookingItems({
    required this.id,
    required this.bookingId,
    required this.price,
    required this.quantity,
    required this.booking,
    required this.review,
  });

  int id;
  String bookingId;
  double price;
  int quantity;
  String booking;
  String review;

  factory BookingItems.fromJson(Map<String, dynamic> json) => BookingItems(
        id: json["id"] ?? 0,
        bookingId: json["bookingId"] ?? "",
        price: (json["price"] ?? 0).toDouble(),
        quantity: json["quantity"] ?? 0,
        booking: json["booking"] ?? "",
        review: json["review"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingId": bookingId,
        "price": price,
        "quantity": quantity,
        "booking": booking,
        "review": review,
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
    required this.resourceId,
    required this.bookingId,
    required this.isPriceDisplay,
    required this.duration,
  });

  int id;
  String email;
  String phoneNo;
  String gender;
  String userName;
  String dateOfBirth;
  bool isActive;
  String userId;
  // dynamic applicationUser;
  String modifiedBy;
  String modifiedOn;
  // dynamic applicationUserModifier;
  String passwordHash;
  String notes;
  String resourceId;
  String bookingId;
  bool isPriceDisplay;
  String duration;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"] ?? 0,
        email: json["email"] ?? "",
        phoneNo: json["phoneNo"] ?? "",
        gender: json["gender"] ?? "",
        userName: json["userName"] ?? "",
        dateOfBirth: json["dateOfBirth"] ?? "",
        isActive: json["isActive"] ?? false,
        userId: json["userId"] ?? "",
        // applicationUser: json["applicationUser"],
        modifiedBy: json["modifiedBy"] ?? "",
        modifiedOn: json["modifiedOn"] ?? "",
        // applicationUserModifier: json["applicationUserModifier"],
        passwordHash: json["passwordHash"] ?? "",
        notes: json["notes"] ?? "",
        resourceId: json["resourceId"] ?? "",
        bookingId: json["bookingId"] ?? "",
        isPriceDisplay: json["isPriceDisplay"] ?? false,
        duration: json["duration"] ?? "",
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
        // "applicationUser": applicationUser,
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        // "applicationUserModifier": applicationUserModifier,
        "passwordHash": passwordHash,
        "notes": notes,
        "resourceId": resourceId,
        "bookingId": bookingId,
        "isPriceDisplay": isPriceDisplay,
        "duration": duration,
      };
}

class Vendor {
  Vendor({
    required this.id,
    // required this.categories,
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
    // required this.vendorPortal,
    required this.vendorVerification,
    required this.businessId,
    required this.isResource,
    required this.isPriceDisplay,
    required this.confirmation,
    required this.isServiceSlots,
    required this.latitude,
    required this.longitude,
    required this.firstPayment,
    required this.nextPayment,
    required this.vendorVerificationDate,
    // required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    // required this.applicationUserModifier,
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
    required this.service,
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
  // String vendorPortal;
  bool vendorVerification;
  String businessId;
  bool isResource;
  bool isPriceDisplay;
  bool confirmation;
  bool isServiceSlots;
  String latitude;
  String longitude;
  String firstPayment;
  String nextPayment;
  String vendorVerificationDate;
  // ApplicationUser applicationUser;
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
  String service;

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
        // vendorPortal: json["vendorPortal"] ?? "",
        vendorVerification: json["vendorVerification"] ?? false,
        businessId: json["businessId"] ?? "",
        isResource: json["isResource"] ?? false,
        isPriceDisplay: json["isPriceDisplay"] ?? false,
        confirmation: json["confirmation"] ?? false,
        isServiceSlots: json["isServiceSlots"] ?? false,
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        firstPayment: json["firstPayment"] ?? "",
        nextPayment: json["nextPayment"] ?? "",
        vendorVerificationDate: json["vendorVerificationDate"] ?? "",
        // applicationUser: ApplicationUser.fromJson(json["applicationUser"] ?? {}),
        modifiedBy: json["modifiedBy"] ?? "",
        modifiedOn: json["modifiedOn"] ?? "",
        // applicationUserModifier: json["applicationUserModifier"] ?? "",
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
        service: json["service"] ?? "",
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
        // "vendorPortal": vendorPortal,
        "vendorVerification": vendorVerification,
        "businessId": businessId,
        "isResource": isResource,
        "isPriceDisplay": isPriceDisplay,
        "confirmation": confirmation,
        "isServiceSlots": isServiceSlots,
        "latitude": latitude,
        "longitude": longitude,
        "firstPayment": firstPayment,
        "nextPayment": nextPayment,
        "vendorVerificationDate": vendorVerificationDate,
        // "applicationUser": applicationUser.toJson(),
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
        "service": service,
      };
}

class Resource {
  Resource({
    required this.id,
    required this.resourceName,
    required this.details,
    required this.image,
    required this.isActive,
    // required this.applicationUserCreator,
    // required this.applicationUserModifier,
    required this.orderBy,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.vendorBooking,
    required this.vendorId,
    required this.price,
    required this.dDate,
    required this.duration,
    required this.avilableTime,
    required this.vendor,
    required this.bookingAvailability,
    required this.service,
  });

  int id;
  String resourceName;
  String details;
  String image;
  bool isActive;
  // ApplicationUser applicationUserCreator;
  // dynamic applicationUserModifier;
  String orderBy;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  Vendor vendorBooking;
  int vendorId;
  double price;
  String dDate;
  String duration;
  String avilableTime;
  String vendor;
  String bookingAvailability;
  String service;

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        id: json["id"] ?? 0,
        resourceName: json["resourceName"] ?? "",
        details: json["details"] ?? "",
        image: json["image"] ?? "",
        isActive: json["isActive"] ?? false,
        // applicationUserCreator: ApplicationUser.fromJson(json["applicationUserCreator"]),
        // applicationUserModifier: json["applicationUserModifier"],
        orderBy: json["orderBy"] ?? "",
        createdBy: json["createdBy"] ?? "",
        createdOn: json["createdOn"] ?? "",
        modifiedBy: json["modifiedBy"] ?? "",
        modifiedOn: json["modifiedOn"] ?? "",
        vendorBooking: Vendor.fromJson(json["vendorBooking"] ?? {}),
        vendorId: json["vendorId"] ?? 0,
        price: json["price"].toDouble(),
        dDate: json["dDate"] ?? "",
        duration: json["duration"] ?? "",
        avilableTime: json["avilableTime"] ?? "",
        vendor: json["vendor"] ?? "",
        bookingAvailability: json["bookingAvailability"] ?? "",
        service: json["service"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resourceName": resourceName,
        "details": details,
        "image": image,
        "isActive": isActive,
        // "applicationUserCreator": applicationUserCreator.toJson(),
        // "applicationUserModifier": applicationUserModifier,
        "orderBy": orderBy,
        "createdBy": createdBy,
        "createdOn": createdOn,
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        "vendorBooking": vendorBooking.toJson(),
        "vendorId": vendorId,
        "price": price,
        "dDate": dDate,
        "duration": duration,
        "avilableTime": avilableTime,
        "vendor": vendor,
        "bookingAvailability": bookingAvailability,
        "service": service,
      };
}
