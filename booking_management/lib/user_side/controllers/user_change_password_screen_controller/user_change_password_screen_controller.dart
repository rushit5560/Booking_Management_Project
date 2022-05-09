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

  changePasswordFunction(/*{required String userName, required String password}*/) async {

    isLoading(true);

    String url = ApiUrl.userChangePasswordApi;
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
      request.fields['UserName'] = UserDetails.userName;
      request.fields['CurrentPassword'] = currentPasswordController.text.trim();
      request.fields['NewPassword'] = newPasswordController.text.trim();
      request.fields['Verifypassword'] = confirmPasswordController.text.trim();


      log('request.fields: ${request.fields}');
      log('request.files: ${request.files}');

      // var multiPart = http.MultipartFile(
      //   'file',
      //   stream,
      //   length,
      // );

      //request.files.add(multiPart);

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

  clearChangePasswordFieldsFunction(){
    userNameController.clear();
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }
}