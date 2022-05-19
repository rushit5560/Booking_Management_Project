import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/booking_success_screen_controller/booking_success_screen_controller.dart';
import 'booking_success_screen_widgets.dart';

class BookingSuccessScreen extends StatelessWidget {
  BookingSuccessScreen({Key? key}) : super(key: key);
  final bookingSuccessScreenController = Get.put(BookingSuccessScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> bookingSuccessScreenController.isLoading.value
          ? const CustomCircularLoaderModule()
        : SafeArea(
          child: Column(
            children: [
              const CommonAppBarModule(title: "Success", appBarOption: AppBarOption.none),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const RoundCorrectModule(),
                      const SizedBox(height: 10),
                      const BookedSuccessfullyModule(),
                      const SizedBox(height: 10),
                      BookingDetailsModule(),
                      const SizedBox(height: 20),
                      ButtonsModule(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
