// To parse this JSON data, do
//
//     final userBusinessDetailsModel = userBusinessDetailsModelFromJson(jsonString);

/*import 'dart:convert';

UserBusinessDetailsModel userBusinessDetailsModelFromJson(String str) => UserBusinessDetailsModel.fromJson(json.decode(str));

String userBusinessDetailsModelToJson(UserBusinessDetailsModel data) => json.encode(data.toJson());

class UserBusinessDetailsModel {
  UserBusinessDetailsModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  Data data;

  factory UserBusinessDetailsModel.fromJson(Map<String, dynamic> json) => UserBusinessDetailsModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
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
  Vendor vendorBooking;
  int vendorId;
  String customerBooking;
  int customerId;
  String status;
  Review review;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    categoryId: json["categoryId"] ?? 0,
    categories: json["categories"] ?? "",
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
    vendorBooking: Vendor.fromJson(json["vendorBooking"]),
    vendorId: json["vendorId"] ?? 0,
    customerBooking: json["customerBooking"] ?? "",
    customerId: json["customerId"] ?? 0,
    status: json["status"] ?? "",
    review: Review.fromJson(json["review"]),
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
    "customerBooking": customerBooking,
    "customerId": customerId,
    "status": status,
    "review": review.toJson(),
  };
}

class Review {
  Review({
    required this.id,
    required this.vendor,
    required this.vendorId,
    required this.customer,
    required this.customerId,
    required this.description,
    required this.ratting,
    required this.date,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserCreator,
    required this.applicationUserModifier,
  });

  int id;
  Vendor vendor;
  int vendorId;
  String customer;
  int customerId;
  String description;
  int ratting;
  DateTime date;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  String applicationUserCreator;
  String applicationUserModifier;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"] ?? 0,
    vendor: Vendor.fromJson(json["vendor"]),
    vendorId: json["vendorId"] ?? 0,
    customer: json["customer"] ?? "",
    customerId: json["customerId"] ?? 0,
    description: json["description"] ?? "",
    ratting: json["ratting"] ?? 0,
    date: DateTime.parse(json["date"]),
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ??"",
    applicationUserCreator: json["applicationUserCreator"] ?? "",
    applicationUserModifier: json["applicationUserModifier"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor": vendor.toJson(),
    "vendorId": vendorId,
    "customer": customer,
    "customerId": customerId,
    "description": description,
    "ratting": ratting,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserCreator": applicationUserCreator,
    "applicationUserModifier": applicationUserModifier,
  };
}

class Vendor {
  Vendor({
    required this.id,
    required this.categories,
    required this.categoryId,
   // required this.workingHours,
    required this.businessName,
    required this.businessLogo,
    required this.street,
    required this.suburb,
    required this.postcode,
    required this.state,
    required this.country,
    required this.firstName,
    required this.lastName,
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
    required this.resource,
    required this.payment,
    required this.confirmation,
    required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserModifier,
    required this.review,
    required this.vendorWorkingHours,
    required this.status,
    required this.category,
    required this.passwordHash,
    required this.businessId,
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
  String firstName;
  String lastName;
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
  String applicationUser;
  String modifiedBy;
  DateTime modifiedOn;
  String applicationUserModifier;
  String review;
  String vendorWorkingHours;
  String status;
  String category;
  String passwordHash;
  bool workingHoursStatus;
  String avilableTime;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
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
    firstName: json["firstName"] ?? "",
    lastName: json["lastName"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    address: json["address1"] ?? "",
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
    applicationUser: json["applicationUser"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: DateTime.parse(json["modifiedOn"] ?? DateTime.now()),
    applicationUserModifier: json["applicationUserModifier"] ?? "",
    review: json["review"] ?? "",
    vendorWorkingHours: json["vendorWorkingHours"] ?? "",
    status: json["status"] ?? "",
    category: json["category"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
    workingHoursStatus: json["workingHoursStatus"] ?? false,
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
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNo": phoneNo,
    "address1": address,
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
    "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn.toIso8601String(),
    "applicationUserModifier": applicationUserModifier,
    "review": review,
    "vendorWorkingHours": vendorWorkingHours,
    "status": status,
    "category": category,
    "passwordHash": passwordHash,
    "workingHoursStatus": workingHoursStatus,
    "avilableTime": avilableTime,
  };
}*/

// To parse this JSON data, do
//
//     final userBusinessDetailsModel = userBusinessDetailsModelFromJson(jsonString);

import 'dart:convert';

UserBusinessDetailsModel userBusinessDetailsModelFromJson(String str) => UserBusinessDetailsModel.fromJson(json.decode(str));

String userBusinessDetailsModelToJson(UserBusinessDetailsModel data) => json.encode(data.toJson());

