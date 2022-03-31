import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../user_side/screens/home_screen/home_screen_widgets.dart';
import '../../controllers/vendor_home_screen_controller/vendor_home_screen_controller.dart';
import 'vendor_home_screen_widgets.dart';

class VendorHomeScreen extends StatelessWidget {
  VendorHomeScreen({Key? key}) : super(key: key);
  final vendorHomeScreenController = Get.put(VendorHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeaderModule(),
            const SizedBox(height: 30),

            const SearchAppointmentField().commonSymmetricPadding(horizontal: 45),
            const SizedBox(height: 30),
            const PendingListTextModule().commonSymmetricPadding(horizontal: 25),

            Obx(()=>
              vendorHomeScreenController.isLoading.value
                ? const Center(child: CircularProgressIndicator()) :
            Expanded(child: const PendingAppointmentListModule().commonSymmetricPadding(horizontal: 25)),
            ),
          ],
        ),
      ),
    );
  }
}
