import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/common_ui/model/sign_in_screen_model/sign_in_screen_model.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_index_screen/vendor_index_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  RxBool isPasswordVisible = true.obs;
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController unameFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  signInFunction(/*{required String userName, required String password}*/) async {
    isLoading(true);

    String url = ApiUrl.signInApi + "?UserName=${unameFieldController.text.trim()}&Password=${passwordFieldController.text.trim()}";
    log('Url : $url');

    try{
      // Map<String, dynamic> data = {
      //   "Email": email,
      //   "Password": password,
      // };

      //print('data : $data');

      http.Response response = await http.post(Uri.parse(url));
      log('Response : $response');

      SignInModel signInModel = SignInModel.fromJson(json.decode(response.body));
      isStatus = signInModel.statusCode.obs;

      log("status: $isStatus");

      if(isStatus.value == 200) {
        //String userToken = signInModel.token;
        //print('userToken : $userToken');
       // await sharedPreferenceData.setUserLoginDetailsInPrefs(userToken: "$userToken");
       // await createUserWallet();
        String userId = signInModel.data.id;
        String role = signInModel.role.name;

        UserDetails.vendorId = signInModel.vendor.id;
        log("vendorId: ${UserDetails.vendorId}");
        UserDetails.customerId = signInModel.customer.id;
        log("customerId: ${UserDetails.customerId}");
        log("message: ${signInModel.message}");
        await sharedPreferenceData.setUserLoginDetailsInPrefs(userId: userId, role: role, vendorId: UserDetails.vendorId!, customerId: UserDetails.customerId!);
        //Get.snackbar(signInModel.message, '');
        if(signInModel.role.name == "Customer"){
          log('customer side');
          Get.snackbar(signInModel.message, '');
          Get.offAll(() => IndexScreen());

          //Get.snackbar(signInModel.message, '');
        } else if(signInModel.role.name == "Vendor"){
          log('Vendor side');
          Get.snackbar(signInModel.message, '');
          Get.offAll(() => VendorIndexScreen());
          //Get.snackbar('LoggedIn Successfully.', '');
        }


      } else {
        log('SignIn False False');
        Get.snackbar(signInModel.message, '');
      }

    } catch(e) {
      log('SignIn Error : $e');
    } finally {
      isLoading(false);
    }
  }

}