import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../controllers/appointment_report_screen_controller/appointment_report_screen_controller.dart';
import 'appointment_report_screen_widgets.dart';

class AppointmentReportScreen extends StatelessWidget {
  AppointmentReportScreen({Key? key}) : super(key: key);
  final appointmentReportScreenController =
      Get.put(AppointmentReportScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => appointmentReportScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Appointment Report",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    StatusDropDownModule(),

                    /// Select Start Date Module
                    // StartDateSelectModule(),
                    // appointmentReportScreenController.isStartDateCalenderShow.value
                    //     ? SelectStartDateCalender()
                    //     : Container(),

                    // const SizedBox(height: 10),

                    // /// Select End Date Module
                    // EndDateSelectModule(),
                    // appointmentReportScreenController.isEndDateCalenderShow.value
                    //     ? SelectEndDateCalender()
                    //     : Container(),

                    // const SizedBox(height: 15),
                    // // Row(
                    // //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // //   mainAxisSize: MainAxisSize.max,
                    // //   children: [
                    // //     // ExcelButton(),
                    // //     SubmitButton(),
                    // //   ],
                    // // ),
                    // SubmitButton(),

                    Expanded(
                      child: AppointmentReportListModule(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
