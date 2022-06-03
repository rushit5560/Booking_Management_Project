import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/api_header.dart';
import '../../../vendor_side/model/vendor_update_profile_model/vendor_get_user_details_model.dart';
import '../../model/user_profile_screen_model/update_user_profile_model.dart';

class UserProfileScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isStatus = 0.obs;
  RxString selectedDate = UserDetails.dob.obs;
  RxString gender = 'Male'.obs;

  ApiHeader apiHeader = ApiHeader();

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

    Map<String, String> headers= <String,String>{
      'Authorization': UserDetails.apiToken
    };
    log('UserDetails.apiToken: ${UserDetails.apiToken}');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(headers);

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



  /// Get User Details By Id
  getUserDetailsById()async {
    isLoading(true);
    String url = ApiUrl.getUserDetailsByIdApi + "?id=${UserDetails.uniqueId}";
    log('Url : $url');

    try{

      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Get All User Details Response : ${response.body}');

      GetUserDetailsByIdModel getUserDetailsByIdModel = GetUserDetailsByIdModel.fromJson(json.decode(response.body));
      isStatus = getUserDetailsByIdModel.statusCode.obs;
      log('getUserDetailsByIdModel: ${getUserDetailsByIdModel.success}');
      log('getUserDetailsByIdModelStatus : $isStatus');

      if(isStatus.value == 200) {

      } else {
        log('Get All User Details Else Else');
      }

    } catch(e) {
      log('Get All User Details False False: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // getUserDetailsById();
    nameTextFieldController.text = UserDetails.userName;
    mobileTextFieldController.text = UserDetails.phoneNo;
    selectedDate.value = UserDetails.dob;
    emailTextFieldController.text = UserDetails.email;
    gender.value = UserDetails.gender;
    super.onInit();
  }

}