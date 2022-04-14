// To parse this JSON data, do
//
//     final userBookingHistoryModel = userBookingHistoryModelFromJson(jsonString);

import 'dart:convert';

UserBookingHistoryModel userBookingHistoryModelFromJson(String str) => UserBookingHistoryModel.fromJson(json.decode(str));

String userBookingHistoryModelToJson(UserBookingHistoryModel data) => json.encode(data.toJson());

class UserBookingHistoryModel {
  UserBookingHistoryModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<Datum> data;

  factory UserBookingHistoryModel.fromJson(Map<String, dynamic> json) => UserBookingHistoryModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.categories,
    required this.mobileNo,
    required this.description,
    required this.capacity,
    required this.volume,
    required this.isReceivedPayment,
    required this.price,
    required this.isMoreDetails,
    required this.timeDuration,
    required this.appointmentDate,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserCreator,
    required this.applicationUserModifier,
    required this.vendorBooking,
    required this.vendorId,
    required this.customerBooking,
    required this.customerId,
    required this.status,
    required this.review,
    required this.avaTime,
    required this.bookingAvailability,
  });

  int id;
  String name;
  int categoryId;
  String categories;
  String mobileNo;
  String description;
  String capacity;
  String volume;
  bool isReceivedPayment;
  double price;
  bool isMoreDetails;
  int timeDuration;
  DateTime appointmentDate;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  String applicationUserCreator;
  String applicationUserModifier;
  VendorBooking vendorBooking;
  int vendorId;
  CustomerBooking customerBooking;
  int customerId;
  String status;
  String review;
  String avaTime;
  String bookingAvailability;


  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    categoryId: json["categoryId"] ?? 0,
    categories: json["categories"] ?? "",//
    mobileNo: json["mobileNo"] ?? "",
    description: json["description"] ?? "",
    capacity: json["capacity"] ?? "",
    volume: json["volume"] ?? "",
    isReceivedPayment: json["isReceivedPayment"] ?? false,
    price: json["price"] ?? 0.0,
    isMoreDetails: json["isMoreDetails"] ?? false,
    timeDuration: json["timeDuration"] ?? 0,
    appointmentDate: DateTime.parse(json["appointmentDate"] ?? DateTime.now()),
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    applicationUserCreator: json["applicationUserCreator"] ?? "",
    applicationUserModifier: json["applicationUserModifier"] ?? "",
    vendorBooking: VendorBooking.fromJson(json["vendorBooking"] ?? {}),
    vendorId: json["vendorId"] ?? 0,
    customerBooking: CustomerBooking.fromJson(json["customerBooking"] ?? {}),
    customerId: json["customerId"] ?? 0,
    status: json["status"] ?? "",
    review: json["review"] ?? "",
    avaTime: json["avaTime"] ?? "",
    bookingAvailability: json["bookingAvailability"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "categoryId": categoryId,
    "categories": categories,
    "mobileNo": mobileNo,
    "description": description,
    "capacity": capacity,
    "volume": volume,
    "isReceivedPayment": isReceivedPayment,
    "price": price,
    "isMoreDetails": isMoreDetails,
    "timeDuration": timeDuration,
    "appointmentDate": appointmentDate.toIso8601String(),
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserCreator": applicationUserCreator,
    "applicationUserModifier": applicationUserModifier,
    "vendorBooking": vendorBooking.toJson(),
    "vendorId": vendorId,
    "customerBooking": customerBooking.toJson(),
    "customerId": customerId,
    "status": status,
    "review": review,
    "avaTime": avaTime,
    "bookingAvailability": bookingAvailability,
  };
}

class CustomerBooking {
  CustomerBooking({
    required this.id,
    //required this.state,
    //required this.city,
    required this.email,
    required this.phoneNo,
    //required this.image,
    required this.gender,
    //required this.about,
    //required this.lastVisit,
    required this.userName,
    //required this.lastName,
    //required this.faxNumber,
    required this.dateOfBirth,
    required this.isActive,
    required this.userId,
    required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserModifier,
    required this.passwordHash,
  });

  int id;
  // String state;
  // String city;
  String email;
  String phoneNo;
  //String image;
  String gender;
  // String about;
  // String lastVisit;
  String userName;
  //String lastName;
  //String faxNumber;
  DateTime dateOfBirth;
  bool isActive;
  String userId;
  String applicationUser;
  String modifiedBy;
  String modifiedOn;
  String applicationUserModifier;
  String passwordHash;

