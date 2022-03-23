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
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // From Common Widgets
              const HeaderLogoModule(),
              const SizedBox(height: 50),
              const HeaderTextModule(name: "Forgot Password"),
              const SizedBox(height: 80),
              const ForgotPasswordScreenEmailFieldModule(),
              const SizedBox(height: 45),
              const SendCodeButtonModule(),
              const SizedBox(height: 45),
              CodeTextFieldModule(),
              const SizedBox(height: 45),
              const ForgotPasswordScreenSubmitButtonModule(),
            ],
          ).commonAllSidePadding(20),
        ),
      ),
    );
  }
}
