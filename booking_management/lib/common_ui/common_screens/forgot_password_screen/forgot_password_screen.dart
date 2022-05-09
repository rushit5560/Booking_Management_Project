import 'package:booking_management/common_modules/common_functions.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/common_widgets.dart';
import '../../common_controller/forgot_password_screen_controller/forgot_password_screen_controller.dart';
import 'forgot_password_screen_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final forgotPasswordScreenController = Get.put(ForgotPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Obx(
          ()=> forgotPasswordScreenController.isLoading.value
          ? const CustomCircularLoaderModule()
          : SafeArea(
            child: Form(
              key: forgotPasswordScreenController.forgotPasswordFormKey,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // From Common Widgets
                  const HeaderLogoModule(),
                  const SizedBox(height: 50),
                  const HeaderTextModule(name: "Forgot Password"),
                  const SizedBox(height: 80),
                  ForgotPasswordScreenEmailFieldModule(),
                  const SizedBox(height: 45),
                  // SendCodeButtonModule(),
                  // SizedBox(height: 45),
                  // CodeTextFieldModule(),
                  // SizedBox(height: 45),
                  ForgotPasswordScreenSubmitButtonModule(),
                ],
              ).commonAllSidePadding(20),
            ),
          ),
        ),
      ),
    );
  }
}
