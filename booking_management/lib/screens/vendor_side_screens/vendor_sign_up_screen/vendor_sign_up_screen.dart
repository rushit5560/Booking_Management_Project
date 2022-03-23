import 'package:booking_management/common/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../controllers/vendor_sign_up_screen_controller/vendor_sign_up_screen_controller.dart';
import 'vendor_sign_up_screen_widgets.dart';

class VendorSignUpScreen extends StatelessWidget {
  VendorSignUpScreen({Key? key}) : super(key: key);
  final vendorSignUpScreenController = Get.put(VendorSignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: vendorSignUpScreenController.vendorSignUpFormKey,
            child: Column(
              children: const [
                // From Common Widgets
                HeaderLogoModule(),
                SizedBox(height: 20),
                // From Common Widgets
                HeaderTextModule(name: "Sign Up"),
                SizedBox(height: 20),

                AddPhotosModule(),
                SizedBox(height: 12),
                PhotoTextModule(),
                SizedBox(height: 20),
                BusinessNameFieldModule(),
                SizedBox(height: 5),
                EmailFieldModule(),
                SizedBox(height: 5),
                MobileFieldModule(),
                SizedBox(height: 5),
                BusinessAddressFieldModule(),
                SizedBox(height: 5),
                BusinessIdFieldModule(),
                SizedBox(height: 5),
                PasswordFieldModule(),
                SizedBox(height: 5),
                ConfirmPasswordFieldModule(),
                SizedBox(height: 20),

                VendorSignUpButtonModule(),
                SizedBox(height: 20),

                CustomerSignUpTextModule(),
                SizedBox(height: 15),
                VendorSignInTextModule(),
                SizedBox(height: 5),

              ],
            ).commonAllSidePadding(20),
          ),
        ),
      ),
    );
  }
}
