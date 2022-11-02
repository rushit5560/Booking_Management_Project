import 'dart:convert';

CheckoutSummaryModel checkoutSummaryModelFromJson(String str) =>
    CheckoutSummaryModel.fromJson(json.decode(str));

String checkoutSummaryModelToJson(CheckoutSummaryModel data) =>
    json.encode(data.toJson());

class CheckoutSummaryModel {
  CheckoutSummaryModel({
    required this.statusCode,
    required this.success,
    required this.workerList,
  });

  int statusCode;
  bool success;
  WorkerList workerList;

  factory CheckoutSummaryModel.fromJson(Map<String, dynamic> json) =>
      CheckoutSummaryModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        workerList: WorkerList.fromJson(json["workerList"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "workerList": workerList.toJson(),
      };
}

class WorkerList {
  WorkerList({
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

  Booking booking;
  Review review;

  factory WorkerList.fromJson(Map<String, dynamic> json) => WorkerList(
        id: json["id"] ?? 0,
        bookingId: json["bookingId"] ?? "",
        price: json["price"] ?? 0.0,
        quantity: json["quantity"] ?? 0,
        booking: Booking.fromJson(json["booking"] ?? {}),
        review: Review.fromJson(json["review"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingId": bookingId,
        "price": price,
        "quantity": quantity,
        "booking": booking.toJson(),
        "review": review.toJson(),
      };
}

class Booking {
  Booking({
    required this.id,
    required this.bookingId,
    required this.vendorId,
    required this.vendor,
    // this.customer,
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
    required this.resourceName,
    required this.bookingItems,
    required this.serviceName,
  });

  int id;
  String bookingId;
  int vendorId;
  Vendor vendor;
  // dynamic customer;
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
  String resourceName;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"] ?? 0,
        bookingId: json["bookingId"] ?? "",
        vendorId: json["vendorId"] ?? 0,
        vendor: Vendor.fromJson(json["vendor"] ?? {}),
        // customer: json["customer"],
        customerId: json["customerId"] ?? 0,
        bookingFor: json["bookingFor"] ?? "",
        bookingForId: json["bookingForId"] ?? "",
        startDateTime: json["startDateTime"] ?? "",
        endDateTime: json["endDateTime"] ?? "",
        firstName: json["firstName"] ?? "",
        email: json["email"] ?? "",
        phoneNo: json["phoneNo"] ?? "",
        resourceName: json["resourceName"] ?? "",
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
        // "customer": customer,
        "customerId": customerId,
        "bookingFor": bookingFor,
        "bookingForId": bookingForId,
        "startDateTime": startDateTime,
        "endDateTime": endDateTime,
        "firstName": firstName,
        "email": email,
        "phoneNo": phoneNo,
        "resourceName": resourceName,
        "notes": notes,
        "status": status,
        "bookingItems": bookingItems,
        "serviceName": serviceName,
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
    required this.stripeId,
    required this.vendorStripeAccountId,
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
  double rating;
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
  String stripeId;
  String vendorStripeAccountId;

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
        rating: json["rating"] ?? 0.0,
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
        stripeId: json["stripeId"] ?? "",
        vendorStripeAccountId: json["vendorStripeAccountId"] ?? "",
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
        "stripeId": stripeId,
        "vendorStripeAccountId": vendorStripeAccountId,
      };
}

class Review {
  Review({
    required this.id,
    // required this.vendor,
    required this.vendorId,
    // required this.customer,
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
    required this.favourites,
    required this.category,
  });

  int id;
  // Vendor vendor;
  int vendorId;
  // dynamic customer;
  int customerId;
  String description;
  int ratting;
  String date;
  bool isActive;
  String createdBy;
  String createdOn;
  String modifiedBy;
  String modifiedOn;
  String applicationUserCreator;
  String applicationUserModifier;
  String favourites;
  String category;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"] ?? 0,
        // vendor: Vendor.fromJson(json["vendor"]),
        vendorId: json["vendorId"] ?? 0,
        // customer: json["customer"] ?? "",
        customerId: json["customerId"] ?? 0,
        description: json["description"] ?? "",
        ratting: json["ratting"] ?? 0,
        date: json["date"] ?? "",
        isActive: json["isActive"] ?? false,
        createdBy: json["createdBy"] ?? "",
        createdOn: json["createdOn"] ?? "",
        modifiedBy: json["modifiedBy"] ?? "",
        modifiedOn: json["modifiedOn"] ?? "",
        applicationUserCreator: json["applicationUserCreator"] ?? "",
        applicationUserModifier: json["applicationUserModifier"] ?? "",
        favourites: json["favourites"] ?? "",
        category: json["category"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "vendor": vendor.toJson(),
        "vendorId": vendorId,
        // "customer": customer,
        "customerId": customerId,
        "description": description,
        "ratting": ratting,
        "date": date,
        "isActive": isActive,
        "createdBy": createdBy,
        "createdOn": createdOn,
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        "applicationUserCreator": applicationUserCreator,
        "applicationUserModifier": applicationUserModifier,
        "favourites": favourites,
        "category": category,
      };
}
