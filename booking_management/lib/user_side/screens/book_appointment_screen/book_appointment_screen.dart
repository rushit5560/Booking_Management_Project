import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/book_appointment_screen_controller/book_appointment_screen_controller.dart';
import 'book_appointment_screen_widgets.dart';

class BookAppointmentScreen extends StatelessWidget {
  BookAppointmentScreen({Key? key}) : super(key: key);

  final bookAppointmentScreenController =
      Get.put(BookAppointmentScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => bookAppointmentScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CommonAppBarModule(
                      title: "Book Appointment",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    // const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Always Show
                            VendorDetailsModule(),
                            const SizedBox(height: 10),

                            bookAppointmentScreenController.isServiceSlot.value
                                ? Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: CalenderTableModule()),
                                          const SizedBox(width: 25),
                                          SubmitButtonModule(),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      bookAppointmentScreenController
                                              .isServiceCalenderShow.value
                                          ? SelectDateModule()
                                          : Container(),
                                      const SizedBox(height: 15),
                                      BookingServicesListModule(),
                                      const SizedBox(height: 15),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      AdditionalSlotModule(),
                                      const SizedBox(height: 10),
                                    ],
                                  ),

                            /// If Service True then show
                            // bookAppointmentScreenController.isServiceSlot.value
                            //     ? Row(
                            //         children: [
                            //           Expanded(child: CalenderTableModule()),
                            //           const SizedBox(width: 25),
                            //           SubmitButtonModule(),
                            //         ],
                            //       )
                            //     : Container(),
                            // const SizedBox(height: 10),
                            //
                            //
                            // bookAppointmentScreenController.isServiceCalenderShow.value
                            //     ? SelectDateModule()
                            //     : Container(),
                            //
                            // bookAppointmentScreenController.isServiceCalenderShow.value
                            //     ? const SizedBox(height: 10)
                            //     : Container(),
                            //
                            // /// If Service True then show
                            // bookAppointmentScreenController.isServiceSlot.value
                            //     ? BookingServicesListModule()
                            //     : AdditionalSlotModule(),
                            // const SizedBox(height: 10),

                            /// Always Show
                            BookingResourcesListModule(),
                            const SizedBox(height: 40),

                            BookButtonModule(),
                          ],
                        ).commonAllSidePadding(20),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
