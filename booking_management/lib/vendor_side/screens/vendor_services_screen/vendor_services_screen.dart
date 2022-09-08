import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/vendor_services_screen/vendor_services_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/vendor_services_screen_controller/vendor_services_screen_controller.dart';

class VendorServicesScreen extends StatelessWidget {
  VendorServicesScreen({Key? key}) : super(key: key);
  final vendorServicesScreenController =
      Get.put(VendorServicesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => vendorServicesScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                        title: "Services",
                        appBarOption: AppBarOption.singleBackButtonOption),
                    Expanded(
                      child: Column(
                        children: [
                          const AddServicesButton(),
                          const SizedBox(height: 15),
                          Expanded(
                            child: vendorServicesScreenController
                                    .allResourcesList.isEmpty
                                ? const Center(
                                    child: Text("No Services Available"))
                                : ServicesListModule(),
                          ),
                        ],
                      ).commonSymmetricPadding(horizontal: 15, vertical: 15),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
