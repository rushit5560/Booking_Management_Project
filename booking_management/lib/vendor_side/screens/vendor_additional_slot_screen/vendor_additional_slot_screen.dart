import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/vendor_additional_slot_screen_controller/vendor_additional_slot_screen_controller.dart';
import 'vendor_additional_slot_screen_widgets.dart';

class VendorAdditionalSlotScreen extends StatelessWidget {
  VendorAdditionalSlotScreen({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController =
      Get.put(VendorAdditionalSlotScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => vendorAdditionalSlotScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Additional Slot",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: Column(
                        children: [
                          const AddAdditionalSlotButton(),
                          const SizedBox(height: 15),
                          Expanded(
                            child: vendorAdditionalSlotScreenController
                                    .allAdditionalSlotList.isEmpty
                                ? const Center(child: Text("No Data Available"))
                                : AdditionalSlotListModule(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
