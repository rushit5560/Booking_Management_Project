import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/vendor_side/controllers/vendor_subscription_report_screen_controller/vendor_subscription_report_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'vendor_subscription_report_screen_widgets.dart';

class VendorSubscriptionReportScreen extends StatelessWidget {
  VendorSubscriptionReportScreen({Key? key}) : super(key: key);
  final vendorSubscriptionReportScreenController =
      Get.put(VendorSubscriptionReportScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => vendorSubscriptionReportScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Subscription Report",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    Expanded(child: SubscriptionReportListModule()),
                  ],
                ),
              ),
      ),
    );
  }
}
