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
    UserDetails.userId = prefs.getString(sharedPreferenceData.userIdKey) ?? "";
    UserDetails.role = prefs.getString(sharedPreferenceData.roleKey) ?? "";
    UserDetails.vendorId = prefs.getInt(sharedPreferenceData.vendorIdKey) ?? 0;
    bool isLoggedIn = UserDetails.isUserLoggedIn;
    if(isLoggedIn == true) {
      //Get.offAll(()=> IndexScreen());
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