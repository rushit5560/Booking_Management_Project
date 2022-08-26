/*
import 'dart:convert';

AppointmentListModel appointmentListModelFromJson(String str) =>
    AppointmentListModel.fromJson(json.decode(str));

String appointmentListModelToJson(AppointmentListModel data) =>
    json.encode(data.toJson());

class AppointmentListModel {
  AppointmentListModel(
      {required this.statusCode,
      required this.success,
      required this.data,
      required this.message});

  int statusCode;
  bool success;
  List<AppointmentListModule> data;
  String message;

  factory AppointmentListModel.fromJson(Map<String, dynamic> json) =>
      AppointmentListModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        data: List<AppointmentListModule>.from(json["data"].map((x) => AppointmentListModule.fromJson(x ?? {}))),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class AppointmentListModule {
  AppointmentListModule({
    required this.id,
    required this.bookingId,
    required this.vendorId,
    required this.vendor,
    // required this.customer,
    required this.customerId,
    required this.bookingFor,
    required this.bookingForId,
    required this.startDateTime,
    required this.endDateTime,
    required this.firstName,
    required this.email,
    required this.phoneNo,
    required this.notes,
    required this.status,
    required this.bookingItems,
    required this.serviceName,
    required this.price,
  });

  int id;
  String bookingId;
  int vendorId;
  Vendor vendor;
  // Customer customer;
  int customerId;
  String bookingFor;
  String bookingForId;
  String startDateTime;
  String endDateTime;
  String firstName;
  String email;
  String phoneNo;
  String notes;
  String status;
  BookingItems bookingItems;
  String serviceName;
  String price;

  factory AppointmentListModule.fromJson(Map<String, dynamic> json) =>
      AppointmentListModule(
        id: json["id"] ?? 0,
        bookingId: json["bookingId"],
        vendorId: json["vendorId"] ?? 0,
        vendor: Vendor.fromJson(json["vendor"] ?? {}),
        // customer: Customer.fromJson(json["customer"] ?? {}),
        customerId: json["customerId"] ?? 0,
        bookingFor: json["bookingFor"] ?? "",
        bookingForId: json["bookingForId"] ?? "",
        startDateTime: json["startDateTime"] ?? "",
        endDateTime: json["endDateTime"] ?? "",
        firstName: json["firstName"] ?? "",
        email: json["email"] ?? "",
        phoneNo: json["phoneNo"] ?? "",
        notes: json["notes"] ?? "",
        status: json["status"] ?? "",
        bookingItems: BookingItems.fromJson(json["bookingItems"] ?? {}),
        serviceName: json["serviceName"] ?? "",
        price: json["price"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingId": bookingId,
        "vendorId": vendorId,
        "vendor": vendor.toJson(),
        // "customer": customer.toJson(),
        "customerId": customerId,
        "bookingFor": bookingFor,
        "bookingForId": bookingForId,
        "startDateTime": startDateTime,
        "endDateTime": endDateTime,
        "firstName": firstName,
        "email": email,
        "phoneNo": phoneNo,
        "notes": notes,
        "status": status,
        "bookingItems": bookingItems.toJson(),
        "serviceName": serviceName,
      };
}

// class Customer {
//   Customer({
//     required this.id,
//     required this.email,
//     required this.phoneNo,
//     required this.gender,
//     required this.userName,
//     required this.dateOfBirth,
//     required this.isActive,
//     required this.userId,
//     // required this.applicationUser,
//     required this.modifiedBy,
//     required this.modifiedOn,
//     // required this.applicationUserModifier,
//     required this.passwordHash,
//     required this.notes,
//     required this.bookingId,
//     required this.isPriceDisplay,
//   });
//
//   int id;
//   String email;
//   String phoneNo;
//   String gender;
//   String userName;
//   String dateOfBirth;
//   bool isActive;
//   String userId;
//   // ApplicationUser applicationUser;
//   String modifiedBy;
//   String modifiedOn;
//   // ApplicationUser applicationUserModifier;
//   String passwordHash;
//   String notes;
//   String bookingId;
//   bool isPriceDisplay;
//
//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//         id: json["id"] ?? 0,
//         email: json["email"] ?? "",
//         phoneNo: json["phoneNo"] ?? "",
//         gender: json["gender"] ?? "",
//         userName: json["userName"] ?? "",
//         dateOfBirth: json["dateOfBirth"] ?? "",
//         isActive: json["isActive"] ?? false,
//         userId: json["userId"] ?? "",
//         // applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
//         modifiedBy: json["modifiedBy"] ?? "",
//         modifiedOn: json["modifiedOn"] ?? "",
//         // applicationUserModifier: ApplicationUser.fromJson(json["applicationUserModifier"]),
//         passwordHash: json["passwordHash"] ?? "",
//         notes: json["notes"] ?? "",
//         bookingId: json["bookingId"] ?? "",
//         isPriceDisplay: json["isPriceDisplay"] ?? false,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "phoneNo": phoneNo,
//         "gender": gender,
//         "userName": userName,
//         "dateOfBirth": dateOfBirth,
//         "isActive": isActive,
//         "userId": userId,
//         // "applicationUser": applicationUser == null ? null : applicationUser.toJson(),
//         "modifiedBy": modifiedBy,
//         "modifiedOn": modifiedOn,
//         // "applicationUserModifier": applicationUserModifier == null ? null : applicationUserModifier.toJson(),
//         "passwordHash": passwordHash,
//         "notes": notes,
//         "bookingId": bookingId,
//         "isPriceDisplay": isPriceDisplay,
//       };
// }

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

class BookingItems {
  BookingItems({
    required this.id,
    required this.bookingId,
    required this.price,
    required this.quantity,
    // this.booking,
    // this.review,
  });

  int id;
  String bookingId;
  double price;
  int quantity;
  // dynamic booking;
  // dynamic review;

  factory BookingItems.fromJson(Map<String, dynamic> json) => BookingItems(
        id: json["id"] ?? 0,
        bookingId: json["bookingId"] ?? "",
        price: json["price"].toDouble(),
        quantity: json["quantity"] ?? 0,
        // booking: json["booking"] ?? "",
        // review: json["review"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingId": bookingId,
        "price": price,
        "quantity": quantity,
        // "booking": booking,
        // "review": review,
      };
}
*/


