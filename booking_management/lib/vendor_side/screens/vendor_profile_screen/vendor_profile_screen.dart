import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/vendor_profile_screen_controller/vendor_profile_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/vendor_profile_screen/vendor_profile_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorProfileScreen extends StatelessWidget {
  VendorProfileScreen({Key? key}) : super(key: key);

  final vendorProfileScreenController = Get.put(VendorProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBarModule(title: "Profile", appBarOption: AppBarOption.singleBackButtonOption),

            Expanded(
              child: Obx(()=>
              vendorProfileScreenController.isLoading.value ?
                  const Center(child: CircularProgressIndicator()):
                 SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VendorProfileDetailsModule(),
                      // SizedBox(height: 20,),
                      // DateScheduleModule(),
                      // SizedBox(height: 20,),
                      // TimeSlots()
                    ],
                  ).commonAllSidePadding(20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
