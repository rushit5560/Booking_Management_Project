import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_appointment_details_screen_controller/user_appointment_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_appointment_details_screen_widgets.dart';


class UserAppointmentDetailsScreen extends StatelessWidget {
  UserAppointmentDetailsScreen({Key? key}) : super(key: key);
  final userAppointmentDetailsScreenController
  = Get.put(UserAppointmentDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => userAppointmentDetailsScreenController.isLoading.value
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
                        UserVendorDetailsModule(),
                        const Divider(thickness: 1)
                            .commonSymmetricPadding(horizontal: 10),
                        UserBookingDetailsModule(),
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
