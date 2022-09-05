import 'dart:async';
import 'dart:developer';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
// import 'package:credit_card_field/credit_card_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../../common_ui/commom_widgets/common_dialogs/alert_dialog.dart';
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
          () => SafeArea(
            child: cardScreenController.isLoading.value
                ? const CustomCircularLoaderModule()
                : SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customAppbar(),
                        const SizedBox(height: 20),
                        cardFormView(cardScreenController),
                        showPaymentSummaryWidget(context),
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

  cardFormView(VendorCardPaymentScreenController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Form(
        key: controller.cardFormKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: false,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Card Number",
              ),
              controller: controller.creditCardController,
              maxLength: 16,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter card number";
                }
              },
              obscureText: false,
            ),
            const SizedBox(height: 8),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              controller: controller.cvvController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Card Expiry Date",
              ),
              onChanged: (value) {
                setState(() {
                  value = value.replaceAll(RegExp(r"\D"), "");
                  switch (value.length) {
                    case 0:
                      controller.cvvController.text = "MM/YY";
                      controller.cvvController.selection =
                          const TextSelection.collapsed(offset: 0);
                      break;
                    case 1:
                      controller.cvvController.text = "${value}M/YY";
                      controller.cvvController.selection =
                          const TextSelection.collapsed(offset: 1);
                      break;
                    case 2:
                      controller.cvvController.text = "$value/YY";
                      controller.cvvController.selection =
                          const TextSelection.collapsed(offset: 2);
                      break;
                    case 3:
                      controller.cvvController.text =
                          "${value.substring(0, 2)}/${value.substring(2)}Y";
                      controller.cvvController.selection =
                          const TextSelection.collapsed(offset: 4);
                      break;
                    case 4:
                      controller.cvvController.text =
                          "${value.substring(0, 2)}/${value.substring(2, 4)}";
                      controller.cvvController.selection =
                          const TextSelection.collapsed(offset: 5);
                      break;
                  }
                  if (value.length > 4) {
                    controller.cvvController.text =
                        "${value.substring(0, 2)}/${value.substring(2, 4)}";
                    controller.cvvController.selection =
                        const TextSelection.collapsed(offset: 5);
                  }
                });
              },
              cursorWidth: 0.0,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter expiry date";
                }
              },
              obscureText: false,
            ),
            const SizedBox(height: 12),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: false,
              ),
              maxLength: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Card cvv Number",
              ),
              controller: controller.expirationController,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter cvv number";
                }
              },
              obscureText: false,
            ),
          ],
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
        const SizedBox(height: 25),
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
        const SizedBox(height: 15),
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
            var isValidate =
                cardScreenController.cardFormKey.currentState!.validate();

            if (isValidate) {
              await cardScreenController.proceedForVendorSubscription();
            }
          },
          child: const Text("Proceed to Pay"),
          style: ElevatedButton.styleFrom(
              primary: AppColors.accentColor,
              fixedSize: Size(Get.size.width, 50),
              textStyle: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 20, vertical: 10);
  }
}