import 'dart:convert';

AppointmentListModel appointmentListModelFromJson(String str) => AppointmentListModel.fromJson(json.decode(str));

String appointmentListModelToJson(AppointmentListModel data) => json.encode(data.toJson());

class AppointmentListModel {
  AppointmentListModel({
    required this.statusCode,
    required this.success,
    required this.data,
    required this.message
  });

  int statusCode;
  bool success;
  List<AppointmentListModule> data;
  String message;

  factory AppointmentListModel.fromJson(Map<String, dynamic> json) => AppointmentListModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<AppointmentListModule>.from(json["data"].map((x) => AppointmentListModule.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AppointmentListModule {
  AppointmentListModule({
    required this.id,
    required this.bookingId,
    required this.vendorId,
    required this.vendor,
    // required this.customer,
    // required this.customerId,
    required this.bookingFor,
    required this.bookingForId,
    required this.bookingForName,
    required this.startDateTime,
    required this.endDateTime,
    required this.firstName,
    required this.email,
    required this.phoneNo,
    // required this.notes,
    required this.status,
    required this.bookingItems,
    // required this.serviceName,
    // required this.service,
    required this.price,
    required this.startDate,
    required this.endDate,
    // required this.resourceName,
  });

  int id;
  String bookingId;
  int vendorId;
  Vendor vendor;
  // dynamic customer;
  // dynamic customerId;
  String bookingFor;
  String bookingForId;
  String bookingForName;
  String startDateTime;
  String endDateTime;
  String firstName;
  String email;
  String phoneNo;
  // dynamic notes;
  String status;
  BookingItems bookingItems;
  // dynamic serviceName;
  // dynamic service;
  String price;
  String startDate;
  String endDate;
  // dynamic resourceName;

  factory AppointmentListModule.fromJson(Map<String, dynamic> json) => AppointmentListModule(
    id: json["id"] ?? 0,
    bookingId: json["bookingId"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    vendor: Vendor.fromJson(json["vendor"] ?? {}),
    // customer: json["customer"],
    // customerId: json["customerId"],
    bookingFor: json["bookingFor"] ?? "",
    bookingForId: json["bookingForId"] ?? "",
    bookingForName: json["bookingForName"] ?? "",
    startDateTime: json["startDateTime"] ?? "",
    endDateTime: json["endDateTime"] ?? "",
    firstName: json["firstName"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    // notes: json["notes"],
    status: json["status"] ?? "",
    bookingItems: BookingItems.fromJson(json["bookingItems"] ?? {}),
    // serviceName: json["serviceName"],
    // service: json["service"],
    price: json["price"].toString(),
    startDate: json["startDate"] ?? "",
    endDate: json["endDate"] ?? "",
    // resourceName: json["resourceName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookingId": bookingId,
    "vendorId": vendorId,
    "vendor": vendor.toJson(),
    // "customer": customer,
    // "customerId": customerId,
    "bookingFor": bookingFor,
    "bookingForId": bookingForId,
    "bookingForName": bookingForName,
    "startDateTime": startDateTime,
    "endDateTime": endDateTime,
    "firstName": firstName,
    "email": email,
    "phoneNo": phoneNo,
    // "notes": notes,
    "status": status,
    "bookingItems": bookingItems.toJson(),
    // "serviceName": serviceName,
    // "service": service,
    // "price": price,
    "startDate": startDate,
    "endDate": endDate,
    // "resourceName": resourceName,
  };
}

class BookingItems {
  BookingItems({
    required this.id,
    required this.bookingId,
    required this.price,
    required this.quantity,
    // required this.booking,
    // required this.review,
  });

  int id;
  String bookingId;
  String price;
  int quantity;
  // dynamic booking;
  // dynamic review;

  factory BookingItems.fromJson(Map<String, dynamic> json) => BookingItems(
    id: json["id"] ?? 0,
    bookingId: json["bookingId"] ?? "",
    price: json["price"].toString(),
    quantity: json["quantity"] ?? 0,
    // booking: json["booking"],
    // review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookingId": bookingId,
    "price": price,
    "quantity": quantity,
    // "booking": booking,
    // "review": review,
  };
}

class Vendor {
  Vendor({
    required this.id,
    // required this.categories,
    required this.categoryId,
    required this.businessName,
    // required this.businessLogo,
    // required this.street,
    // required this.suburb,
    // required this.postcode,
    // required this.state,
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
    required this.firstPayment,
    required this.nextPayment,
    required this.vendorVerificationDate,
    // required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    // required this.applicationUserModifier,
    // required this.review,
    // required this.rating,
    // required this.vendorWorkingHours,
    // required this.status,
    // required this.category,
    // required this.passwordHash,
    // required this.workingHoursStatus,
    // required this.avilableTime,
    required this.dDate,
    // required this.duration,
    // required this.startTime,
    // required this.endTime,
    // required this.vendorList,
    // required this.additionalSlot,
    // required this.resourceList,
    // required this.resourceId,
    // required this.service,
    // required this.resource,
    required this.termsConditions,
    // required this.fullName,
    required this.stripeId,
    required this.vendorStripeAccountId,
    required this.financialInstitutionName,
    required this.accountName,
    required this.accountCode,
    required this.accountNumber,
    // required this.countryList,
  });

  int id;
  // dynamic categories;
  int categoryId;
  String businessName;
  // dynamic businessLogo;
  // dynamic street;
  // dynamic suburb;
  // dynamic postcode;
  // dynamic state;
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
  String firstPayment;
  String nextPayment;
  String vendorVerificationDate;
  // ApplicationUser applicationUser;
  String modifiedBy;
  String modifiedOn;
  // dynamic applicationUserModifier;
  // dynamic review;
  // dynamic rating;
  // dynamic vendorWorkingHours;
  // dynamic status;
  // dynamic category;
  // dynamic passwordHash;
  // dynamic workingHoursStatus;
  // dynamic avilableTime;
  String dDate;
  // dynamic duration;
  // dynamic startTime;
  // dynamic endTime;
  // dynamic vendorList;
  // dynamic additionalSlot;
  // dynamic resourceList;
  // dynamic resourceId;
  // dynamic service;
  // dynamic resource;
  bool termsConditions;
  // dynamic fullName;
  String stripeId;
  String vendorStripeAccountId;
  String financialInstitutionName;
  String accountName;
  String accountCode;
  String accountNumber;
  // dynamic countryList;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    // categories: json["categories"],
    categoryId: json["categoryId"],
    businessName: json["businessName"],
    // businessLogo: json["businessLogo"],
    // street: json["street"],
    // suburb: json["suburb"],
    // postcode: json["postcode"],
    // state: json["state"],
    country: json["country"],
    userName: json["userName"],
    email: json["email"],
    phoneNo: json["phoneNo"],
    address: json["address"],
    isActive: json["isActive"],
    userId: json["userId"],
    vendorPortal: json["vendorPortal"],
    vendorVerification: json["vendorVerification"],
    businessId: json["businessId"],
    isResource: json["isResource"],
    isPriceDisplay: json["isPriceDisplay"],
    confirmation: json["confirmation"],
    isServiceSlots: json["isServiceSlots"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    firstPayment: json["firstPayment"],
    nextPayment: json["nextPayment"],
    vendorVerificationDate: json["vendorVerificationDate"],
    // applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
    modifiedBy: json["modifiedBy"],
    modifiedOn: json["modifiedOn"],
    // applicationUserModifier: json["applicationUserModifier"],
    // review: json["review"],
    // rating: json["rating"],
    // vendorWorkingHours: json["vendorWorkingHours"],
    // status: json["status"],
    // category: json["category"],
    // passwordHash: json["passwordHash"],
    // workingHoursStatus: json["workingHoursStatus"],
    // avilableTime: json["avilableTime"],
    dDate: json["dDate"],
    // duration: json["duration"],
    // startTime: json["startTime"],
    // endTime: json["endTime"],
    // vendorList: json["vendorList"],
    // additionalSlot: json["additionalSlot"],
    // resourceList: json["resourceList"],
    // resourceId: json["resourceId"],
    // service: json["service"],
    // resource: json["resource"],
    termsConditions: json["termsConditions"],
    // fullName: json["fullName"],
    stripeId: json["stripeId"],
    vendorStripeAccountId: json["vendorStripeAccountId"],
    financialInstitutionName: json["financialInstitutionName"],
    accountName: json["accountName"],
    accountCode: json["accountCode"],
    accountNumber: json["accountNumber"],
    // countryList: json["countryList"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "categories": categories,
    "categoryId": categoryId,
    "businessName": businessName,
    // "businessLogo": businessLogo,
    // "street": street,
    // "suburb": suburb,
    // "postcode": postcode,
    // "state": state,
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
    "firstPayment": firstPayment,
    "nextPayment": nextPayment,
    "vendorVerificationDate": vendorVerificationDate,
    // "applicationUser": applicationUser.toJson(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    // "applicationUserModifier": applicationUserModifier,
    // "review": review,
    // "rating": rating,
    // "vendorWorkingHours": vendorWorkingHours,
    // "status": status,
    // "category": category,
    // "passwordHash": passwordHash,
    // "workingHoursStatus": workingHoursStatus,
    // "avilableTime": avilableTime,
    "dDate": dDate,
    // "duration": duration,
    // "startTime": startTime,
    // "endTime": endTime,
    // "vendorList": vendorList,
    // "additionalSlot": additionalSlot,
    // "resourceList": resourceList,
    // "resourceId": resourceId,
    // "service": service,
    // "resource": resource,
    "termsConditions": termsConditions,
    // "fullName": fullName,
    "stripeId": stripeId,
    "vendorStripeAccountId": vendorStripeAccountId,
    "financialInstitutionName": financialInstitutionName,
    "accountName": accountName,
    "accountCode": accountCode,
    "accountNumber": accountNumber,
    // "countryList": countryList,
  };
}
