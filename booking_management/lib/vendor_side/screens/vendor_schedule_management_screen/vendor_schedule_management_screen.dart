import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/vendor_side/controllers/vendor_schedule_management_screen_controller/vendor_schedule_management_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/vendor_schedule_management_screen/vendor_schedule_management_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorScheduleManagementScreen extends StatelessWidget {
  VendorScheduleManagementScreen({Key? key}) : super(key: key);

  final vendorScheduleManagementScreenController =
  Get.put(VendorScheduleManagementScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            ()=> vendorScheduleManagementScreenController.isLoading.value
          ? const CustomCircularLoaderModule():
         SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonAppBarModule(
                  title: "Schedule Management",
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),

                SizedBox(height: 15),
                ScheduleMangementText(),
                SizedBox(height: 15),

                /// Select Start Date Module
                StartDateSelectModule(),
                vendorScheduleManagementScreenController.isStartDateCalenderShow.value
                    ? SelectStartDateCalender()
                    : Container(),

                const SizedBox(height: 10),

                /// Select End Date Module
                EndDateSelectModule(),
                vendorScheduleManagementScreenController.isEndDateCalenderShow.value
                    ? SelectEndDateCalender()
                    : Container(),

                const SizedBox(height: 15),
                SubmitButton(),

                SizedBox(height: 10),

                /// Search schedule Timing module
                SearchScheduleTimingText(),
                SizedBox(height: 10),
                SearchScheduleTimingModule(),
                vendorScheduleManagementScreenController.isScheduleTimingCalenderShow.value
                    ? ScheduleTimingCalender()
                    : Container(),

                const SizedBox(height: 15),
                SearchScheduleSubmitButton(),
                const SizedBox(height: 15),

                ResourceScheduleListModule()



              ],
            ),
          ),
        ),
      ),
    );
  }
}
