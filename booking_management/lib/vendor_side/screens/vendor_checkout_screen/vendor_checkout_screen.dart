import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../controllers/vendor_checkout_screen_controller/vendor_checkout_screen_controller.dart';
import 'vendor_checkout_screen_widgets.dart';

class VendorCheckoutScreen extends StatelessWidget {
  VendorCheckoutScreen({Key? key}) : super(key: key);
  final vendorCheckoutScreenController = Get.put(VendorCheckoutScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: "Checkout", appBarOption: AppBarOption.singleBackButtonOption),
            const SizedBox(height: 20),

            Column(
              children: [
                VendorSelectPaymentMethod().commonSymmetricPadding(horizontal: 20, vertical: 10),
                const SizedBox(height: 25),
                PayNowButtonModule(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
