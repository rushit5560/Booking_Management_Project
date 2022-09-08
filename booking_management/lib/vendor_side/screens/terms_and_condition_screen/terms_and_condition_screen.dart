import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/vendor_side/controllers/terms_and_condition_screen_controller/terms_and_condition_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/terms_and_condition_screen/terms_and_condition_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionScreen extends StatelessWidget {
  TermsAndConditionScreen({Key? key}) : super(key: key);

  final termsAndConditionScreenController =
      Get.put(TermsAndConditionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => termsAndConditionScreenController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Terms and Conditions",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    const SizedBox(height: 10),
                    TermsAndConditionWidget()
                  ],
                ),
        ),
      ),
    );
  }
}
