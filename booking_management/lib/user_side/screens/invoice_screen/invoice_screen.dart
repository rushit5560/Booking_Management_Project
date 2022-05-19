import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../controllers/invoice_screen_controller/invoice_screen_controller.dart';
import 'invoice_screen_widgets.dart';


class InvoiceScreen extends StatelessWidget {
  InvoiceScreen({Key? key}) : super(key: key);
  final invoiceScreenController = Get.put(InvoiceScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> invoiceScreenController.isLoading.value
        ? const CustomCircularLoaderModule()
        : SafeArea(
          child: Column(
            children: [
              const CommonAppBarModule(
                title: "Order Details",
                appBarOption: AppBarOption.singleBackButtonOption,
              ),
              const SizedBox(height: 10),

              Expanded(
                child: Column(
                  children: [
                    OrderInvoiceFormModule(),
                    const SizedBox(height: 20),
                    const ContinueButtonModule(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
