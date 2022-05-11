import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/vendor_services_screen_controller/vendor_services_screen_controller.dart';
import 'vendor_update_service_screen_widgets.dart';

class VendorUpdateServiceScreen extends StatelessWidget {
  VendorUpdateServiceScreen({Key? key}) : super(key: key);
  final vendorServicesScreenController = Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: "Update Service", appBarOption: AppBarOption.singleBackButtonOption),

            Expanded(
              child: VendorUpdateServiceFormModule(),
            ),
          ],
        ),
      ),
    );
  }
}
