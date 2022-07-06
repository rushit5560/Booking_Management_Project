import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_widgets.dart';
import '../../controllers/vendor_invoice_list_screen_controller/vendor_invoice_list_screen_controller.dart';
import 'vendor_invoice_list_screen_widgets.dart';

class VendorInvoiceListScreen extends StatelessWidget {
  VendorInvoiceListScreen({Key? key}) : super(key: key);
  final vendorInvoiceListScreenController =
      Get.put(VendorInvoiceListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> vendorInvoiceListScreenController.isLoading.value
        ? const CustomCircularLoaderModule()
        : SafeArea(
          child: Column(
            children: [
              const CommonAppBarModule(
                title: "Invoices",
                appBarOption: AppBarOption.singleBackButtonOption,
              ),
              Expanded(
                child: vendorInvoiceListScreenController.allInvoiceList.isEmpty
                    ? const Center(child: Text("No Data Available!"))
                    : OrderListModule()
                        .commonSymmetricPadding(horizontal: 15, vertical: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
