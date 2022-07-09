import 'dart:developer';

import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData{

  String isUserLoggedInKey = "isUserLoggedInKey";
  String apiTokenKey = "apiTokenKey";
  String uniqueIdKey = "uniqueIdKey";
  String tableWiseIdKey = "tableWiseIdKey";
  String userNameKey = "userNameKey";
  String emailKey = "emailKey";
  String phoneNoKey = "phoneNoKey";
  String dobKey = "dobKey";
  String roleNameKey = "roleNameKey";
  String genderKey = "genderKey";

  String businessNameKey = "businessNameKey";
  String addressKey = "addressKey";
  String streetKey = "streetKey";
  String stateKey = "stateKey";
  String countryKey = "countryKey";
  String subUrbKey = "subUrbKey";
  String postCodeKey = "postCodeKey";
  //String slotDurationKey = "slotDurationKey";
  String businessIdKey = "businessIdKey";
  String serviceSlotKey = "serviceSlotKey";

  String latitudeKey = "latitudeKey";
  String longitudeKey = "longitudeKey";

  String isUserFirstTimeKey = "isUserFirstTimeKey";

  /// This Function Use For Set UserLoginStatus, UserId & Token in sharedPreference
  setUserLoginDetailsInPrefs({
        required String apiToken,
        required String uniqueId,
        required int tableWiseId,
        required String userName,
        required String email,
        required String phoneNo,
        required String dob,
        required String roleName,
        required String gender,
        required String businessName,
        required String address,
        required String street,
        required String state,
        required String country,
        required String subUrb,
        required String postCode,
    //required String slotDuration
    required String businessId,
    required bool serviceSlot,
      }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove Old Id & Token
    prefs.setBool(isUserLoggedInKey, false);
    prefs.remove(apiTokenKey);
    prefs.remove(uniqueIdKey);
    prefs.remove(tableWiseIdKey);
    prefs.remove(userNameKey);
    prefs.remove(emailKey);
    prefs.remove(phoneNoKey);
    prefs.remove(dobKey);
    prefs.remove(roleNameKey);
    prefs.remove(genderKey);
    prefs.remove(businessNameKey);
    prefs.remove(addressKey);
    prefs.remove(streetKey);
    prefs.remove(stateKey);
    prefs.remove(countryKey);
    prefs.remove(subUrbKey);
    prefs.remove(postCodeKey);
    //prefs.remove(slotDurationKey);
    prefs.remove(businessIdKey);
    prefs.setBool(serviceSlotKey, false);

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setString(apiTokenKey, apiToken);
    prefs.setString(uniqueIdKey, uniqueId);
    prefs.setInt(tableWiseIdKey, tableWiseId);
    prefs.setString(userNameKey, userName);
    prefs.setString(emailKey, email);
    prefs.setString(phoneNoKey, phoneNo);
    prefs.setString(dobKey, dob);
    prefs.setString(roleNameKey, roleName);
    prefs.setString(genderKey, gender);
    prefs.setString(businessNameKey, businessName);
    prefs.setString(addressKey, address);
    prefs.setString(streetKey, street);
    prefs.setString(stateKey, state);
    prefs.setString(countryKey, country);
    prefs.setString(subUrbKey, subUrb);
    prefs.setString(postCodeKey, postCode);
    //prefs.setString(slotDurationKey, slotDuration);
    prefs.setString(businessIdKey, businessId);
    prefs.setBool(serviceSlotKey, serviceSlot);

    // Now Set Prefs Data in UserDetails in Code
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.apiToken = prefs.getString(apiTokenKey) ?? "";
    UserDetails.uniqueId = prefs.getString(uniqueIdKey) ?? "";
    UserDetails.tableWiseId = prefs.getInt(tableWiseIdKey) ?? 0;
    UserDetails.userName = prefs.getString(userNameKey) ?? "";
    UserDetails.email = prefs.getString(emailKey) ?? "";
    UserDetails.phoneNo = prefs.getString(phoneNoKey) ?? "";
    UserDetails.dob = prefs.getString(dobKey) ?? "";
    UserDetails.roleName = prefs.getString(roleNameKey) ?? "";
    UserDetails.gender = prefs.getString(genderKey) ?? "";
    UserDetails.businessName = prefs.getString(businessNameKey) ?? "";
    UserDetails.address = prefs.getString(addressKey) ?? "";
    UserDetails.street = prefs.getString(streetKey) ?? "";
    UserDetails.state = prefs.getString(stateKey) ?? "";
    UserDetails.country = prefs.getString(countryKey) ?? "";
    UserDetails.subUrb = prefs.getString(subUrbKey) ?? "";
    UserDetails.postCode = prefs.getString(postCodeKey) ?? "";
    //UserDetails.slotDuration = prefs.getString(slotDurationKey) ?? "";
    UserDetails.businessId = prefs.getString(businessIdKey) ?? "";
    UserDetails.isServiceSlot = prefs.getBool(serviceSlotKey) ?? false;

    log("UserDetails.isUserLoggedIn : ${UserDetails.isUserLoggedIn}");
    log("UserDetails.apiToken : ${UserDetails.apiToken}");
    log("UserDetails.uniqueId : ${UserDetails.uniqueId}");
    log("UserDetails.tableWiseId : ${UserDetails.tableWiseId}");
    log("UserDetails.userName : ${UserDetails.userName}");
    log("UserDetails.email : ${UserDetails.email}");
    log("UserDetails.phoneNo : ${UserDetails.phoneNo}");
    log("UserDetails.dob : ${UserDetails.dob}");
    log("UserDetails.roleName : ${UserDetails.roleName}");
    log("UserDetails.gender : ${UserDetails.gender}");
    log("UserDetails.businessName : ${UserDetails.businessName}");
    log("UserDetails.address : ${UserDetails.address}");
    log("UserDetails.street : ${UserDetails.street}");
    log("UserDetails.state : ${UserDetails.state}");
    log("UserDetails.country : ${UserDetails.country}");
    log("UserDetails.subUrb : ${UserDetails.subUrb}");
    log("UserDetails.postCode : ${UserDetails.postCode}");
    //log("UserDetails.slotDuration : ${UserDetails.slotDuration}");
    log("UserDetails.businessId : ${UserDetails.businessId}");
    log("UserDetails.isServiceSlot : ${UserDetails.isServiceSlot}");
  }


  /// Clear All UserLoggedIn Data
  clearUserLoginDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, false);
    prefs.setString(apiTokenKey, "");
    prefs.setString(uniqueIdKey, "");
    prefs.setInt(tableWiseIdKey, 0);
    prefs.setString(userNameKey, "");
    prefs.setString(emailKey, "");
    prefs.setString(phoneNoKey, "");
    prefs.setString(dobKey, "");
    prefs.setString(roleNameKey, "");
    prefs.setString(genderKey, "");
    prefs.setString(businessNameKey, "");
    prefs.setString(addressKey, "");
    prefs.setString(streetKey, "");
    prefs.setString(stateKey, "");
    prefs.setString(countryKey, "");
    prefs.setString(subUrbKey, "");
    prefs.setString(postCodeKey, "");
    //prefs.setString(slotDurationKey, "");
    prefs.setString(businessIdKey, "");

    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.apiToken = prefs.getString(apiTokenKey) ?? "";
    UserDetails.uniqueId = prefs.getString(uniqueIdKey) ?? "";
    UserDetails.tableWiseId = prefs.getInt(tableWiseIdKey) ?? 0;
    UserDetails.userName = prefs.getString(userNameKey) ?? "";
    UserDetails.email = prefs.getString(emailKey) ?? "";
    UserDetails.phoneNo = prefs.getString(phoneNoKey) ?? "";
    UserDetails.dob = prefs.getString(dobKey) ?? "";
    UserDetails.roleName = prefs.getString(roleNameKey) ?? "";
    UserDetails.gender = prefs.getString(genderKey) ?? "";
    UserDetails.businessName = prefs.getString(businessNameKey) ?? "";
    UserDetails.address = prefs.getString(addressKey) ?? "";
    UserDetails.street = prefs.getString(streetKey) ?? "";
    UserDetails.state = prefs.getString(stateKey) ?? "";
    UserDetails.country = prefs.getString(countryKey) ?? "";
    UserDetails.subUrb = prefs.getString(subUrbKey) ?? "";
    UserDetails.postCode = prefs.getString(postCodeKey) ?? "";
    //UserDetails.slotDuration = prefs.getString(slotDurationKey) ?? "";
    UserDetails.businessId = prefs.getString(businessIdKey) ?? "";

    log("UserDetails.isUserLoggedIn : ${UserDetails.isUserLoggedIn}");
    log("UserDetails.apiToken : ${UserDetails.apiToken}");
    log("UserDetails.uniqueId : ${UserDetails.uniqueId}");
    log("UserDetails.tableWiseId : ${UserDetails.tableWiseId}");
    log("UserDetails.userName : ${UserDetails.userName}");
    log("UserDetails.email : ${UserDetails.email}");
    log("UserDetails.phoneNo : ${UserDetails.phoneNo}");
    log("UserDetails.dob : ${UserDetails.dob}");
    log("UserDetails.roleName : ${UserDetails.roleName}");
    log("UserDetails.gender : ${UserDetails.gender}");
    log("UserDetails.businessName : ${UserDetails.businessName}");
    log("UserDetails.address : ${UserDetails.address}");
    log("UserDetails.street : ${UserDetails.street}");
    log("UserDetails.state : ${UserDetails.state}");
    log("UserDetails.country : ${UserDetails.country}");
    log("UserDetails.subUrb : ${UserDetails.subUrb}");
    log("UserDetails.postCode : ${UserDetails.postCode}");
   // log("UserDetails.slotDuration : ${UserDetails.slotDuration}");
    log("UserDetails.businessId : ${UserDetails.businessId}");
  }


  /// Set Latitude & Longitude
  setLatAndLongInPrefs({required String lat, required String long}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(latitudeKey, lat);
    prefs.setString(longitudeKey, long);

    UserDetails.latitude = prefs.getString(latitudeKey) ?? "";
    UserDetails.longitude = prefs.getString(longitudeKey) ?? "";
  }


  /// Clear Lat & Long
  clearLatAndLongFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(latitudeKey);
    prefs.remove(longitudeKey);

    prefs.setString(latitudeKey, "");
    prefs.setString(longitudeKey, "");
  }


  setUserIsFirstTimeInApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isUserFirstTimeKey, false);

  }


}