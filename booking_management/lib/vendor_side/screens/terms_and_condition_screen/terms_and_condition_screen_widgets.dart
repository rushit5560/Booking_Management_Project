import 'package:booking_management/vendor_side/controllers/terms_and_condition_screen_controller/terms_and_condition_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class TermsAndConditionWidget extends StatelessWidget {
  TermsAndConditionWidget({Key? key}) : super(key: key);

  final screenController = Get.find<TermsAndConditionScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        child: Column(
          children: [
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
              child: Html(
                data: screenController.pageDescription,
              ),

              //  Text(
              //   "${screenController.pageDescription}",
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
