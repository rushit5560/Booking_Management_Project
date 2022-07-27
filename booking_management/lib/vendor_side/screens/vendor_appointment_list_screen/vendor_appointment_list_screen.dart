import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../controllers/vendor_appointment_list_screen_controller/vendor_appointment_list_screen_controller.dart';
import 'vendor_appointment_list_screen_widgets.dart';

class VendorAppointmentListScreen extends StatelessWidget {
  VendorAppointmentListScreen({Key? key}) : super(key: key);
  final vendorAppointmentListScreenController =
      Get.put(VendorAppointmentListScreenController());

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
            const SizedBox(height: 10),

            // SearchAppointmentField().commonSymmetricPadding(horizontal: 45, vertical: 40),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    AppointmentListTextModule()
                        .commonSymmetricPadding(horizontal: 20),
                    Obx(
                      () => vendorAppointmentListScreenController
                              .isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : vendorAppointmentListScreenController
                                      .selectedTabIndex.value ==
                                  1
                              ? AllAppointmentListModule()
                              /*: vendorAppointmentListScreenController
                                          .selectedTabIndex.value ==
                                      2
                                  ? PendingAppointmentListModule()*/
                                  : vendorAppointmentListScreenController
                                              .selectedTabIndex.value ==
                                          3
                                      ? ConfirmAppointmentListModule()
                                      : vendorAppointmentListScreenController
                                                  .selectedTabIndex.value ==
                                              4
                                          ? CancelAppointmentListModule()
                                          : vendorAppointmentListScreenController
                                                      .selectedTabIndex.value ==
                                                  5
                                              ? DoneAppointmentListModule()
                                              : Container(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