  factory CustomerBooking.fromJson(Map<String, dynamic> json) => CustomerBooking(
    id: json["id"] ?? 0,
    // state: json["state"] ?? "",
    // city: json["city"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    //image: json["image"] ?? "",
    gender: json["gender"] ?? "",
    // about: json["about"] ?? "",
    // lastVisit: json["lastVisit"] ?? "",
    userName: json["userName"] ?? "",
    //lastName: json["lastName"] ?? "",
    //faxNumber: json["faxNumber"] ?? "",
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    isActive: json["isActive"] ?? false,
    userId: json["userId"] ?? "",
    applicationUser: json["applicationUser"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    applicationUserModifier: json["applicationUserModifier"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "state": state,
    // "city": city,
    "email": email,
    "phoneNo": phoneNo,
    //"image": image,
    "gender": gender,
    // "about": about,
    // "lastVisit": lastVisit,
    "userName": userName,
    //"lastName": lastName,
    //"faxNumber": faxNumber,
    "dateOfBirth": dateOfBirth.toIso8601String(),
    "isActive": isActive,
    "userId": userId,
    "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserModifier": applicationUserModifier,
    "passwordHash": passwordHash,
  };
}

class VendorBooking {
  VendorBooking({
    required this.id,
    required this.categories,
    required this.categoryId,
    //required this.workingHours,
    required this.businessName,
    required this.businessLogo,
    required this.street,
    required this.suburb,
    required this.postcode,
    required this.state,
    required this.country,
    required this.userName,
    //required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.address,
    //required this.address2,
    required this.isActive,
    required this.userId,
    required this.vendorPortal,
    required this.vendorVerification,
    required this.attachPhotoIndentification,
    required this.attachProofofAddress,
    required this.businessId,
    required this.resource,
    required this.payment,
    required this.confirmation,
    required this.vendorVerificationDate,
    required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserModifier,
    required this.review,
    required this.rating,
    required this.vendorWorkingHours,
    required this.status,
    required this.category,
    required this.passwordHash,
    //required this.businessId,
    required this.workingHoursStatus,
    required this.avilableTime,
  });

  int id;
  String categories;
  int categoryId;
  //String workingHours;
  String businessName;
  String businessLogo;
  String street;
  String suburb;
  String postcode;
  String state;
  String country;
  String userName;
  //String lastName;
  String email;
  String phoneNo;
  String address;
  //String address2;
  bool isActive;
  String userId;
  bool vendorPortal;
  bool vendorVerification;
  String attachPhotoIndentification;
  String attachProofofAddress;
  String businessId;
  bool resource;
  bool payment;
  bool confirmation;
  DateTime vendorVerificationDate;
  String applicationUser;
  String modifiedBy;
  DateTime modifiedOn;
  String applicationUserModifier;
  String review;
  String rating;
  String vendorWorkingHours;
  String status;
  String category;
  String passwordHash;
  //String businessId;
  String workingHoursStatus;
  String avilableTime;

  factory VendorBooking.fromJson(Map<String, dynamic> json) => VendorBooking(
    id: json["id"] ?? 0,
    categories: json["categories"] ?? "",
    categoryId: json["categoryId"] ?? 0,
    //workingHours: json["workingHours"] ?? "",
    businessName: json["businessName"] ?? "",
    businessLogo: json["businessLogo"] ?? "",
    street: json["street"] ?? "",
    suburb: json["suburb"] ?? "",
    postcode: json["postcode"] ?? "",
    state: json["state"] ?? "",
    country: json["country"] ?? "",
    userName: json["userName"] ?? "",
    //lastName: json["lastName"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    address: json["address"] ?? "",
    //address2: json["address2"] ?? "",
    isActive: json["isActive"] ?? false,
    userId: json["userId"] ?? "",
    vendorPortal: json["vendorPortal"] ?? false,
    vendorVerification: json["vendorVerification"] ?? false,
    attachPhotoIndentification: json["attachPhotoIndentification"] ?? "",
    attachProofofAddress: json["attachProofofAddress"] ?? "",
    businessId: json["businessId"] ?? "",
    resource: json["resource"] ?? false,
    payment: json["payment"] ?? false,
    confirmation: json["confirmation"] ?? false,
    vendorVerificationDate: DateTime.parse(json["vendorVerificationDate"] ?? DateTime.now()),
    applicationUser: json["applicationUser"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: DateTime.parse(json["modifiedOn"] ?? DateTime.now()),
    applicationUserModifier: json["applicationUserModifier"] ?? "",
    review: json["review"] ?? "",
    rating: json["rating"] ?? "",
    vendorWorkingHours: json["vendorWorkingHours"] ?? "",
    status: json["status"] ?? "",
    category: json["category"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
    //businessId: json["businessId"] ?? "",
    workingHoursStatus: json["workingHoursStatus"] ?? "",
    avilableTime: json["avilableTime"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": categories,
    "categoryId": categoryId,
    //"workingHours": workingHours,
    "businessName": businessName,
    "businessLogo": businessLogo,
    "street": street,
    "suburb": suburb,
    "postcode": postcode,
    "state": state,
    "country": country,
    "userName": userName,
    //"lastName": lastName,
    "email": email,
    "phoneNo": phoneNo,
    "address": address,
    //"address2": address2,
    "isActive": isActive,
    "userId": userId,
    "vendorPortal": vendorPortal,
    "vendorVerification": vendorVerification,
    "attachPhotoIndentification": attachPhotoIndentification,
    "attachProofofAddress": attachProofofAddress,
    "businessId": businessId,
    "resource": resource,
    "payment": payment,
    "confirmation": confirmation,
    "vendorVerificationDate": vendorVerificationDate.toIso8601String(),
    "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn.toIso8601String(),
    "applicationUserModifier": applicationUserModifier,
    "review": review,
    "rating": rating,
    "vendorWorkingHours": vendorWorkingHours,
    "status": status,
    "category": category,
    "passwordHash": passwordHash,
    "workingHoursStatus": workingHoursStatus,
    "avilableTime": avilableTime,
  };
}
