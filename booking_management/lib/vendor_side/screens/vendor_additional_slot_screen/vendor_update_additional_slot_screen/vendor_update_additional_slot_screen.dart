import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/vendor_additional_slot_screen_controller/vendor_additional_slot_screen_controller.dart';
import 'vendor_update_additional_slot_screen_widgets.dart';

class VendorUpdateAdditionalSlotScreen extends StatelessWidget {
  VendorUpdateAdditionalSlotScreen({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController = Get.put(VendorAdditionalSlotScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(
              title: "Update Additional Slot",
              appBarOption: AppBarOption.singleBackButtonOption,
            ),

            Expanded(child: UpdateAdditionalFormModule()),
          ],
        ),
      ),
    );
  }
}
