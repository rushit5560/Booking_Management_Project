import 'dart:developer';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/vendor_invoice_details_screen_controller/vendor_invoice_details_screen_controller.dart';
import '../../../controllers/vendor_invoice_list_screen_controller/vendor_invoice_list_screen_controller.dart';
import 'vendor_invoice_details_screen_widgets.dart';

class VendorInvoiceDetailsScreen extends StatelessWidget {
  VendorInvoiceDetailsScreen({Key? key}) : super(key: key);
  final vendorInvoiceDetailsScreenController =
      Get.put(VendorInvoiceDetailsScreenController());
  // final vendorInvoiceListScreenController = Get.find<VendorInvoiceListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => vendorInvoiceDetailsScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Order Details",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    const SizedBox(height: 10),
                    OrderDetailFormModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
