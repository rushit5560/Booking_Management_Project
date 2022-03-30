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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // From Common Widgets
                HeaderLogoModule(),
                SizedBox(height: 50),
                HeaderTextModule(name: "Forgot Password"),
                SizedBox(height: 80),
                ForgotPasswordScreenEmailFieldModule(),
                SizedBox(height: 45),
                SendCodeButtonModule(),
                SizedBox(height: 45),
                CodeTextFieldModule(),
                SizedBox(height: 45),
                ForgotPasswordScreenSubmitButtonModule(),
              ],
            ).commonAllSidePadding(20),
          ),
        ),
      ),
    );
  }
}
