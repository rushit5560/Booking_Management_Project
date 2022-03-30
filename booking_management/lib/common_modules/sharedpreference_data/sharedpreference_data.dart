import 'dart:developer';

import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData{

  String isUserLoggedInKey = "isUserLoggedInKey";
  String userIdKey = "userIdKey";
  String roleKey = "userIdKey";

  // This Function Use For Set UserLoginStatus, UserId & Token in sharedPreference
  setUserLoginDetailsInPrefs({required String userId, required String role}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove Old Id & Token
    prefs.remove(userIdKey);
    prefs.remove(roleKey);

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setString(userIdKey, userId);
    prefs.setString(roleKey, role);

    // Now Set Prefs Data in UserDetails in Code
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.userId = prefs.getString(userIdKey) ?? "";
    UserDetails.role = prefs.getString(roleKey) ?? "";

    log('UserDetails.isUserLoggedIn : ${UserDetails.isUserLoggedIn}');
    log('UserDetails.userId : ${UserDetails.userId}');

  }

  /// Clear All UserLoggedIn Data
  clearUserLoginDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, false);
    prefs.setString(userIdKey, "");
    prefs.setString(roleKey, "");
    // print('Clear isUserLoggedInKey : ${prefs.getBool(isUserLoggedInKey)}');
    // print('Clear userIdKey : ${prefs.getString(userIdKey)}');
    // print('Clear userRoleKey : ${prefs.getString(userRoleKey)}');
    // print('Clear userTokenKey : ${prefs.getString(userTokenKey)}');
    // print('Clear userWalletIdKey : ${prefs.getString(userWalletIdKey)}');
  }
}