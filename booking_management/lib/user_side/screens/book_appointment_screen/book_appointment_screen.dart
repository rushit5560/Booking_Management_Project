import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/book_appointment_screen_controller/book_appointment_screen_controller.dart';
import 'book_appointment_screen_widgets.dart';

class BookAppointMentScreen extends StatelessWidget {
  BookAppointMentScreen({Key? key}) : super(key: key);

  final bookAppointMentScreenController = Get.put(BookAppointmentScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonAppBarModule(title: "Book Appointment", appBarOption: AppBarOption.singleBackButtonOption),
            //SizedBox(height: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SelectSlot(),
                  SizedBox(height: 40,),
                  CheckAvaibilityButtonModule(),
                  SizedBox(height: 30,),
                  Expanded(child: ResourcesList())
                ],
              ).commonAllSidePadding(20),
            )

          ],
        ),
      ),
    );
  }
}
