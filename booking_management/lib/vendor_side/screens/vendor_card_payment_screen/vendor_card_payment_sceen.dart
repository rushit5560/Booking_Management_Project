import 'dart:async';
import 'dart:developer';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../../user_side/model/vendor_details_screen_models/country_model.dart';
import '../../controllers/vendor_card_payment_sceen_controller/vendor_card_payment_sceen_controller.dart';
import '../../controllers/vendor_subscription_plan_screen_controller/vendor_subscription_plan_screen_controller.dart';

class VendorCardPaymentScreen extends StatefulWidget {
  const VendorCardPaymentScreen({Key? key}) : super(key: key);

  @override
  State<VendorCardPaymentScreen> createState() =>
      _VendorCardPaymentScreenState();
}

class _VendorCardPaymentScreenState extends State<VendorCardPaymentScreen> {
  final cardScreenController = Get.put(VendorCardPaymentScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: cardScreenController.isLoading.value
              ? const CustomCircularLoaderModule()
              : SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonAppBarModule(
                        title: "Payment Checkout",
                        appBarOption: AppBarOption.singleBackButtonOption,
                      ),
                      const SizedBox(height: 20),
                      showPaymentSummaryWidget(context),
                    ],
                  ),
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
            cardScreenController.isLoading(true);
            final vendorSubscriptionPlanScreenController =
                Get.find<VendorSubscriptionPlanScreenController>();
            await vendorSubscriptionPlanScreenController
                .purchaseSubscriptionPlanFunction(
              productId: cardScreenController.bookingSubId,
            );
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
