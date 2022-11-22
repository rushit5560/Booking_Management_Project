import 'dart:developer';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
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

                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 8,
                            color: Colors.grey.shade300,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: appointmentReportScreenController.searchFieldController,
                        cursorColor: Colors.grey,
                        onChanged: (value) {
                          if(appointmentReportScreenController.searchFieldController.text == ""){
                            appointmentReportScreenController.appointmentReportSearchList.clear();
                            log('Search List = ${appointmentReportScreenController.appointmentReportSearchList}');
                          }
                          appointmentReportScreenController.loadUI();
                        },
                        decoration: InputDecoration(
                          hintText: 'Search using customer name',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 14),

                          suffixIcon: appointmentReportScreenController.searchFieldController.text == ""
                              ? null
                              : IconButton(
                            icon: const Icon(Icons.search_rounded),
                            color: Colors.grey,
                            iconSize: 20,
                            onPressed: () {

                              if(appointmentReportScreenController.searchFieldController.text != "") {
                                appointmentReportScreenController.appointmentReportSearchList.clear();

                                String searchText = appointmentReportScreenController.searchFieldController.text;
                                for (int i = 0; i < appointmentReportScreenController.appointmentReportList.length; i++) {
                                  if (appointmentReportScreenController.appointmentReportList[i].firstName.contains(searchText)) {
                                    appointmentReportScreenController.appointmentReportSearchList.add(appointmentReportScreenController.appointmentReportList[i]);
                                  }
                                }
                              } /*else if(invoiceReportScreenController.searchFieldController.text == ""){
                                invoiceReportScreenController.searchInvoiceReportList.clear();
                                log('Search List = ${invoiceReportScreenController.searchInvoiceReportList}');
                              }*/

                              appointmentReportScreenController.loadUI();
                            },
                          ),

                        ),
                      ),
                    ).commonSymmetricPadding(horizontal: 15, vertical: 10),

                    Expanded(
                      child: appointmentReportScreenController.appointmentReportSearchList.isEmpty
                          ? AppointmentReportListModule()
                          : AppointmentReportSearchListModule(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
