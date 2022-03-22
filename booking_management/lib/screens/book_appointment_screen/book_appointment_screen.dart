import 'package:booking_management/common/extension_methods/extension_methods.dart';
import 'package:booking_management/controllers/book_appointment_screen_controller/book_appointment_screen_controller.dart';
import 'package:booking_management/screens/book_appointment_screen/book_appointment_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            const AppBarWidget(),
            //SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SelectDateModule(),
                SizedBox(height: 20,),
                SelectTimeModule(),
                SizedBox(height: 20,),
                SelectPaymentMethod(),
                SizedBox(height: 30,),
                BookButtonModule()
              ],
            ).commonAllSidePadding(20)

          ],
        ),
      ),
    );
  }
}
