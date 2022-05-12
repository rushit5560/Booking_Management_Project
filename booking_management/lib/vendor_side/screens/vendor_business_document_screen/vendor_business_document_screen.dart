import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/vendor_business_document_screen/vendor_business_document_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/vendor_business_document_screen_controller/vendor_business_document_screen_controller.dart';

class VendorBusinessDocumentScreen extends StatelessWidget {
  VendorBusinessDocumentScreen({Key? key}) : super(key: key);
  final vendorBusinessDocumentScreenController =
      Get.put(VendorBusinessDocumentScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => vendorBusinessDocumentScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Business Document",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          const AddBusinessDocButtonModule(),
                          const SizedBox(height: 15),
                          Expanded(
                            child: vendorBusinessDocumentScreenController.businessDocumentList.isEmpty
                              ? const Center(child: Text("No data available!"))
                            : BusinessDocumentList()
                                .commonSymmetricPadding(
                                    horizontal: 15, vertical: 15),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
