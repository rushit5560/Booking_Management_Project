import 'package:booking_management/vendor_side/controllers/privacy_policy_screen_controller/privacy_policy_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  PrivacyPolicyWidget({Key? key}) : super(key: key);

  final screenController = Get.find<PrivacyPolicyScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(screenController.pageTitle),

            const SizedBox(height: 10),

            Text(screenController.pageDescription)
          ],
        ),
      ),
    );
  }
}
