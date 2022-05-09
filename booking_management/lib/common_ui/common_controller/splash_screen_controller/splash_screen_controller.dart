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


    bool isLoggedIn = UserDetails.isUserLoggedIn;
    log('isLoggedIn: $isLoggedIn');
    if(isLoggedIn == true) {
      if(UserDetails.role == "Customer"){
        log('customer side');
        Get.offAll(() => IndexScreen(), transition: Transition.zoom);
      } else if(UserDetails.role == "Vendor"){
        log('Vendor side');
        Get.offAll(() => VendorIndexScreen(), transition: Transition.zoom);
      }
    } else {
      Get.offAll(()=> SignInScreen(), transition: Transition.zoom);
    }

  }

  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () => goToNextScreen());
    super.onInit();
  }
}