class UserBusinessDetailsModel {
  UserBusinessDetailsModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  Data data;

  factory UserBusinessDetailsModel.fromJson(Map<String, dynamic> json) => UserBusinessDetailsModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
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
  Vendor vendorBooking;
  int vendorId;
  String customerBooking;
  int customerId;
  String status;
  Review review;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    categoryId: json["categoryId"] ?? 0,
    categories: json["categories"] ?? "",
    mobileNo: json["mobileNo"] ?? "",
    description: json["description"] ?? "",
    capacity: json["capacity"] ?? "",
    volume: json["volume"]?? "",
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
    vendorBooking: Vendor.fromJson(json["vendorBooking"]),
    vendorId: json["vendorId"] ?? 0,
    customerBooking: json["customerBooking"] ?? "",
    customerId: json["customerId"] ?? 0,
    status: json["status"] ?? "",
    review: Review.fromJson(json["review"]),
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
    "customerBooking": customerBooking,
    "customerId": customerId,
    "status": status,
    "review": review.toJson(),
  };
}

class Review {
  Review({
    required this.id,
    required this.vendor,
    required this.vendorId,
    required this.customer,
    required this.customerId,
    required this.description,
    required this.ratting,
    required this.date,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserCreator,
    required this.applicationUserModifier,
  });

  int id;
  Vendor vendor;
  int vendorId;
  String customer;
  int customerId;
  String description;
  int ratting;
  DateTime date;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  String applicationUserCreator;
  String applicationUserModifier;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"] ?? 0,
    vendor: Vendor.fromJson(json["vendor"]),
    vendorId: json["vendorId"] ?? 0,
    customer: json["customer"] ?? "",
    customerId: json["customerId"] ?? 0,
    description: json["description"] ?? "",
    ratting: json["ratting"] ?? 0,
    date: DateTime.parse(json["date"] ?? DateTime.now()),
    isActive: json["isActive"] ?? false,
    createdBy: json["createdBy"] ?? "",
    createdOn: json["createdOn"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: json["modifiedOn"] ?? "",
    applicationUserCreator: json["applicationUserCreator"] ?? "",
    applicationUserModifier: json["applicationUserModifier"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor": vendor.toJson(),
    "vendorId": vendorId,
    "customer": customer,
    "customerId": customerId,
    "description": description,
    "ratting": ratting,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "isActive": isActive,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "applicationUserCreator": applicationUserCreator,
    "applicationUserModifier": applicationUserModifier,
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
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.address,
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
    required this.applicationUser,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.applicationUserModifier,
    required this.review,
    required this.vendorWorkingHours,
    required this.status,
    required this.category,
    required this.passwordHash,
    required this.workingHoursStatus,
    required this.avilableTime,
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
  String firstName;
  String lastName;
  String email;
  String phoneNo;
  String address;
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
  String applicationUser;
  String modifiedBy;
  DateTime modifiedOn;
  String applicationUserModifier;
  String review;
  String vendorWorkingHours;
  String status;
  String category;
  String passwordHash;
  String workingHoursStatus;
  String avilableTime;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"] ?? 0,
    categories: json["categories"] ?? "",
    categoryId: json["categoryId"] ?? 0,
    businessName: json["businessName"] ??"",
    businessLogo: json["businessLogo"] ?? "",
    street: json["street"] ?? "",
    suburb: json["suburb"] ?? "",
    postcode: json["postcode"] ?? "",
    state: json["state"] ?? "",
    country: json["country"] ??"",
    firstName: json["firstName"] ?? "",
    lastName: json["lastName"] ?? "",
    email: json["email"] ?? "",
    phoneNo: json["phoneNo"] ?? "",
    address: json["address"] ?? "",
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
    applicationUser: json["applicationUser"] ?? "",
    modifiedBy: json["modifiedBy"] ?? "",
    modifiedOn: DateTime.parse(json["modifiedOn"] ?? DateTime.now()),
    applicationUserModifier: json["applicationUserModifier"] ?? "",
    review: json["review"] ?? "",
    vendorWorkingHours: json["vendorWorkingHours"] ?? "",
    status: json["status"] ?? "",
    category: json["category"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
    workingHoursStatus: json["workingHoursStatus"] ?? "",
    avilableTime: json["avilableTime"] ?? "",
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
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNo": phoneNo,
    "address": address,
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
    "applicationUser": applicationUser,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn.toIso8601String(),
    "applicationUserModifier": applicationUserModifier,
    "review": review,
    "vendorWorkingHours": vendorWorkingHours,
    "status": status,
    "category": category,
    "passwordHash": passwordHash,
    "workingHoursStatus": workingHoursStatus,
    "avilableTime": avilableTime,
  };
}

