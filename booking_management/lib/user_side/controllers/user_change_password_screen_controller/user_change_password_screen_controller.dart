import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/user_side/model/user_change_password_model/user_change_password_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserChangePasswordScreenController extends GetxController{
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  RxBool isSuccessStatus = false.obs;
  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  changePasswordFunction(/*{required String userName, required String password}*/) async {
    isLoading(true);

    String url = ApiUrl.userChangePasswordApi;
    log('Url : $url');

    try{
      /*Map<String, dynamic> body = {
        "UserName": "demotesting0909",
        "CurrentPassword": "Admin@1234",
        "NewPassword" : "Admin@123",
        "Verifypassword" : "Admin@123"
      };*/
      // Map<dynamic, dynamic> data = {
      //   "UserName" : "demotesting0909",
      //   "CurrentPassword" : "Admin@1234",
      //   "NewPassword" : "Admin@123",
      //   "Verifypassword" : "Admin@123"
      // };
      Map<String, dynamic> data = {
        "UserName" : "Demotesting0909",
        "CurrentPassword" : "Admin@1234",
        "NewPassword" : "Admin@1234",
        "Verifypassword" : "Admin@1234"
      };

      log('data : $data');
      http.Response response = await http.post(Uri.parse(url),
          body: jsonEncode(data));

      // http.Response response = await http.post(Uri.parse(url), body: json.encode(data));
      log('Response : ${response.body}');

      UserChangePasswordModel userChangePasswordModel = UserChangePasswordModel.fromJson(json.decode(response.body));
      // isStatus = userChangePasswordModel.statusCode.obs;
      isSuccessStatus = userChangePasswordModel.success.obs;
      log("isSuccessStatus : $isSuccessStatus");


      if(isSuccessStatus.value) {
        Get.snackbar(userChangePasswordModel.message, '');
      } else {
        log('Change Password False False');
      }

    } catch(e) {
      log('Change Password Error : $e');
    } finally {
      isLoading(false);
    }
  }
}