import 'dart:developer';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/user_side/controllers/user_booking_history_screen_controller/user_booking_history_screen_controller.dart';
import 'package:booking_management/user_side/screens/booking_details_screen/booking_details_screen.dart';
import 'package:booking_management/user_side/screens/home_screen/upcoming_appointment_details_screen/upcoming_appointment_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BookingHistoryList extends StatelessWidget {
  BookingHistoryList({Key? key}) : super(key: key);
  final screenController = Get.find<UserBookingHistoryScreenController>();

  @override
  Widget build(BuildContext context) {
    log('length: ${screenController.historyList.length}');
    return ListView.builder(
      itemCount: screenController.historyList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        // Datum singleItem =
        // screenController.allUpcomingAppointmentList[i];
        return _upcomingAppointmentListTile(i);
      },
    );
  }

  Widget _upcomingAppointmentListTile(i) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  /*Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.vendorImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),*/
                  // const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          screenController.historyList[i].bookingFor,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          screenController.historyList[i].startDateTime,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                await screenController.getUpcomingAppointmentDetailsFunction(
                    id: screenController.historyList[i].bookingId);

                Get.to(() => BookingDetailsScreen(),
                    transition: Transition.zoom);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.rightArrowImg),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
