import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/user_side/model/user_change_password_model/user_change_password_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  changePasswordFunction() async {

    isLoading(true);

    String url = ApiUrl.userChangePasswordApi;
    log('Url : $url');

    Map<String, String> headers= <String,String>{
      'Authorization': UserDetails.apiToken
    };
    log('UserDetails.apiToken: ${UserDetails.apiToken}');

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(headers);

      request.fields['UserName'] = UserDetails.userName;
      request.fields['CurrentPassword'] = currentPasswordController.text.trim();
      request.fields['NewPassword'] = newPasswordController.text.trim();
      request.fields['Verifypassword'] = confirmPasswordController.text.trim();


      log('request.fields: ${request.fields}');
      log('request.files: ${request.files}');


      var response = await request.send();
      log('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) {
        UserChangePasswordModel response1 = UserChangePasswordModel.fromJson(json.decode(value));
        log('response1 ::::::${response1.statusCode}');
        isStatus = response1.statusCode.obs;
        log('status : $isStatus');
        log('success : ${response1.statusCode}');

        if(isStatus.value == 200){
          //UserDetails().vendorId = response1.data.id;
          //log("Vendor Id: ${UserDetails().vendorId}");
          Fluttertoast.showToast(msg: response1.message);
          clearChangePasswordFieldsFunction();
          //Get.off(SignInScreen(), transition: Transition.zoom);

        } else {
          // Fluttertoast.showToast(msg: "${response1.message}");
          log('False False');
        }
      });


    } catch(e) {
      log('SignUp Error : $e');
    } finally {
      isLoading(false);
    }
  }

  clearChangePasswordFieldsFunction(){
    userNameController.clear();
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }
}