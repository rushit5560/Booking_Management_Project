import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_checkout_screen_controller/user_checkout_screen_controller.dart';
import 'package:booking_management/user_side/screens/user_checkout_screen/user_checkout_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../../common_ui/commom_widgets/common_dialogs/alert_dialog.dart';

class UserCheckoutScreen extends StatelessWidget {
  UserCheckoutScreen({Key? key}) : super(key: key);

  final userCheckoutScreenController = Get.put(UserCheckoutScreenController());

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
          () => userCheckoutScreenController.isLoading.value
              ? const CustomCircularLoaderModule()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customAppbar(),
                        // const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SelectPaymentMethod(),
                            BookingSummaryModule(),
                            const SizedBox(height: 10),
                            PersonalInformationFormModule(),
                            const SizedBox(height: 30),
                            ConfirmAndPayButtonModule(),
                          ],
                        ).commonSymmetricPadding(horizontal: 12, vertical: 20),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
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
                  "Checkout",
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
