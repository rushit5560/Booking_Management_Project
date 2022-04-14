import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/user_side/model/user_sign_up_model/user_sign_up_model.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
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
  final TextEditingController userNameFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController lastNameFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController genderFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController emailFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController mobileFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  //final TextEditingController addressFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController passwordFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController cPasswordFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  TextEditingController dobFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  //TextEditingController countryFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  TextEditingController stateFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  TextEditingController cityFieldController = TextEditingController(/*text: "demo@gmail.com"*/);

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

  userSignUpFunction(/*{required String firstName,
        required String lastName,
        required String state,
        required String city,
        required String email,
        required String password,
        required String mobile
        }*/) async {
    isLoading(true);

    String url = ApiUrl.userSignUpApi;
    log('Url : $url');

    try{
      /*Map<String, dynamic> data = {
        "FirstName": firstName,
        "LastName": lastName,
        "State" : state,
        "City" : city,
        "Email" : email,
        "PasswordHash" : password,
        "PhoneNo" : mobile,
        // "Gender" : "Male",
        // "About" : "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        // "FaxNumber" : "20",
        // "IsActive": "true",
        //"DateOfBirth" : dobFieldController.text.trim()
      };*/

      //log('data : $data');

      //var stream = http.ByteStream(file!.openRead());
      //stream.cast();

      //var length = await file!.length();

      var request = http.MultipartRequest('POST', Uri.parse(url));

      //request.files.add(await http.MultipartFile.fromPath("file", file!.path));

      // request.fields['FirstName'] = "Testing120";
      // request.fields['LastName'] = "Testing";
      // request.fields['State'] = "Testing";
      // request.fields['City'] = "Testing";
      // request.fields['Email'] = "Testing122@gmail.com";
      // request.fields['PasswordHash'] = "Admin@123";
      // request.fields['PhoneNo'] = "7896541320";
      // request.fields['Gender'] = "Male";
      // request.fields['About'] = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
      // request.fields['LastVisit'] = "2001-12-01";
      // request.fields['FaxNumber'] = "20";
      // request.fields['DateOfBirth'] = "2001-12-01";
      // request.fields['IsActive'] = "true";

      request.fields['UserName'] = userNameFieldController.text.trim();
      //request.fields['LastName'] = lastNameFieldController.text.trim();
      //request.fields['State'] = stateFieldController.text.trim();
      //request.fields['City'] = cityFieldController.text.trim();
      request.fields['Email'] = emailFieldController.text.trim();
      request.fields['PasswordHash'] = passwordFieldController.text.trim();
      //request.fields['PhoneNo'] = mobileFieldController.text.trim();
      //request.fields['Gender'] = genderFieldController.text.trim();
      //request.fields['About'] = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
      //request.fields['LastVisit'] = "2001-12-01";
      //request.fields['FaxNumber'] = "20";
      //request.fields['DateOfBirth'] = "2001-12-01";
      //request.fields['IsActive'] = "true";

      log('request.fields: ${request.fields}');
      log('request.files: ${request.files}');

      // var multiPart = http.MultipartFile(
      //   'file',
      //   stream,
      //   length,
      // );

     // request.files.add(multiPart);

      var response = await request.send();
      log('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value)async {
        UserSignUpModel response1 = UserSignUpModel.fromJson(json.decode(value));
        log('response1 ::::::${response1.statusCode}');
        isStatus = response1.statusCode.obs;
        log('status : $isStatus');
        log('success : ${response1.data}');

        if(isStatus.value == 200){
          UserDetails.customerId = response1.data.id;
          Fluttertoast.showToast(msg: "${response1.message}");
          clearSignUpFieldsFunction();

        } else {
          // Fluttertoast.showToast(msg: "${response1.message}");
          log('False False');
        }
      });

      // http.Response response = await http.post(Uri.parse(url));
      //
      // UserSignUpModel userSignUpModel = UserSignUpModel.fromJson(json.decode(response.body));
      // isStatus = userSignUpModel.statusCode!.obs;
      //
      // if(isStatus.value == 200) {
      //   //String userToken = signInModel.token;
      //   //print('userToken : $userToken');
      //   // await sharedPreferenceData.setUserLoginDetailsInPrefs(userToken: "$userToken");
      //   // await createUserWallet();
      //   Get.offAll(() => IndexScreen());
      //   Get.snackbar('User Register Successfully.', '');
      // } else {
      //   print('SignUp False False');
      // }

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