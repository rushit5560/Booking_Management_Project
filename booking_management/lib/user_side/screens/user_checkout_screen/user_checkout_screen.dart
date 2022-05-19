import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_checkout_screen_controller/user_checkout_screen_controller.dart';
import 'package:booking_management/user_side/screens/user_checkout_screen/user_checkout_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCheckoutScreen extends StatelessWidget {
  UserCheckoutScreen({Key? key}) : super(key: key);

  final userCheckoutScreenController = Get.put(UserCheckoutScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> userCheckoutScreenController.isLoading.value
        ? const CustomCircularLoaderModule()
        : SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonAppBarModule(title: "Checkout", appBarOption: AppBarOption.singleBackButtonOption),
                const SizedBox(height: 20,),
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
                ).commonAllSidePadding(20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
