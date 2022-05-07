import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/customer_review_screen/customer_review_screen_widgets.dart';
import 'package:flutter/material.dart';

class CustomerReviewScreen extends StatelessWidget {
  const CustomerReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: "Review", appBarOption: AppBarOption.singleBackButtonOption),

            Expanded(
              child: Column(
                children: const [
                  Expanded(
                    child: ReviewListModule(),
                  ),
                ],
              ).commonSymmetricPadding(horizontal: 15, vertical: 15),
            )
          ],
        ),
      ),
    );
  }
}
