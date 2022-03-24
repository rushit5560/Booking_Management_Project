import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/common_widgets.dart';
import '../../common_controller/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'sign_in_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: signInScreenController.signInFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // From Common Widgets
              HeaderLogoModule(),
              SizedBox(height: 20),
              // From Common Widgets
              HeaderTextModule(name: "Welcome \nBack"),
              SizedBox(height: 20),
              EmailFieldModule(),
              SizedBox(height: 5),
              PasswordFieldModule(),
              SizedBox(height: 10),
              ForgotPasswordTextModule(),
              SizedBox(height: 40),
              SignInButtonModule(),
              SizedBox(height: 20),
              OrTextModule(),
              SizedBox(height: 15),
              SocialMediaLoginModule(),
              SizedBox(height: 40),
              SignUpTextModule(),
              SizedBox(height: 10),
            ],
          ).commonAllSidePadding(20),
        ),
      ),
    );
  }
}