import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user_profile_screen_model/update_user_profile_model.dart';

class UserProfileScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxString selectedDate = UserDetails.dob.obs;
  RxString gender = 'Male'.obs;

  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final nameTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final addressTextFieldController = TextEditingController();
  final mobileTextFieldController = TextEditingController();
  final cityTextFieldController = TextEditingController();
  final stateTextFieldController = TextEditingController();
  final countryTextFieldController = TextEditingController();
  String selectDOB = "";

  updateUserProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.userProfileApi;
    log("Update User Profile : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['Id'] = UserDetails.tableWiseId.toString();
      request.fields['PhoneNo'] = mobileTextFieldController.text.trim();
      request.fields['DateOfBirth'] = selectedDate.value;
      request.fields['Gender'] = gender.value;
      request.fields['ModifiedBy'] = UserDetails.uniqueId;

      log('request.fields: ${request.fields}');

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        UpdateUserProfileModel updateUserProfileModel = UpdateUserProfileModel.fromJson(json.decode(value));
        log('response1 :::::: ${updateUserProfileModel.statusCode}');
        isSuccessStatus = updateUserProfileModel.success.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: "User update successfully.");
          log(updateUserProfileModel.dataVendor.userName);
          log(updateUserProfileModel.dataVendor.email);
          log(updateUserProfileModel.dataVendor.phoneNo);

        } else {
          log('False False');
        }
      });

    } catch(e) {
      log("updateUserProfileFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

}