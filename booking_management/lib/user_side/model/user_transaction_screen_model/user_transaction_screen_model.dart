class GetUserTransactionModel {
  int statusCode;
  bool success;
  List<Data> data;

  GetUserTransactionModel({
    required this.statusCode,
    required this.success,
    required this.data
  });

  factory GetUserTransactionModel.fromJson(Map<String, dynamic> json) => GetUserTransactionModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x)) ?? {}),
  );


  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  int id;
  String bookingId;
  String orderDate;
  double price;
  String paidBy;
  //ApplicationUserCreator applicationUserCreator;

  Data(
      {
        required this.id,
        required this.bookingId,
        required this.orderDate,
        required this.price,
        required this.paidBy,
        //required this.applicationUserCreator
      });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    bookingId: json["bookingId"] ?? "",
    orderDate: json["orderDate"] ?? "",
    price: json["price"] ?? 0.0,
    paidBy: json["paidBy"] ?? "",
    //applicationUserCreator: ApplicationUserCreator.fromJson(json["applicationUserCreator"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "categories": categories,
    "bookingId": bookingId,
    "orderDate": orderDate,
    "price": price,
    "paidBy": paidBy
  };

}

/*
class ApplicationUserCreator {
  String apiToken;
  String frogotToken;
  String fcmToken;
  String returnUrl;
  String externalLogins;
  String id;
  String userName;
  String normalizedUserName;
  String email;
  String normalizedEmail;
  bool emailConfirmed;
  String passwordHash;
  String securityStamp;
  String concurrencyStamp;
  String phoneNumber;
  bool phoneNumberConfirmed;
  bool twoFactorEnabled;
  String lockoutEnd;
  bool lockoutEnabled;
  int accessFailedCount;

  ApplicationUserCreator(
      {
        required this.apiToken,
        required this.frogotToken,
        required this.fcmToken,
        required this.returnUrl,
        required this.externalLogins,
        required this.id,
        required this.userName,
        required this.normalizedUserName,
        required this.email,
        required this.normalizedEmail,
        required this.emailConfirmed,
        required this.passwordHash,
        required this.securityStamp,
        required this.concurrencyStamp,
        required this.phoneNumber,
        required this.phoneNumberConfirmed,
        required this.twoFactorEnabled,
        required this.lockoutEnd,
        required this.lockoutEnabled,
        required this.accessFailedCount
      });

  ApplicationUserCreator.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    frogotToken = json['frogotToken'];
    fcmToken = json['fcmToken'];
    returnUrl = json['returnUrl'];
    externalLogins = json['externalLogins'];
    id = json['id'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd = json['lockoutEnd'];
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiToken'] = this.apiToken;
    data['frogotToken'] = this.frogotToken;
    data['fcmToken'] = this.fcmToken;
    data['returnUrl'] = this.returnUrl;
    data['externalLogins'] = this.externalLogins;
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['normalizedUserName'] = this.normalizedUserName;
    data['email'] = this.email;
    data['normalizedEmail'] = this.normalizedEmail;
    data['emailConfirmed'] = this.emailConfirmed;
    data['passwordHash'] = this.passwordHash;
    data['securityStamp'] = this.securityStamp;
    data['concurrencyStamp'] = this.concurrencyStamp;
    data['phoneNumber'] = this.phoneNumber;
    data['phoneNumberConfirmed'] = this.phoneNumberConfirmed;
    data['twoFactorEnabled'] = this.twoFactorEnabled;
    data['lockoutEnd'] = this.lockoutEnd;
    data['lockoutEnabled'] = this.lockoutEnabled;
    data['accessFailedCount'] = this.accessFailedCount;
    return data;
  }
}*/
