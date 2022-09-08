import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/book_appointment_screen_controller/book_appointment_screen_controller.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:booking_management/user_side/screens/invoice_screen/invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/booking_success_screen_controller/booking_success_screen_controller.dart';

/// Round Green
class RoundCorrectModule extends StatelessWidget {
  const RoundCorrectModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * 0.18,
      width: Get.width * 0.18,
      decoration: const BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.check_rounded,
        color: Colors.white,
        size: Get.width * 0.13,
      ),
    );
  }
}

/// Successfully Text
class BookedSuccessfullyModule extends StatelessWidget {
  const BookedSuccessfullyModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Appointment Booked Successfully!",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ).commonSymmetricPadding(horizontal: 5);
  }
}

/// Booking Details Text
class BookingDetailsModule extends StatelessWidget {
  BookingDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookingSuccessScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Appointment booked with "),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${screenController.vendorName} ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("on "),
          ],
        ),
        const SizedBox(height: 3),
        Text(
          "${screenController.date} at ${screenController.slotTime}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 5);
  }
}

/// Buttons
class ButtonsModule extends StatelessWidget {
  ButtonsModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookingSuccessScreenController>();
  final bookAppointmentScreenController =
      Get.find<BookAppointmentScreenController>();

  @override
  Widget build(BuildContext context) {
    return bookAppointmentScreenController.isPriceDisplay.value
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => InvoiceScreen(),
                    transition: Transition.zoom,
                    arguments: screenController.bookingId,
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 5,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ]),
                  child: const Text(
                    'View Invoice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ).commonSymmetricPadding(horizontal: 10),
              ),
              GestureDetector(
                onTap: () {
                  Get.offAll(() => IndexScreen(), transition: Transition.zoom);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 5,
                            color: Colors.grey.shade300,
                            blurStyle: BlurStyle.outer,
                          ),
                        ]),
                    child: const Text(
                      'Continue Booking',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : GestureDetector(
            onTap: () {
              Get.offAll(() => IndexScreen(), transition: Transition.zoom);
            },
            child: Container(
              alignment: Alignment.center,
              width: Get.width,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 3,
                        blurRadius: 5,
                        color: Colors.grey.shade300,
                        blurStyle: BlurStyle.outer,
                      ),
                    ]),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Continue Booking',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
