import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/user_side/model/user_sign_up_model/user_sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;



class UserSignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isRePasswordVisible = true.obs;
  RxString selectedDate = ''.obs;

  File? file;

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();


  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController userNameFieldController = TextEditingController();
  final TextEditingController lastNameFieldController = TextEditingController();
  final TextEditingController genderFieldController = TextEditingController();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController mobileFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();
  final TextEditingController cPasswordFieldController = TextEditingController();
  TextEditingController dobFieldController = TextEditingController();
  TextEditingController stateFieldController = TextEditingController();
  TextEditingController cityFieldController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );
    if (d != null) {
      // selectedDate.value = DateFormat.yMMMMd("en_US").format(d);
      selectedDate.value = DateFormat.yMMMd("en_US").format(d);
      dobFieldController.text = selectedDate.value;
      log('selectedDate : ${selectedDate.value}');

    }
  }

  userSignUpFunction() async {
    isLoading(true);

    String url = ApiUrl.userSignUpApi;
    log('Url : $url');

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['UserName'] = userNameFieldController.text.trim();
      request.fields['Email'] = emailFieldController.text.trim();
      request.fields['PasswordHash'] = passwordFieldController.text.trim();
      request.fields['PhoneNo'] = mobileFieldController.text.trim();

      log('request.fields: ${request.fields}');


      var response = await request.send();
      log('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) async {
        UserSignUpModel response1 = UserSignUpModel.fromJson(json.decode(value));
        log('response1 :::::: ${response1.statusCode}');
        isStatus = response1.statusCode.obs;

        if(isStatus.value == 200) {
          // UserDetails.customerId = response1.data.id;
          Fluttertoast.showToast(msg: response1.message);
          clearSignUpFieldsFunction();
          Get.off(()=> SignInScreen(), transition: Transition.zoom);
        } else {
          log('False False');
        }
      });

    } catch(e) {
      log('SignUp Error : $e');
    } finally {
      isLoading(false);
    }
  }

  clearSignUpFieldsFunction() {
    userNameFieldController.clear();
    lastNameFieldController.clear();
    emailFieldController.clear();
    mobileFieldController.clear();
    passwordFieldController.clear();
    cPasswordFieldController.clear();
    stateFieldController.clear();
    cityFieldController.clear();
    genderFieldController.clear();
  }
}