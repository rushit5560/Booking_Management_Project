import 'dart:convert';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_ui/model/sign_in_screen_model/sign_in_screen_model.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  RxBool isPasswordVisible = true.obs;

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController unameFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  signInFunction({required String userName, required String password}) async {
    isLoading(true);

    String url = ApiUrl.signInApi + "?UserName=$userName&Password=$password";
    print('Url : $url');

    try{
      // Map<String, dynamic> data = {
      //   "Email": email,
      //   "Password": password,
      // };

      //print('data : $data');

      http.Response response = await http.post(Uri.parse(url));

      SignInModel signInModel = SignInModel.fromJson(json.decode(response.body));
      isStatus = signInModel.statusCode!.obs;

      if(isStatus.value == 200) {
        //String userToken = signInModel.token;
        //print('userToken : $userToken');
       // await sharedPreferenceData.setUserLoginDetailsInPrefs(userToken: "$userToken");
       // await createUserWallet();
        Get.offAll(() => IndexScreen());
        Get.snackbar('LoggedIn Successfully.', '');
      } else {
        print('SignIn False False');
      }

    } catch(e) {
      print('SignIn Error : $e');
    } finally {
      isLoading(false);
    }
  }
}