import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/common_widgets.dart';
import '../../controllers/vendor_available_time_screen_controller/vendor_available_time_screen_controller.dart';
import 'vendor_available_time_screen_widgets.dart';

class VendorAvailableTimeScreen extends StatelessWidget {
  VendorAvailableTimeScreen({Key? key}) : super(key: key);
  final vendorAvailableTimeScreenController =
      Get.put(VendorAvailableTimeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> vendorAvailableTimeScreenController.isLoading.value
        ? const CustomCircularLoaderModule()
        : SafeArea(
          child: Column(
            children: [
              const CommonAppBarModule(
                title: "Business Timing",
                appBarOption: AppBarOption.singleBackButtonOption,
              ),
              Expanded(
                child: AvailableTimeFormModule(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
