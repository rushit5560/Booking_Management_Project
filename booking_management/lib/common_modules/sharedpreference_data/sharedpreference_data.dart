import 'dart:developer';

import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData{

  String isUserLoggedInKey = "isUserLoggedInKey";
  String userIdKey = "userIdKey";
  String roleKey = "userIdKey";
  String vendorIdKey = "vendorIdKey";
  String customerIdKey = "customerIdKey";


  /// This Function Use For Set UserLoginStatus, UserId & Token in sharedPreference
  setUserLoginDetailsInPrefs({required String userId, required String role, required int vendorId, required int customerId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove Old Id & Token
    prefs.remove(userIdKey);
    prefs.remove(roleKey);
    prefs.remove(vendorIdKey);
    prefs.remove(customerIdKey);

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setString(userIdKey, userId);
    prefs.setString(roleKey, role);
    prefs.setInt(vendorIdKey, vendorId);
    prefs.setInt(customerIdKey, customerId);

    // Now Set Prefs Data in UserDetails in Code
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.userId = prefs.getString(userIdKey) ?? "";
    UserDetails.role = prefs.getString(roleKey) ?? "";
    UserDetails.vendorId = prefs.getInt(vendorIdKey) ?? 0;
    UserDetails.customerId = prefs.getInt(customerIdKey) ?? 0;

    log('UserDetails.isUserLoggedIn : ${UserDetails.isUserLoggedIn}');
    log('UserDetails.userId : ${UserDetails.userId}');
    log('UserDetails.vendorId : ${UserDetails.vendorId}');

  }


  /// Clear All UserLoggedIn Data
  clearUserLoginDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, false);
    prefs.setString(userIdKey, "");
    prefs.setString(roleKey, "");
    prefs.setInt(vendorIdKey, 0);
    prefs.setInt(customerIdKey, 0);
    // print('Clear isUserLoggedInKey : ${prefs.getBool(isUserLoggedInKey)}');
    // print('Clear userIdKey : ${prefs.getString(userIdKey)}');
    // print('Clear userRoleKey : ${prefs.getString(userRoleKey)}');
    // print('Clear userTokenKey : ${prefs.getString(userTokenKey)}');
    // print('Clear userWalletIdKey : ${prefs.getString(userWalletIdKey)}');
  }
}