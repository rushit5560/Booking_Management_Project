import 'package:booking_management/vendor_side/controllers/privacy_policy_screen_controller/privacy_policy_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_colors.dart';

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
            const SizedBox(height: 20),
            // Text(
            //   screenController.pageTitle,
            //   style: TextStyle(
            //     color: AppColors.blackColor,
            //     fontSize: 17,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
            // const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Html(data: screenController.pageDescription),

              // Text(
              //   screenController.pageDescription,
              //   textAlign: TextAlign.justify,
              //   style: TextStyle(
              //     color: AppColors.blackColor,
              //     fontSize: 15,
              //     fontWeight: FontWeight.w400,
              //     height: 1.5,
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
