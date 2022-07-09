import 'package:booking_management/vendor_side/controllers/terms_and_condition_screen_controller/terms_and_condition_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionWidget extends StatelessWidget {
  TermsAndConditionWidget({Key? key}) : super(key: key);

  final screenController = Get.find<TermsAndConditionScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(screenController.pageTitle),

            const SizedBox(height: 15),

            Text(screenController.pageDescription)
          ],
        ),
      ),
    );
  }
}