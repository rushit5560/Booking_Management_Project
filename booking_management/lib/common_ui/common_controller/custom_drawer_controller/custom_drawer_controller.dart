import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/common_ui/model/sign_out_model/sign_out_model.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final SharedPreferenceData sharedPreferenceData = SharedPreferenceData();


  Future<void> signOutFunction() async {
    isLoading(true);
    String url = ApiUrl.logOutApi + "?id=${UserDetails.uniqueId}";
    log("SignOut Api Url : $url");

    try {
       http.Response response = await http.get(Uri.parse(url));
       log("Response : ${response.body}");

       SignOutModel signOutModel = SignOutModel.fromJson(json.decode(response.body));
       isSuccessStatus = signOutModel.success.obs;

       if(isSuccessStatus.value) {
         await sharedPreferenceData.clearUserLoginDetailsFromPrefs();
         Get.offAll(() => SignInScreen(), transition: Transition.zoom);
         Get.snackbar('You Have Successfully Logout', '');
       } else {
         log("signOutFunction Else Else");
       }


    } catch(e) {
      log("SignOutFunction Error ::: $e");
    } finally {
      isLoading(false);
    }


  }

}