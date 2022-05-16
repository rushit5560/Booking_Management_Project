import 'dart:developer';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/user_side/controllers/user_booking_history_screen_controller/user_booking_history_screen_controller.dart';
import 'package:booking_management/user_side/screens/booking_details_screen/booking_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

UserBookingHistoryScreenController screenController =
    Get.find<UserBookingHistoryScreenController>();

class BookingHistoryList extends StatelessWidget {
  const BookingHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('length: ${screenController.historyList.length}');
    return ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: screenController.historyList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => const BookingDetailsScreen(),
                      transition: Transition.zoom);
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      bottom: 10, left: 3, right: 3, top: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.colorLightGrey,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 5)
                      ]),
                  //color: AppColors.colorLightGrey1
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: //screenController.historyList[index].customerBooking.image.isNotEmpty ?
                                  //Image.network(screenController.historyList[index].customerBooking.image, height: 60 , width: 60,):
                                  Image.asset(
                                AppImages.vendorImg,
                                scale: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  screenController.historyList[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                const SizedBox(height: 7),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(AppImages.calenderImg),
                                        const SizedBox(width: 5),
                                        Text(
                                          screenController
                                              .historyList[index]
                                              .vendorBooking
                                              .vendorVerificationDate
                                              .toString(),
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                    /*SizedBox(width: 10,),
                                Row(
                                  children: [
                                    Image.asset(AppImages.clockImg),
                                    SizedBox(width: 5,),
                                    Text("2:00 PM", style: TextStyle(fontSize: 12))
                                  ],
                                )*/
                                  ],
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  "Status - " +
                                      screenController.historyList[index]
                                          .vendorBooking.status,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            )
                          ],
                        ),
                        //SizedBox(height: 10,),

                        Image.asset(AppImages.rightArrowImg)
                      ],
                    ),
                  ),
                ),
              );
            });
  }
}
