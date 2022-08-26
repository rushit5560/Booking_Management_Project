import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/vendor_appointment_list_screen_controller/vendor_appointment_list_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/appointment_details_screen_controller/appointment_details_screen_controller.dart';
import 'appointment_details_screen_widgets.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  AppointmentDetailsScreen({Key? key}) : super(key: key);
  final appointmentDetailsScreenController =
      Get.put(AppointmentDetailsScreenController());
  final vendorAppointmentListScreenController =
  Get.put(VendorAppointmentListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => appointmentDetailsScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Details",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              // UserImageModule(),
                              // Expanded(child: UserDetailsModule()),
                              CustomerDetailsModule(),
                              const Divider(thickness: 1),
                              ServiceDetailsModule(),
                            ],
                          ).commonAllSidePadding(15),
                          Positioned(
                            bottom: 40,
                            // right: 40,
                            child: appointmentDetailsScreenController.appointmentDetailsData.status == "Pending"
                                ? SizedBox(
                                  height: 50,
                                  width: Get.width,
                                  child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: ConfirmAppointmentButtonModule().commonSymmetricPadding(horizontal: 15)),
                                        Expanded(child: CancelAppointmentButtonModule().commonSymmetricPadding(horizontal: 15)),
                                      ],
                                    ),
                                )
                                : appointmentDetailsScreenController.appointmentDetailsData.status == "Confirm"
                            ? SizedBox(
                              height: 50,
                              width: Get.width,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: DoneAppointmentButtonModule().commonSymmetricPadding(horizontal: 15)),
                                  Expanded(child: CancelAppointmentButtonModule().commonSymmetricPadding(horizontal: 15)),
                                ],
                              ),
                            )
                            : Container(),
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
