import 'dart:developer';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
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
                        controller: invoiceReportScreenController.searchFieldController,
                        cursorColor: Colors.grey,
                        onChanged: (value) {
                          if(invoiceReportScreenController.searchFieldController.text == ""){
                            invoiceReportScreenController.searchInvoiceReportList.clear();
                            log('Search List = ${invoiceReportScreenController.searchInvoiceReportList}');
                          }
                          invoiceReportScreenController.loadUI();
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 14),

                          suffixIcon: invoiceReportScreenController.searchFieldController.text == ""
                              ? null
                              : IconButton(
                            icon: const Icon(Icons.search_rounded),
                            color: Colors.grey,
                            iconSize: 20,
                            onPressed: () {

                              if(invoiceReportScreenController.searchFieldController.text != "") {
                                invoiceReportScreenController.searchInvoiceReportList.clear();

                                String searchText = invoiceReportScreenController.searchFieldController.text.trim();
                                for (int i = 0; i < invoiceReportScreenController.invoiceReportList.length; i++) {
                                  if (invoiceReportScreenController.invoiceReportList[i].fullName.contains(searchText)
                                      || invoiceReportScreenController.invoiceReportList[i].email.contains(searchText)
                                      || invoiceReportScreenController.invoiceReportList[i].invoiceId.toString().contains(searchText)) {
                                    invoiceReportScreenController.searchInvoiceReportList.add(invoiceReportScreenController.invoiceReportList[i]);
                                  }
                                }

                                log('searchInvoiceReportList : ${invoiceReportScreenController.searchInvoiceReportList.length}');
                              } else if(invoiceReportScreenController.searchFieldController.text == ""){
                                invoiceReportScreenController.searchInvoiceReportList.clear();
                                log('Search List = ${invoiceReportScreenController.searchInvoiceReportList}');
                              }

                              invoiceReportScreenController.loadUI();
                            },
                          ),

                        ),
                      ),
                    ).commonSymmetricPadding(horizontal: 15, vertical: 10),

                    Expanded(child: invoiceReportScreenController.searchInvoiceReportList.isEmpty
                        ? AppointmentReportListModule()
                    : AppointmentReportSearchListModule() ),
                  ],
                ),
              ),
      ),
    );
  }
}
