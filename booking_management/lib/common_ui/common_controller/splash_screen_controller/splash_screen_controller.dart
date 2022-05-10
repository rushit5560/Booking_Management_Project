import 'dart:async';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_index_screen/vendor_index_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  goToNextScreen()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserDetails.isUserLoggedIn = prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    UserDetails.apiToken = prefs.getString(sharedPreferenceData.apiTokenKey) ?? "";
    UserDetails.uniqueId = prefs.getString(sharedPreferenceData.uniqueIdKey) ?? "";
    UserDetails.tableWiseId = prefs.getInt(sharedPreferenceData.tableWiseIdKey) ?? 0;
    UserDetails.userName = prefs.getString(sharedPreferenceData.userNameKey) ?? "";
    UserDetails.email = prefs.getString(sharedPreferenceData.emailKey) ?? "";
    UserDetails.phoneNo = prefs.getString(sharedPreferenceData.phoneNoKey) ?? "";
    UserDetails.dob = prefs.getString(sharedPreferenceData.dobKey) ?? "";
    UserDetails.roleName = prefs.getString(sharedPreferenceData.roleNameKey) ?? "";
    UserDetails.businessName = prefs.getString(sharedPreferenceData.businessNameKey) ?? "";
    UserDetails.address = prefs.getString(sharedPreferenceData.addressKey) ?? "";
    UserDetails.street = prefs.getString(sharedPreferenceData.streetKey) ?? "";
    UserDetails.state = prefs.getString(sharedPreferenceData.stateKey) ?? "";
    UserDetails.country = prefs.getString(sharedPreferenceData.countryKey) ?? "";
    UserDetails.subUrb = prefs.getString(sharedPreferenceData.subUrbKey) ?? "";
    UserDetails.postCode = prefs.getString(sharedPreferenceData.postCodeKey) ?? "";

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


    bool isLoggedIn = UserDetails.isUserLoggedIn;
    log('isLoggedIn: $isLoggedIn');
    if(isLoggedIn == true) {
      if(UserDetails.roleName == "Customer") {
        log('Role Name : ${UserDetails.roleName}');
        Get.offAll(() => IndexScreen(), transition: Transition.zoom);
      } else if(UserDetails.roleName == "Vendor") {
        log('Role Name : ${UserDetails.roleName}');
        Get.offAll(() => VendorIndexScreen(), transition: Transition.zoom);
      }
    } else {
      Get.offAll(()=> SignInScreen(), transition: Transition.zoom);
    }

  }

  @override
  void onInit() {
    Timer(const Duration(seconds: 1), () => goToNextScreen());
    super.onInit();
  }
}