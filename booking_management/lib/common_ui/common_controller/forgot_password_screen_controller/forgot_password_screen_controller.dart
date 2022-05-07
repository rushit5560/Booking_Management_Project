import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/common_ui/model/forgot_password_model/forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool hasError = false.obs;

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> codeFormKey = GlobalKey<FormState>();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController codeFieldController = TextEditingController();
  PinDecoration ? pinDecoration;
  PinEntryType pinEntryType = PinEntryType.underline;
  final ColorBuilder _solidColor =
  PinListenColorBuilder(Colors.grey, Colors.grey);
  final bool _solidEnable = false;
  bool obscureEnable = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedMenu(PinEntryType.underline);
  }

  void selectedMenu(PinEntryType type) {
    pinEntryType = type;
    switch (type) {
      case PinEntryType.underline:
        //setState(() {
          pinDecoration = UnderlineDecoration(
            colorBuilder: PinListenColorBuilder(Colors.black, Colors.black),
            bgColorBuilder: _solidEnable ? _solidColor : null,
            obscureStyle: ObscureStyle(
              isTextObscure: obscureEnable,
              obscureText: '😂',
            ),
          );
       // });
        break;
      case PinEntryType.boxTight:
       // setState(() {
          pinDecoration = BoxTightDecoration(
            bgColorBuilder: _solidEnable ? _solidColor : null,
            obscureStyle: ObscureStyle(
              isTextObscure: obscureEnable,
              obscureText: '👿',
            ),
            //hintText: _kDefaultHint,
          );
       // });
        break;
      case PinEntryType.boxLoose:
        //setState(() {
          pinDecoration = BoxLooseDecoration(
            strokeColorBuilder:
            PinListenColorBuilder(Colors.cyan, Colors.green),
            bgColorBuilder: _solidEnable ? _solidColor : null,
            obscureStyle: ObscureStyle(
              isTextObscure: obscureEnable,
              obscureText: '☺️',
            ),
            //hintText: _kDefaultHint,
          );
        //});
        break;
      case PinEntryType.circle:
        //setState(() {
          pinDecoration = CirclePinDecoration(
            bgColorBuilder: _solidEnable ? _solidColor : null,
            strokeColorBuilder:
            PinListenColorBuilder(Colors.cyan, Colors.green),
            obscureStyle: ObscureStyle(
              isTextObscure: obscureEnable,
              obscureText: '🤪',
            ),
            //hintText: _kDefaultHint,
          );
        //});
        break;
      case PinEntryType.customized:
      // setState(() {
       //  pinDecoration = ExampleDecoration();
      // });
       break;
    }
  }

  forgotPasswordFunction({required String email}) async {
    isLoading(true);

    String url = ApiUrl.forgotPasswordApi + "?Email=$email";
    log('Url : $url');

    try{
      // Map<String, dynamic> data = {
      //   "Email": email,
      //   "Password": password,
      // };

      //print('data : $data');

      http.Response response = await http.post(Uri.parse(url));

      ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel.fromJson(json.decode(response.body));
      isStatus = forgotPasswordModel.statusCode.obs;

      if(isStatus.value == 200) {
        //String userToken = signInModel.token;
        //print('userToken : $userToken');
        // await sharedPreferenceData.setUserLoginDetailsInPrefs(userToken: "$userToken");
        // await createUserWallet();
        Get.offAll(() => SignInScreen());
        Get.snackbar('Forgot Password Successfully.', '');
        emailFieldController.clear();
      } else {
        log('Forgot Password False False');
      }

    } catch(e) {
      log('Forgot Password Error : $e');
    } finally {
      isLoading(false);
    }
  }
}