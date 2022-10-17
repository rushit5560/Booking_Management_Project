import 'dart:developer';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_card_payment_sceen_controller/user_card_payment_sceen_controller.dart';
import 'package:booking_management/vendor_side/screens/vendor_wallet_screen/vendor_wallet_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../../common_ui/commom_widgets/common_dialogs/alert_dialog.dart';

class UserCardPaymentScreen extends StatefulWidget {
  const UserCardPaymentScreen({Key? key}) : super(key: key);

  @override
  State<UserCardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<UserCardPaymentScreen> {
  final cardScreenController = Get.put(UserCardPaymentScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return const CustomAlertDialog();
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: Obx(
          () => cardScreenController.isLoading.value
              ? const CustomCircularLoaderModule()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customAppbar(),
                        const SizedBox(
                          height: 20,
                        ),
                        showPaymentSummaryWidget(context),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  showPaymentSummaryWidget(BuildContext context) {
    var bookPrice = int.parse(cardScreenController.bookingPrice);
    int adminPrice = cardScreenController.calculateAdminCharges(bookPrice);
    int userPrice = bookPrice - adminPrice;

    // int adminCharges =
    //     cardScreenController.calculateAdminCharges(bookPrice.toInt());

    // int userAmountToPay = bookPrice.toInt() - adminCharges;

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
              "Service price amount",
              style: TextStyle(
                color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "${cardScreenController.payCurrencySymbol} $userPrice",
              style: TextStyle(
                color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Padding(
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
                "${cardScreenController.payCurrencySymbol} $adminPrice",
                style: TextStyle(
                  color: AppColors.colorGreyIconLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total amount",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "${cardScreenController.payCurrencySymbol} ${bookPrice.toString()}",
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
            var uPrice = userPrice * 100;
            var aPrice = adminPrice * 100;

            log("user price : $uPrice");
            log("admin price : $aPrice");

            await cardScreenController.initPaymentSheet(
              context: context,
              adminFeesAmount: aPrice,
              userPayingAmount: uPrice,
            );
          },
          child: const Text("Proceed to Pay"),
          style: ElevatedButton.styleFrom(
              primary: AppColors.accentColor,
              fixedSize: Size(Get.size.width, 50),
              textStyle: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              )),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 20, vertical: 10);
  }

  customAppbar() {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          color: AppColors.accentColor
          //color: Colors.grey
          ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftSideButton(),
            Row(
              children: [
                Text(
                  "Payment",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            rightSideButton(),
          ],
        ),
      ),
    );
  }

  Widget leftSideButton() {
    return GestureDetector(
      onTap: () => showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return const CustomAlertDialog();
        },
      ),
      child: SizedBox(
        height: 50,
        width: 50,
        child: Image.asset(AppImages.backArrowImg),
      ),
    );
  }

  Widget rightSideButton() {
    return const SizedBox(
      height: 50,
      width: 50,
    );
  }
}
