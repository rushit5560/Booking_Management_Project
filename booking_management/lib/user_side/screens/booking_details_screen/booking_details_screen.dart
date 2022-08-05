import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/booking_details_screen_controller/booking_details_screen_controller.dart';
import 'package:booking_management/user_side/screens/booking_details_screen/booking_details_screen_widgets.dart';
import 'package:booking_management/vendor_side/controllers/appointment_details_screen_controller/appointment_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingDetailsScreen extends StatelessWidget {
  BookingDetailsScreen({Key? key}) : super(key: key);
  final screenController = Get.put(BookingDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => screenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Details",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(),
                          ),
                          child: Column(
                            children: [
                              VendorDetailsModule(),
                              const Divider(thickness: 1)
                                  .commonSymmetricPadding(horizontal: 10),
                              BookingDetailsModule(),
                            ],
                          ),
                        ).commonAllSidePadding(10),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
