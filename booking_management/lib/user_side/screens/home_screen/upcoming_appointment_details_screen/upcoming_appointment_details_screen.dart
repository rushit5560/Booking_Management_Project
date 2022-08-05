import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_screen_controller/home_screen_controller.dart';
import 'upcoming_appointment_details_screen_widgets.dart';

class UpcomingAppointmentDetailsScreen extends StatelessWidget {
  UpcomingAppointmentDetailsScreen({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => screenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Details",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(),
                          ),
                          child: Column(
                            children: [
                              VendorDetailsModule(),
                              const Divider(thickness: 1)
                                  .commonSymmetricPadding(horizontal: 10),
                              BookingDetailsModule(),
                            ],
                          ),
                        ).commonAllSidePadding(10),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
