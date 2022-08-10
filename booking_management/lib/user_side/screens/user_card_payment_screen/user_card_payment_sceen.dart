import 'dart:developer';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_card_payment_sceen_controller/user_card_payment_sceen_controller.dart';
import 'package:booking_management/user_side/controllers/user_checkout_screen_controller/user_checkout_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../common_modules/common_widgets.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';

class UserCardPaymentScreen extends StatefulWidget {
  const UserCardPaymentScreen({Key? key}) : super(key: key);

  @override
  State<UserCardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<UserCardPaymentScreen> {
  final cardScreenController = Get.put(UserCardPaymentScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonAppBarModule(
                title: "Payment Details",
                appBarOption: AppBarOption.singleBackButtonOption,
              ),
              const SizedBox(
                height: 20,
              ),
              showPaymentSummaryWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  showPaymentSummaryWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Summary",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "General Inspection",
              style: TextStyle(
                color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "\$ ${cardScreenController.bookingPrice}",
              style: TextStyle(
                color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        UserDetails.roleName == "Customer"
            ? Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Administrative Charges ",
                      style: TextStyle(
                        color: AppColors.colorGreyIconLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "₹ ${(int.parse(cardScreenController.bookingPrice) / 100) * 10}",
                      style: TextStyle(
                        color: AppColors.colorGreyIconLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total ",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "\$ ${cardScreenController.bookingPrice}",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            await cardScreenController.initPaymentSheet(context);
          },
          child: const Text("Procedd to Pay"),
          style: ElevatedButton.styleFrom(
              primary: AppColors.accentColor,
              fixedSize: Size(Get.size.width, 50),
              textStyle: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 20, vertical: 10);
  }
}
