import 'dart:developer';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../controllers/customer_report_screen_controller/customer_report_screen_controller.dart';
import 'customer_report_screen_widgets.dart';

class CustomerReportScreen extends StatelessWidget {
  CustomerReportScreen({Key? key}) : super(key: key);
  final customerReportScreenController = Get.put(CustomerReportScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> customerReportScreenController.isLoading.value
        ? const CustomCircularLoaderModule()
        : SafeArea(
          child: Column(
            children: [
              const CommonAppBarModule(
                title: "My Customer",
                appBarOption: AppBarOption.singleBackButtonOption,
              ),
              StatusDropDownModule(),

              // const SizedBox(height: 15),

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
                  controller: customerReportScreenController.searchFieldController,
                  cursorColor: Colors.grey,
                  onChanged: (value) {
                    if(customerReportScreenController.searchFieldController.text == ""){
                      customerReportScreenController.customerReportSearchList.clear();
                      log('Search List = ${customerReportScreenController.customerReportSearchList}');
                    }
                    customerReportScreenController.loadUI();
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

                    suffixIcon: customerReportScreenController.searchFieldController.text == ""
                        ? null
                        : IconButton(
                      icon: const Icon(Icons.search_rounded),
                      color: Colors.grey,
                      iconSize: 20,
                      onPressed: () {

                        if(customerReportScreenController.searchFieldController.text != "") {
                          customerReportScreenController.customerReportSearchList.clear();

                          String searchText = customerReportScreenController.searchFieldController.text;
                          for (int i = 0; i < customerReportScreenController.customerReportList.length; i++) {
                            if (customerReportScreenController.customerReportList[i].firstName.contains(searchText)
                            || customerReportScreenController.customerReportList[i].email.contains(searchText)
                            || customerReportScreenController.customerReportList[i].id.toString().contains(searchText)) {
                              customerReportScreenController.customerReportSearchList.add(customerReportScreenController.customerReportList[i]);
                            }
                          }
                        }
                        /*else if(invoiceReportScreenController.searchFieldController.text == ""){
                          invoiceReportScreenController.searchInvoiceReportList.clear();
                          log('Search List = ${invoiceReportScreenController.searchInvoiceReportList}');
                        }*/

                        customerReportScreenController.loadUI();
                      },
                    ),

                  ),
                ),
              ).commonSymmetricPadding(horizontal: 15, vertical: 10),

              Expanded(
                      child: customerReportScreenController
                              .customerReportSearchList.isEmpty
                          ? CustomerReportListModule()
                          : CustomerReportSearchListModule(),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
