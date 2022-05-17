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

  final bookAppointmentScreenController = Get.put(BookAppointmentScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> bookAppointmentScreenController.isLoading.value
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
                      VendorDetailsModule(),
                      const SizedBox(height: 10),

                      BookingServicesListModule(),

                      const SizedBox(height: 10),
                      BookingResourcesListModule(),

                      // SelectDateModule(),
                      // const SizedBox(height: 25),
                      // SelectTimeModule(),
                      const SizedBox(height: 40),
                      const BookButtonModule(),
                      //SizedBox(height: 30,),
                      //Expanded(child: ResourcesList())
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
