import 'package:booking_management/common_modules/common_functions.dart';
import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/custom_drawer/vendor_drawer/vendor_drawer.dart';
import '../../controllers/vendor_home_screen_controller/vendor_home_screen_controller.dart';
import 'vendor_home_screen_widgets.dart';

class VendorHomeScreen extends StatelessWidget {
  VendorHomeScreen({Key? key}) : super(key: key);
  final vendorHomeScreenController = Get.put(VendorHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        drawer: VendorDrawer(),
        body: Obx(
          () => vendorHomeScreenController.isLoading.value
              ? const CustomCircularLoaderModule()
              : SafeArea(
                  child: Column(
                    children: [
                      VendorHeaderModule(),
                      const SizedBox(height: 10),
                      // SearchAppointmentField().commonSymmetricPadding(horizontal: 45),
                      // const SizedBox(height: 20),
                      PendingListTextModule().commonSymmetricPadding(horizontal: 25),
                      Obx(
                        () => vendorHomeScreenController.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : Expanded(
                                child: TodayAppointmentListModule().commonSymmetricPadding(horizontal: 25),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
