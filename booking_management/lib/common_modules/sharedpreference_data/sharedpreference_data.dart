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

  }
}