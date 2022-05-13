import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/vendor_my_customer_list_screen_controller/vendor_my_customer_list_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/my_customer_screen/my_customer_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCustomerScreen extends StatelessWidget {
  MyCustomerScreen({Key? key}) : super(key: key);
  final vendorMyCustomerScreenController =
      Get.put(VendorMyCustomerScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => vendorMyCustomerScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                        title: "My Customer",
                        appBarOption: AppBarOption.singleBackButtonOption),
                    Expanded(
                      child: vendorMyCustomerScreenController.allCustomerList.isEmpty
                          ? const Center(child: Text("No Data Available!"))
                          : CustomerList().commonSymmetricPadding(
                              horizontal: 15,
                              vertical: 15,
                            ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
