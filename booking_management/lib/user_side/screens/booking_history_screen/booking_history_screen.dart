import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_booking_history_screen_controller/user_booking_history_screen_controller.dart';
import 'package:booking_management/user_side/screens/booking_history_screen/booking_history_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingHistoryScreen extends StatelessWidget {
  BookingHistoryScreen({Key? key}) : super(key: key);

  final userBookingHistoryScreenController =
      Get.put(UserBookingHistoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonAppBarModule(
                title: "Booking History",
                appBarOption: AppBarOption.singleBackButtonOption),
            Expanded(
              child: Obx(
                () => userBookingHistoryScreenController.isLoading.value
                    ? const CustomCircularLoaderModule()
                    : userBookingHistoryScreenController.historyList.isEmpty
                        ? const Center(child: Text("No Data Available"))
                        : BookingHistoryList().commonAllSidePadding(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
