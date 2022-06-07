import 'dart:convert';

AppointmentReportModel appointmentReportModelFromJson(String str) => AppointmentReportModel.fromJson(json.decode(str));

String appointmentReportModelToJson(AppointmentReportModel data) => json.encode(data.toJson());

class AppointmentReportModel {
  AppointmentReportModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  List<AppointmentItem> workerList;

  factory AppointmentReportModel.fromJson(Map<String, dynamic> json) => AppointmentReportModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    workerList: List<AppointmentItem>.from(json["workerList"].map((x) => AppointmentItem.fromJson(x ?? {})) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "workerList": List<dynamic>.from(workerList.map((x) => x.toJson())),
  };
}

class AppointmentItem {
  AppointmentItem({
    required this.id,
    required this.bookingId,
    required this.vendorId,
    required this.vendor,
    required this.customer,
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
    required this.service,
  });

  int id;
  String bookingId;
  int vendorId;
  Vendor vendor;
  Customer customer;
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
  String service;

  factory AppointmentItem.fromJson(Map<String, dynamic> json) => AppointmentItem(
    id: json["id"] ?? 0,
    bookingId: json["bookingId"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    vendor: Vendor.fromJson(json["vendor"] ?? {}),
    customer: Customer.fromJson(json["customer"] ?? {}),
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
    service: json["service"] ?? "",
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
    price: double.parse(json["price"].toString()),
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
    // required this.id,
    // required this.categories,
    // required this.categoryId,
    required this.businessName,
    // required this.businessLogo,
    // required this.street,
    // required this.suburb,
    // required this.postcode,
    // required this.state,
    // required this.country,
    // required this.userName,
    // required this.email,
    // required this.phoneNo,
    // required this.address,
    // required this.isActive,
    // required this.userId,
    // required this.vendorPortal,
    // required this.vendorVerification,
    // required this.businessId,
    // required this.isResource,
    // required this.isPriceDisplay,
    // required this.confirmation,
    // required this.isServiceSlots,
    // required this.latitude,
    // required this.longitude,
    // required this.firstPayment,
    // required this.nextPayment,
    // required this.vendorVerificationDate,
    // required this.applicationUser,
    // required this.modifiedBy,
    // required this.modifiedOn,
    // required this.applicationUserModifier,
    // required this.review,
    // required this.rating,
    // required this.vendorWorkingHours,
    // required this.status,
    // required this.category,
    // required this.passwordHash,
    // required this.workingHoursStatus,
    // required this.avilableTime,
    // required this.dDate,
    // required this.duration,
    // required this.startTime,
    // required this.endTime,
    // required this.vendorList,
    // required this.additionalSlot,
    // required this.resourceList,
    // required this.resourceId,
  });

  // int id;
  // String categories;
  // int categoryId;
  String businessName;
  // String businessLogo;
  // String street;
  // String suburb;
  // String postcode;
  // String state;
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
  // String firstPayment;
  // String nextPayment;
  // String vendorVerificationDate;
  // String applicationUser;
  // String modifiedBy;
  // String modifiedOn;
  // String applicationUserModifier;
  // String review;
  // String rating;
  // String vendorWorkingHours;
  // String status;
  // String category;
  // String passwordHash;
  // String workingHoursStatus;
  // String avilableTime;
  // String dDate;
  // String duration;
  // String startTime;
  // String endTime;
  // String vendorList;
  // String additionalSlot;
  // String resourceList;
  // String resourceId;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    // id: json["id"],
    // categories: json["categories"],
    // categoryId: json["categoryId"],
    businessName: json["businessName"],
    // businessLogo: json["businessLogo"],
    // street: streetValues.map[json["street"]],
    // suburb: suburbValues.map[json["suburb"]],
    // postcode: json["postcode"],
    // state: stateValues.map[json["state"]],
    // country: countryValues.map[json["country"]],
    // userName: vendorUserNameValues.map[json["userName"]],
    // email: vendorEmailValues.map[json["email"]],
    // phoneNo: json["phoneNo"],
    // address: addressValues.map[json["address"]],
    // isActive: json["isActive"],
    // userId: json["userId"],
    // vendorPortal: json["vendorPortal"],
    // vendorVerification: json["vendorVerification"],
    // businessId: businessIdValues.map[json["businessId"]],
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
    // dDate: json["dDate"],
    // duration: json["duration"],
    // startTime: json["startTime"],
    // endTime: json["endTime"],
    // vendorList: json["vendorList"],
    // additionalSlot: json["additionalSlot"],
    // resourceList: json["resourceList"],
    // resourceId: json["resourceId"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    // "categories": categories,
    // "categoryId": categoryId,
    "businessName": businessName,
    // "businessLogo": businessLogo,
    // "street": streetValues.reverse[street],
    // "suburb": suburbValues.reverse[suburb],
    // "postcode": postcode,
    // "state": stateValues.reverse[state],
    // "country": countryValues.reverse[country],
    // "userName": vendorUserNameValues.reverse[userName],
    // "email": vendorEmailValues.reverse[email],
    // "phoneNo": phoneNo,
    // "address": addressValues.reverse[address],
    // "isActive": isActive,
    // "userId": userId,
    // "vendorPortal": vendorPortal,
    // "vendorVerification": vendorVerification,
    // "businessId": businessIdValues.reverse[businessId],
    // "isResource": isResource,
    // "isPriceDisplay": isPriceDisplay,
    // "confirmation": confirmation,
    // "isServiceSlots": isServiceSlots,
    // "latitude": latitude,
    // "longitude": longitude,
    // "firstPayment": firstPayment.toIso8601String(),
    // "nextPayment": nextPayment.toIso8601String(),
    // "vendorVerificationDate": vendorVerificationDate.toIso8601String(),
    // "applicationUser": applicationUser,
    // "modifiedBy": modifiedBy,
    // "modifiedOn": modifiedOn.toIso8601String(),
    // "applicationUserModifier": applicationUserModifier,
    // "review": review,
    // "rating": rating,
    // "vendorWorkingHours": vendorWorkingHours,
    // "status": status,
    // "category": category,
    // "passwordHash": passwordHash,
    // "workingHoursStatus": workingHoursStatus,
    // "avilableTime": avilableTime,
    // "dDate": dDate,
    // "duration": duration,
    // "startTime": startTime,
    // "endTime": endTime,
    // "vendorList": vendorList,
    // "additionalSlot": additionalSlot,
    // "resourceList": resourceList,
    // "resourceId": resourceId,
  };
}
