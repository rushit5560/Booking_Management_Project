import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/review_screen_controller/review_screen_controller.dart';
import 'review_screen_widgets.dart';


class ReviewScreen extends StatelessWidget {
  ReviewScreen({Key? key}) : super(key: key);
  final reviewScreenController = Get.put(ReviewScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(
                title: "Review",
                appBarOption: AppBarOption.singleBackButtonOption),
            Expanded(
              child: reviewScreenController.reviewList.isEmpty
                  ? const Center(child: Text("No Data Available!"))
                  : ReviewListModule(),
            ).commonSymmetricPadding(horizontal: 15, vertical: 15)
          ],
        ),
      ),
    );
  }
}
