// To parse this JSON data, do
//
//     final confirmAppointmentListModel = confirmAppointmentListModelFromJson(jsonString);

import 'dart:convert';

ConfirmAppointmentListModel confirmAppointmentListModelFromJson(String str) => ConfirmAppointmentListModel.fromJson(json.decode(str));

String confirmAppointmentListModelToJson(ConfirmAppointmentListModel data) => json.encode(data.toJson());

class ConfirmAppointmentListModel {
  ConfirmAppointmentListModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<Confirm> data;

  factory ConfirmAppointmentListModel.fromJson(Map<String, dynamic> json) => ConfirmAppointmentListModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<Confirm>.from(json["data"].map((x) => Confirm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Confirm {
  Confirm({
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
  Categories categories;
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
  String vendorBooking;
  int vendorId;
  CustomerBooking customerBooking;
  int customerId;
  String status;
  String review;
  String avaTime;
  String bookingAvailability;

  factory Confirm.fromJson(Map<String, dynamic> json) => Confirm(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    categoryId: json["categoryId"] ?? 0,
    categories: Categories.fromJson(json["categories"]),
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
    vendorBooking: json["vendorBooking"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    customerBooking: CustomerBooking.fromJson(json["customerBooking"]),
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
    "categories": categories.toJson(),
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
    "vendorBooking": vendorBooking,
    "vendorId": vendorId,
    "customerBooking": customerBooking.toJson(),
    "customerId": customerId,
    "status": status,
    "review": review,
    "avaTime": avaTime,
    "bookingAvailability": bookingAvailability,
  };
}

class Categories {
  Categories({
    required this.id,
    required this.name,
    required this.description,
    required this.parentId,
    required this.image,
    required this.orderBy,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserCreator,
    required this.applicationUserModifier,
  });

  int id;
  String name;
  String description;
  int parentId;
  String image;
  int orderBy;
  bool isActive;
  String createdBy;
  DateTime createdOn;
  String modifiedBy;
  String modifiedOn;
  String applicationUserCreator;
  String applicationUserModifier;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    parentId: json["parentId"] ?? 0,
    image: json["image"] ?? "",
    orderBy: json["orderBy"] ?? 0,
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now()),
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    applicationUserCreator: json["applicationUserCreator"] ?? "",
    applicationUserModifier: json["applicationUserModifier"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "parentId": parentId,
    "image": image,
    "orderBy": orderBy,
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserCreator": applicationUserCreator,
    "applicationUserModifier": applicationUserModifier,
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
    required this.userName,
    // required this.about,
    // required this.lastVisit,
    // required this.firstName,
    // required this.lastName,
    // required this.faxNumber,
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
  //String state;
  //String city;
  String email;
  String phoneNo;
  //String image;
  String gender;
  String userName;
  // String about;
  // String lastVisit;
  // String firstName;
  // String lastName;
  // String faxNumber;
  String dateOfBirth;
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
    userName: json["userName"] ?? "",
    // about: json["about"] ?? "",
    // lastVisit: json["lastVisit"] ?? "",
    // firstName: json["firstName"] ?? "",
    // lastName: json["lastName"] ?? "",
    // faxNumber: json["faxNumber"] ?? "",
    dateOfBirth: json["dateOfBirth"] ?? "",
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
    "userName": userName,
    //"about": about,
    // "lastVisit": lastVisit,
    // "firstName": firstName,
    // "lastName": lastName,
    // "faxNumber": faxNumber,
    "dateOfBirth": dateOfBirth,
    "isActive": isActive,
    "userId": userId,
    "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserModifier": applicationUserModifier,
    "passwordHash": passwordHash,
  };
}
