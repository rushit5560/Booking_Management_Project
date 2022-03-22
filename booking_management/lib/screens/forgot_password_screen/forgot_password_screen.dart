import 'package:booking_management/common/common_widgets.dart';
import 'package:booking_management/common/extension_methods/extension_methods.dart';
import 'package:booking_management/controllers/forgot_password_screen_controller/forgot_password_screen_controller.dart';
import 'package:booking_management/screens/forgot_password_screen/forgot_password_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              const SizedBox(height: 30),
              const HeaderTextModule(name: "Forgot \nPassword"),
              const SizedBox(height: 30),
              const EmailFieldModule(),
              const SizedBox(height: 45),
              const SendCodeButtonModule(),
              const SizedBox(height: 45),
              CodeTextFieldModule(),
              const SizedBox(height: 45),
              const SubmitButtonModule(),
            ],
          ).commonAllSidePadding(20),
        ),
      ),
    );
  }
}
