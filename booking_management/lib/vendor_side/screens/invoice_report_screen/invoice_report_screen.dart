import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../controllers/invoice_report_screen_controller/invoice_report_screen_controller.dart';
import 'invoice_report_screen_widgets.dart';

class InvoiceReportScreen extends StatelessWidget {
  InvoiceReportScreen({Key? key}) : super(key: key);
  final invoiceReportScreenController =
      Get.put(InvoiceReportScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => invoiceReportScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Invoice Report",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    const SizedBox(height: 10),

                    /// Select Start Date Module
                    /*StartDateSelectModule(),
                    invoiceReportScreenController.isStartDateCalenderShow.value
                        ? SelectStartDateCalender()
                        : Container(),*/

                    // const SizedBox(height: 10),

                    /// Select End Date Module
                    /*EndDateSelectModule(),
                    invoiceReportScreenController.isEndDateCalenderShow.value
                        ? SelectEndDateCalender()
                        : Container(),*/

                    // const SizedBox(height: 15),
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
