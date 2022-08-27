import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:booking_management/user_side/screens/user_sign_up_screen/user_sign_up_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_index_screen/vendor_index_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common_modules/constants/api_url.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/app_logos.dart';
import '../../model/splash_screen_model/get_logo_model.dart';

class SplashScreenController extends GetxController {
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  /// Get App Logo
  getAppLogoFunction() async {
    isLoading(true);
    String url = ApiUrl.logoApi;
    log("App Logo API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Logo API Response : ${response.body}");

      GetLogoModel getLogoModel =
          GetLogoModel.fromJson(json.decode(response.body));
      isSuccessStatus = getLogoModel.success.obs;

      if (isSuccessStatus.value) {
        AppLogo.splashLogo =
            ApiUrl.apiImagePath + getLogoModel.workerList.splashLogo;
        AppLogo.homeLogo =
            ApiUrl.apiImagePath + getLogoModel.workerList.homeLogo;
        AppLogo.mainLogo =
            ApiUrl.apiImagePath + getLogoModel.workerList.mainLogo;
        AppLogo.smallLogo =
            ApiUrl.apiImagePath + getLogoModel.workerList.smallLogo;

        log("splashLogo : ${AppLogo.splashLogo}");
        log("homeLogo : ${AppLogo.homeLogo}");
        log("AppLogo.mainLogo: ${AppLogo.mainLogo}");
      } else {
        log("getAppLogoFunction Else Else");
      }
    } catch (e) {
      log("Get Application Logo Error ::: $e");
    } finally {
      isLoading(false);
      Timer(const Duration(seconds: 2), () async => await goToNextScreen());
    }
  }

  /// Go To Next Screen
  goToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserDetails.isUserLoggedIn =
        prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    UserDetails.apiToken =
        prefs.getString(sharedPreferenceData.apiTokenKey) ?? "";
    UserDetails.uniqueId =
        prefs.getString(sharedPreferenceData.uniqueIdKey) ?? "";
    UserDetails.tableWiseId =
        prefs.getInt(sharedPreferenceData.tableWiseIdKey) ?? 0;
    UserDetails.userName =
        prefs.getString(sharedPreferenceData.userNameKey) ?? "";
    UserDetails.email = prefs.getString(sharedPreferenceData.emailKey) ?? "";
    UserDetails.phoneNo =
        prefs.getString(sharedPreferenceData.phoneNoKey) ?? "";
    UserDetails.dob = prefs.getString(sharedPreferenceData.dobKey) ?? "";
    UserDetails.roleName =
        prefs.getString(sharedPreferenceData.roleNameKey) ?? "";
    UserDetails.businessName =
        prefs.getString(sharedPreferenceData.businessNameKey) ?? "";
    UserDetails.address =
        prefs.getString(sharedPreferenceData.addressKey) ?? "";
    UserDetails.street = prefs.getString(sharedPreferenceData.streetKey) ?? "";
    UserDetails.state = prefs.getString(sharedPreferenceData.stateKey) ?? "";
    UserDetails.country =
        prefs.getString(sharedPreferenceData.countryKey) ?? "";
    UserDetails.subUrb = prefs.getString(sharedPreferenceData.subUrbKey) ?? "";
    UserDetails.postCode =
        prefs.getString(sharedPreferenceData.postCodeKey) ?? "";
    UserDetails.businessId =
        prefs.getString(sharedPreferenceData.businessIdKey) ?? "";
    UserDetails.isPriceDisplay =
        prefs.getBool(sharedPreferenceData.isPriceDisplayKey) ?? false;
    UserDetails.vendorVerification =
        prefs.getBool(sharedPreferenceData.vendorVerificationKey) ?? false;

    //user lpcation details
    UserDetails.longitude =
        prefs.getString(sharedPreferenceData.longitudeKey) ?? "";
    UserDetails.latitude =
        prefs.getString(sharedPreferenceData.latitudeKey) ?? "";

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
    log("UserDetails.businessId : ${UserDetails.businessId}");
    log("UserDetails.isPriceDisplay : ${UserDetails.isPriceDisplay}");
    log("UserDetails.vendorVerification : ${UserDetails.vendorVerification}");
    log("UserDetails.latitude : ${UserDetails.latitude}");
    log("UserDetails.longitude : ${UserDetails.longitude}");

    bool isLoggedIn = UserDetails.isUserLoggedIn;
    log('isLoggedIn: $isLoggedIn');

    UserDetails.isUserFirstTime =
        prefs.getBool(sharedPreferenceData.isUserFirstTimeKey) ?? true;
    log("UserDetails.isUserFirstTime : ${UserDetails.isUserFirstTime}");

    if (UserDetails.isUserFirstTime == true) {
      Get.offAll(() => UserSignUpScreen(), transition: Transition.zoom);
      await sharedPreferenceData.setUserIsFirstTimeInApp();
    } else {
      if (isLoggedIn == true) {
        if (UserDetails.roleName == "Customer") {
          log('Role Name : ${UserDetails.roleName}');
          Get.offAll(() => IndexScreen(), transition: Transition.zoom);
        } else if (UserDetails.roleName == "Vendor") {
          log('Role Name : ${UserDetails.roleName}');
          Get.offAll(() => VendorIndexScreen(), transition: Transition.zoom);
        }
      } else {
        Get.offAll(() => IndexScreen(), transition: Transition.zoom);
      }
    }
  }

  @override
  void onInit() {
    // log("Console Log Splash Screen");
    // Fluttertoast.showToast(msg: "Console Log Splash Screen");

    getAppLogoFunction();
    super.onInit();
  }
}
