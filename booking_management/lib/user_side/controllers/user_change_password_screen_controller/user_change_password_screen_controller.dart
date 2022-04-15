import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/user_side/model/user_change_password_model/user_change_password_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserChangePasswordScreenController extends GetxController{
  RxBool isPasswordVisible = true.obs;
  RxBool isNewPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
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
      Map<String, dynamic> data = {
        "UserName" : userNameController.text.trim(),
        "CurrentPassword" : currentPasswordController.text.trim(),
        "NewPassword" : newPasswordController.text.trim(),
        "Verifypassword" : confirmPasswordController.text.trim()
      };
      // Map<String, dynamic> data = {
      //   "UserName" : "demoVendor0909",
      //   "CurrentPassword" : "Admin@123",
      //   "NewPassword" : "Admin@123",
      //   "Verifypassword" : "Admin@123"
      // };

      log('data : $data');
      //String data2 = data.toString();
      //http.Response response = await http.post(Uri.parse(url), body: body);

       http.Response response = await http.post(Uri.parse(url), body: data);
      log('Status Code : ${response.statusCode}');
      log('Response : ${response.body}');

      UserChangePasswordModel userChangePasswordModel = UserChangePasswordModel.fromJson(json.decode(response.body));
      // isStatus = userChangePasswordModel.statusCode.obs;
      isSuccessStatus = userChangePasswordModel.success.obs;
      log("isSuccessStatus : $isSuccessStatus");


       if(isSuccessStatus.value) {
         print("success true");
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