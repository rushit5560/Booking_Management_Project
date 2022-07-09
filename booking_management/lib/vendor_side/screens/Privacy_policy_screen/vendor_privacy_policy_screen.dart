import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/vendor_side/controllers/privacy_policy_screen_controller/privacy_policy_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/Privacy_policy_screen/vendor_privacy_policy_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorPrivacyPolicyScreen extends StatelessWidget {
   VendorPrivacyPolicyScreen({Key? key}) : super(key: key);

  final vendorPrivacyPolicyScreenController =
  Get.put(PrivacyPolicyScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>
        vendorPrivacyPolicyScreenController.isLoading.value ?
          Center(child: const CircularProgressIndicator()):
          Column(
            children:  [

              const CommonAppBarModule(title: "Privacy Policy", appBarOption: AppBarOption.singleBackButtonOption),

              SizedBox(height: 10),

              PrivacyPolicyWidget()
            ],
          ),
        ),
      ),
    );
  }
}
