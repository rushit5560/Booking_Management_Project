import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_change_password_screen_controller/user_change_password_screen_controller.dart';
import 'package:booking_management/user_side/screens/user_change_password_screen/user_change_password_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserChangePasswordScreen extends StatelessWidget {
  UserChangePasswordScreen({Key? key}) : super(key: key);
  final userChangePasswordScreenController =
      Get.put(UserChangePasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => userChangePasswordScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: userChangePasswordScreenController
                        .changePasswordFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // From Common Widgets
                        const BackButtonModule(),
                        const SizedBox(height: 5),
                        const HeaderLogoModule(),
                        const SizedBox(height: 50),
                        const HeaderTextModule(name: "Change Password"),
                        const SizedBox(height: 80),
                        // UserNameModule(),
                        // SizedBox(height: 5),
                        CurrentPasswordTextFieldModule(),
                        const SizedBox(height: 5),
                        NewPasswordTextFieldModule(),
                        const SizedBox(height: 5),
                        ConfirmPasswordTextFieldModule(),
                        const SizedBox(height: 45),
                        SaveButtonModule(),
                      ],
                    ).commonAllSidePadding(20),
                  ),
                ),
              ),
      ),
    );
  }
}
