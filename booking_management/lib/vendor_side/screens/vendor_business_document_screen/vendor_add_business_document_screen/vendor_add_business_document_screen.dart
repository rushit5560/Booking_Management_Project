import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/vendor_business_document_screen_controller/vendor_business_document_screen_controller.dart';
import 'vendor_add_business_document_screen_widgets.dart';

class VendorAddBusinessDocumentScreen extends StatelessWidget {
  VendorAddBusinessDocumentScreen({Key? key}) : super(key: key);
  final vendorBusinessDocumentScreenController =
      Get.find<VendorBusinessDocumentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> vendorBusinessDocumentScreenController.isLoading.value
        ? const CustomCircularLoaderModule()
        : SafeArea(
          child: Column(
            children: [
              const CommonAppBarModule(
                title: "Add Business Document",
                appBarOption: AppBarOption.singleBackButtonOption,
              ),
              Expanded(
                child: AddBusinessDocumentFormModule(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
