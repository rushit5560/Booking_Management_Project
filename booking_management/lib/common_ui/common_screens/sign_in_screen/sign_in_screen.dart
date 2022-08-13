import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_functions.dart';
import '../../../common_modules/common_widgets.dart';
import '../../common_controller/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'sign_in_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(
          () => signInScreenController.isLoading.value
              ? const CustomCircularLoaderModule()
              : SafeArea(
                  child: Form(
                    key: signInScreenController.signInFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// From Common Widgets
                        const HeaderLogoModule(),
                        const SizedBox(height: 20),

                        /// From Common Widgets
                        // const HeaderTextModule(name: "Welcome \nBack"),
                        // const SizedBox(height: 20),
                        EmailFieldModule(),
                        const SizedBox(height: 5),
                        PasswordFieldModule(),
                        const SizedBox(height: 10),
                        const ForgotPasswordTextModule(),
                        const SizedBox(height: 40),
                        SignInButtonModule(),
                        // const SizedBox(height: 20),
                        // const OrTextModule(),
                        // const SizedBox(height: 15),
                        // SocialMediaLoginModule(signInScreenController: signInScreenController),
                        const SizedBox(height: 40),
                        const SignUpTextModule(),
                        const SizedBox(height: 10),
                        const SignInSkipButton(),
                        const SizedBox(height: 10),
                      ],
                    ).commonAllSidePadding(20),
                  ),
                ),
        ),
      ),
    );
  }
}
