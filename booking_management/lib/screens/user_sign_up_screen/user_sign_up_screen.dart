import 'package:booking_management/common/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_widgets.dart';
import '../../controllers/user_sign_up_screen_controller/user_sign_up_screen_controller.dart';
import 'user_sign_up_screen_widgets.dart';

class UserSignUpScreen extends StatelessWidget {
  UserSignUpScreen({Key? key}) : super(key: key);
  final userSignUpScreenController = Get.put(UserSignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // From Common Widgets
              const HeaderLogoModule(),
              const SizedBox(height: 20),
              // From Common Widgets
              const HeaderTextModule(name: "SignUp"),
              const SizedBox(height: 20),
              const NameFieldModule(),
              const SizedBox(height: 5),
              const EmailFieldModule(),
              const SizedBox(height: 5),
              const MobileFieldModule(),
              const SizedBox(height: 5),
              const AddressFieldModule(),
              const SizedBox(height: 5),
              const PasswordFieldModule(),
              const SizedBox(height: 5),
              // DOB & Country Module
              Row(
                children: const  [
                  Expanded(
                    child: DOBFieldModule(),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CountryFieldModule(),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              // State & City Module
              Row(
                children: const  [
                  Expanded(
                    child: StateFieldModule(),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CityFieldModule(),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const SignUpButtonModule(),
              const SizedBox(height: 25),
              const VendorSignUpTextModule(),
              const SizedBox(height: 15),
              const SignInTextModule(),
              const SizedBox(height: 5),
            ],
          ).commonAllSidePadding(20),
        ),
      ),
    );
  }
}
