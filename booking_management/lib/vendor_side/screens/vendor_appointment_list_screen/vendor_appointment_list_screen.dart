import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../controllers/vendor_appointment_list_screen_controller/vendor_appointment_list_screen_controller.dart';
import '../vendor_home_screen/vendor_home_screen_widgets.dart';
import 'vendor_appointment_list_screen_widgets.dart';

class VendorAppointmentListScreen extends StatelessWidget {
  VendorAppointmentListScreen({Key? key}) : super(key: key);
  final vendorAppointmentListScreenController = Get.put(VendorAppointmentListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(
              title: 'Appointment list',
              appBarOption: AppBarOption.none,
            ),

            const SearchAppointmentField().commonSymmetricPadding(horizontal: 45, vertical: 40),
            const AppointmentListTextModule().commonSymmetricPadding(horizontal: 25),
            Obx(
              ()=> Expanded(
                child: vendorAppointmentListScreenController.selectedTabIndex.value == 1
                    ? const AllAppointmentListModule(count: 10)
                : vendorAppointmentListScreenController.selectedTabIndex.value == 2
                ? const AllAppointmentListModule(count: 5)
                : vendorAppointmentListScreenController.selectedTabIndex.value == 3
                ? const AllAppointmentListModule(count: 7)
                : const AllAppointmentListModule(count: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}