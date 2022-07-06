
import 'dart:convert';

GetAllAppointmentListModel getAllAppointmentListModelFromJson(String str) => GetAllAppointmentListModel.fromJson(json.decode(str));

String getAllAppointmentListModelToJson(GetAllAppointmentListModel data) => json.encode(data.toJson());

class GetAllAppointmentListModel {
  GetAllAppointmentListModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<UpcomingAppointmentDatum> data;

  factory GetAllAppointmentListModel.fromJson(Map<String, dynamic> json) => GetAllAppointmentListModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<UpcomingAppointmentDatum>.from(json["data"].map((x) => UpcomingAppointmentDatum.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class UpcomingAppointmentDatum {
  UpcomingAppointmentDatum({
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
  String bookingItems;
  String serviceName;

  factory UpcomingAppointmentDatum.fromJson(Map<String, dynamic> json) => UpcomingAppointmentDatum(
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
    bookingItems: json["bookingItems"] ?? "",
    serviceName: json["serviceName"] ?? "",
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
    "bookingItems": bookingItems,
    "serviceName": serviceName,
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
  // dynamic applicationUser;
  String modifiedBy;
  String modifiedOn;
  // dynamic applicationUserModifier;
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
    // applicationUser: json["applicationUser"],
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    // applicationUserModifier: json["applicationUserModifier"],
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
    // "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    // "applicationUserModifier": applicationUserModifier,
    "passwordHash": passwordHash,
    "notes": notes,
    "bookingId": bookingId,
    "isPriceDisplay": isPriceDisplay,
  };
}

class Vendor {
  Vendor({
    required this.id,
    required this.categories,
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
    required this.modifiedBy,
    required this.modifiedOn,
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
    required this.resource,
  });

  int id;
  String categories;
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
  String modifiedBy;
  String modifiedOn;
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
  String resource;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"]?? 0,
    categories: json["categories"] ?? "",
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
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
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
    resource: json["resource"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": categories,
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
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
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
    "resource": resource,
  };
}

