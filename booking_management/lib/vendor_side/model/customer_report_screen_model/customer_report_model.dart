import 'dart:convert';

CustomerReportModel customerReportModelFromJson(String str) =>
    CustomerReportModel.fromJson(json.decode(str));

String customerReportModelToJson(CustomerReportModel data) =>
    json.encode(data.toJson());

class CustomerReportModel {
  CustomerReportModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  int statusCode;
  bool success;
  List<CustomerReportData> data;

  factory CustomerReportModel.fromJson(Map<String, dynamic> json) =>
      CustomerReportModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        data: List<CustomerReportData>.from(
            json["data"].map((x) => CustomerReportData.fromJson(x ?? {}))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CustomerReportData {
  CustomerReportData({
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
    required this.startDate,
    required this.endDate,
  });

  int id;
  String bookingId;
  int vendorId;
  Vendor vendor;
  Customer customer;
  String customerId;
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
  String bookingItems;
  String serviceName;
  String service;
  String price;
  String startDate;
  String endDate;

  factory CustomerReportData.fromJson(Map<String, dynamic> json) =>
      CustomerReportData(
        id: json["id"] ?? 0,
        bookingId: json["bookingId"] ?? "",
        vendorId: json["vendorId"] ?? 0,
        vendor: Vendor.fromJson(json["vendor"] ?? {}),
        customer: Customer.fromJson(json["customer"] ?? {}),
        customerId: json["customerId"].toString(),
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
        bookingItems: json["bookingItems"] ?? "",
        serviceName: json["serviceName"] ?? "",
        service: json["service"] ?? "",
        price: json["price"] == "" ? "" : json["price"].toString(),
        startDate: json["startDate"] ?? "",
        endDate: json["endDate"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingId": bookingId,
        "vendorId": vendorId,
        "vendor": vendor.toJson(),
        "customer": customer,
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
        "bookingItems": bookingItems,
        "serviceName": serviceName,
        "service": service,
        "price": price,
        "startDate": startDate,
        "endDate": endDate,
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
    required this.termsConditions,
    required this.fullName,
    required this.stripeId,
    required this.vendorStripeAccountId,
    required this.financialInstitutionName,
    required this.accountName,
    required this.accountCode,
    required this.accountNumber,
    required this.countryList,
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
  String resource;
  bool termsConditions;
  String fullName;
  String stripeId;
  String vendorStripeAccountId;
  String financialInstitutionName;
  String accountName;
  String accountCode;
  String accountNumber;
  String countryList;

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
        firstPayment: json["firstPayment"] ?? "",
        nextPayment: json["nextPayment"] ?? "",
        vendorVerificationDate: json["vendorVerificationDate"] ?? "",
        // applicationUser: ApplicationUser.fromJson(json["applicationUser"]),
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
        service: json["service"] ?? "",
        resource: json["resource"] ?? "",
        termsConditions: json["termsConditions"] ?? false,
        fullName: json["fullName"] ?? "",
        stripeId: json["stripeId"] ?? "",
        vendorStripeAccountId: json["vendorStripeAccountId"] ?? "",
        financialInstitutionName: json["financialInstitutionName"] ?? "",
        accountName: json["accountName"] ?? "",
        accountCode: json["accountCode"] ?? "",
        accountNumber: json["accountNumber"] ?? "",
        countryList: json["countryList"] ?? "",
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
        "resource": resource,
        "termsConditions": termsConditions,
        "fullName": fullName,
        "stripeId": stripeId,
        "vendorStripeAccountId": vendorStripeAccountId,
        "financialInstitutionName": financialInstitutionName,
        "accountName": accountName,
        "accountCode": accountCode,
        "accountNumber": accountNumber,
        "countryList": countryList,
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

  String bookingId;
  String dateOfBirth;
  String duration;
  String email;
  String gender;
  int id;
  bool isActive;
  bool isPriceDisplay;
  // dynamic applicationUser;
  String modifiedBy;

  String modifiedOn;
  String notes;
  // dynamic applicationUserModifier;
  String passwordHash;

  String phoneNo;
  String resourceId;
  String userId;
  String userName;

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
