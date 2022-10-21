import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/vendor_side/controllers/vendor_resources_screen_controller/vendor_add_resources_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/vendor_resources_screen/vendor_add_resource_screen/vendor_add_resource_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorAddResourceScreen extends StatelessWidget {
  VendorAddResourceScreen({Key? key}) : super(key: key);
  final vendorAddResourcesScreenController =
      Get.put(VendorAddResourcesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => vendorAddResourcesScreenController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Add Resources",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: AddResourceFormModule(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
