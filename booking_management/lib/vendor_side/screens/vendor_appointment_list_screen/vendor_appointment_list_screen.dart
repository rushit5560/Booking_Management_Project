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

            SearchAppointmentField().commonSymmetricPadding(horizontal: 45, vertical: 40),
            const AppointmentListTextModule().commonSymmetricPadding(horizontal: 20),
            Obx(
              ()=> vendorAppointmentListScreenController.isLoading.value
                  ? const Center(child: CircularProgressIndicator()) :
                  Expanded(
                child: vendorAppointmentListScreenController.selectedTabIndex.value == 1
                    ? const AllAppointmentListModule()
                : vendorAppointmentListScreenController.selectedTabIndex.value == 2
                ? const VendorPendingAppointmentListModule()
                : vendorAppointmentListScreenController.selectedTabIndex.value == 3
                ? const ConfirmAppointmentListModule()
                : vendorAppointmentListScreenController.selectedTabIndex.value ==4
                      ? const CancelAppointmentListModule()
                : DoneAppointmentListModule(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
