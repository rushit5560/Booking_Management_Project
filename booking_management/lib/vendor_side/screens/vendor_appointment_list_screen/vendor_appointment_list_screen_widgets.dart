import 'dart:developer';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../controllers/vendor_appointment_list_screen_controller/vendor_appointment_list_screen_controller.dart';
import '../appointment_details_screen/appointment_details_screen.dart';

class AppointmentListSearchAppointmentField extends StatelessWidget {
  AppointmentListSearchAppointmentField({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 8,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: TextFormField(
        controller: screenController.searchAppointmentFieldController,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Search Appointment',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

/// Filter List Module
class AppointmentListTextModule extends StatelessWidget {
  AppointmentListTextModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Appointment List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 25),
        _selectDateModule(),
        const SizedBox(height: 25),
        screenController.isAppointmentListCalenderShow.value == true
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _calenderModule(),
                  const SizedBox(height: 25),
                ],
              )
            : Container(),
        _selectableTabsModule(),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _selectDateModule() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Show Date as Text
                  Text(
                    screenController.selectedDisplayDate.value,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  /// Calender Image Button
                  GestureDetector(
                    onTap: () {
                      screenController.isAppointmentListCalenderShow.value =
                          !screenController.isAppointmentListCalenderShow.value;
                      screenController.loadUI();

                      log("screenController.isCalenderShow.value : ${screenController.isAppointmentListCalenderShow.value}");
                    },
                    child: const Icon(Icons.calendar_month),
                  ),
                ],
              ).commonSymmetricPadding(vertical: 12, horizontal: 10),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () async {
              // screenController.selectedDate.value = "";
              await screenController.getAppointmentListFunction();
            },
            child: const Text(
              "Search",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _calenderModule() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TableCalendar(
          focusedDay: focusedDay,
          firstDay: DateTime(2020),
          lastDay: DateTime(2050),
          calendarFormat: format,
          rangeStartDay: DateTime.now(),
          onDaySelected: (DateTime selectDay, DateTime focusDay) async {
            selectedDay = selectDay;
            focusedDay = focusDay;

            String month = '';
            if (selectedDay.month == 1) {
              month = "january";
            } else if (selectedDay.month == 2) {
              month = "february";
            } else if (selectedDay.month == 3) {
              month = "March";
            } else if (selectedDay.month == 4) {
              month = "April";
            } else if (selectedDay.month == 5) {
              month = "May";
            } else if (selectedDay.month == 6) {
              month = "June";
            } else if (selectedDay.month == 7) {
              month = "July";
            } else if (selectedDay.month == 8) {
              month = "August";
            } else if (selectedDay.month == 9) {
              month = "September";
            } else if (selectedDay.month == 10) {
              month = "October";
            } else if (selectedDay.month == 11) {
              month = "November";
            } else if (selectedDay.month == 12) {
              month = "December";
            }

            screenController.selectedDate.value =
                "${selectedDay.day}/$month/${selectedDay.year}";
            screenController.selectedDisplayDate.value =
                "${selectedDay.day}/${selectedDay.month}/${selectedDay.year}";

            // screenController.selectedTime.value = "${selectedDay.hour}:${selectedDay.minute}:${selectedDay.second}";
            screenController.isAppointmentListCalenderShow.value =
                !screenController.isAppointmentListCalenderShow.value;
            screenController.loadUI();
            await screenController.getAppointmentListFunction();
          },

          // Day Changed
          selectedDayPredicate: (DateTime date) {
            return isSameDay(selectedDay, date);
          },
          // Style the Calender
          calendarStyle: CalendarStyle(
            isTodayHighlighted: false,
            outsideDecoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
            defaultTextStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            weekendTextStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            selectedTextStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            todayTextStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            defaultDecoration: const BoxDecoration(
                // borderRadius: BorderRadius.circular(10),
                shape: BoxShape.circle,
                color: Colors.white),
            weekendDecoration: const BoxDecoration(
                //borderRadius: BorderRadius.circular(10),
                shape: BoxShape.circle,
                color: Colors.white),
            todayDecoration: const BoxDecoration(
                //borderRadius: BorderRadius.circular(10),
                shape: BoxShape.circle,
                color: Colors.transparent),
            selectedDecoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(10),
                shape: BoxShape.circle,
                color: AppColors.colorLightGrey1),
          ),
          // Week Style
          daysOfWeekStyle: const DaysOfWeekStyle(
            // dowTextFormatter: (dowTextFormat, dynamic) {
            //   return DateFormat.E(locale).format(dowTextFormat)[0];
            // },
            decoration: BoxDecoration(color: Colors.transparent),
            weekdayStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),

            weekendStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          // Month Style
          headerStyle: HeaderStyle(
            headerPadding: const EdgeInsets.only(top: 10, bottom: 10),
            formatButtonVisible: false,
            titleCentered: true,
            decoration: const BoxDecoration(color: Colors.white),
            formatButtonDecoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            leftChevronIcon:
                const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            rightChevronIcon: const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _selectableTabsModule() {
    return SizedBox(
      height: Get.height / 23,
      child: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 3),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'All',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 1
                                ? Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: Container(
                                      height: 6,
                                      width: 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Pending',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 2
                                ? Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: Container(
                                      height: 6,
                                      width: 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Confirm',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 3
                                ? Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: Container(
                                      height: 6,
                                      width: 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 4
                                ? Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: Container(
                                      height: 6,
                                      width: 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Done',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 5
                                ? Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: Container(
                                      height: 6,
                                      width: 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                /*const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Processing',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 6
                                ? Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Container(
                                height: 6,
                                width: 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                            )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Scheduled',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 7
                                ? Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Container(
                                height: 6,
                                width: 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                            )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),*/
                const SizedBox(width: 3),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// All Appointment List
class AllAppointmentListModule extends StatelessWidget {
  AllAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.allAppointmentList.isEmpty
        ? const Center(child: Text("No Record Found"))
        : ListView.builder(
            itemCount: screenController.allAppointmentList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(
                    bottom: 17, left: 5, right: 5, top: 5),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _userNameModule(i),
                            const SizedBox(height: 8),
                            _dateAndTimeModule(i),
                            const SizedBox(height: 8),
                            _statusModule(i),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _viewButton(i),
                            // const SizedBox(width: 10),
                            // _confirmButton(i),
                          ],
                        ),
                      ),
                    ),
                  ],
                ).commonAllSidePadding(10),
              );
            },
          ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.allAppointmentList[i].firstName,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _dateAndTimeModule(i) {
    return Row(
      children: [
        Image.asset(
          AppImages.dateImg,
          height: 12,
          width: 12,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          screenController.allAppointmentList[i].startDateTime,
          style: const TextStyle(fontSize: 10),
        ),

        /*const SizedBox(width: 10),

        Image.asset(
          AppImages.timeImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          time,
          style: const TextStyle(fontSize: 9),
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.allAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () => Get.to(
        () => AppointmentDetailsScreen(),
        transition: Transition.zoom,
        arguments: [
          screenController.allAppointmentList[i].bookingId,
          screenController.allAppointmentList[i].status,
          screenController.allAppointmentList[i].id,
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'View',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /*Widget _confirmButton(i) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          screenController.allAppointmentList[i].status,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }*/
}

/// Pending Appointment Module
class PendingAppointmentListModule extends StatelessWidget {
  PendingAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.pendingAppointmentList.isEmpty
        ? const Center(child: Text("No Record Found"))
        : ListView.builder(
            itemCount: screenController.pendingAppointmentList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(
                    bottom: 17, left: 5, right: 5, top: 5),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _userNameModule(i),
                          const SizedBox(height: 8),
                          _dateAndTimeModule(i),
                          const SizedBox(height: 8),
                          _statusModule(i),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _viewButton(i),
                          // const SizedBox(width: 10),
                          // _confirmButton(i),
                        ],
                      ),
                    ),
                  ],
                ).commonAllSidePadding(10),
              );
            },
          ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.pendingAppointmentList[i].firstName,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _dateAndTimeModule(i) {
    List<String> dateList =
        screenController.pendingAppointmentList[i].startDateTime.split('T');
    String date = dateList[0];

    return Row(
      children: [
        Image.asset(
          AppImages.dateImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          date,
          style: const TextStyle(fontSize: 9),
        ),

        /*const SizedBox(width: 10),

        Image.asset(
          AppImages.timeImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          time,
          style: const TextStyle(fontSize: 9),
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.pendingAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () => Get.to(() => AppointmentDetailsScreen(),
          transition: Transition.zoom,
          arguments: [
            screenController.allAppointmentList[i].bookingId,
            screenController.allAppointmentList[i].status,
            screenController.allAppointmentList[i].id,
          ]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'View',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /*Widget _confirmButton(i) {
    return GestureDetector(
      onTap: () async {
        await screenController.confirmAppointmentByIdFunction(
          appointmentId: screenController.pendingAppointmentList[i].id,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Confirm',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }*/
}

/// Confirm Appointment Module
class ConfirmAppointmentListModule extends StatelessWidget {
  ConfirmAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.confirmAppointmentList.isEmpty
        ? const Center(child: Text("No Record Found"))
        : ListView.builder(
            itemCount: screenController.confirmAppointmentList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(
                    bottom: 17, left: 5, right: 5, top: 5),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _userNameModule(i),
                          const SizedBox(height: 8),
                          _dateAndTimeModule(i),
                          const SizedBox(height: 8),
                          _statusModule(i),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _viewButton(i),
                          // const SizedBox(width: 10),
                          // _confirmButton(),
                        ],
                      ),
                    ),
                  ],
                ).commonAllSidePadding(10),
              );
            },
          ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.confirmAppointmentList[i].firstName,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _dateAndTimeModule(i) {
    List<String> dateList =
        screenController.pendingAppointmentList[i].startDateTime.split('T');
    String date = dateList[0];
    return Row(
      children: [
        Image.asset(
          AppImages.dateImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          date,
          style: const TextStyle(fontSize: 9),
        ),

        /*const SizedBox(width: 10),

        Image.asset(
          AppImages.timeImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          time,
          style: const TextStyle(fontSize: 9),
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.confirmAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () => Get.to(() => AppointmentDetailsScreen(),
          transition: Transition.zoom,
          arguments: [
            screenController.allAppointmentList[i].bookingId,
            screenController.allAppointmentList[i].status,
            screenController.allAppointmentList[i].id,
          ]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'View',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /*Widget _doneButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Confirm',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }*/
}

/// Cancel Appointment Module
class CancelAppointmentListModule extends StatelessWidget {
  CancelAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.cancelAppointmentList.isEmpty
        ? const Center(child: Text("No Record Found"))
        : ListView.builder(
            itemCount: screenController.cancelAppointmentList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(
                    bottom: 17, left: 5, right: 5, top: 5),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _userNameModule(i),
                          const SizedBox(height: 8),
                          _dateAndTimeModule(i),
                          const SizedBox(height: 8),
                          _statusModule(i),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _viewButton(i),
                          // const SizedBox(width: 10),
                          // _confirmButton(),
                        ],
                      ),
                    ),
                  ],
                ).commonAllSidePadding(10),
              );
            },
          ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.cancelAppointmentList[i].firstName,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _dateAndTimeModule(i) {
    List<String> dateList =
        screenController.pendingAppointmentList[i].startDateTime.split('T');
    String date = dateList[0];
    return Row(
      children: [
        Image.asset(
          AppImages.dateImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          date,
          style: const TextStyle(fontSize: 9),
        ),

        /*const SizedBox(width: 10),

        Image.asset(
          AppImages.timeImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          time,
          style: const TextStyle(fontSize: 9),
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.cancelAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () => Get.to(() => AppointmentDetailsScreen(),
          transition: Transition.zoom,
          arguments: [
            screenController.allAppointmentList[i].bookingId,
            screenController.allAppointmentList[i].status,
            screenController.allAppointmentList[i].id,
          ]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'View',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /*Widget _confirmButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Confirm',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }*/
}

/// Done Appointment Module
class DoneAppointmentListModule extends StatelessWidget {
  DoneAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.doneAppointmentList.isEmpty
        ? const Center(child: Text("No Record Found"))
        : ListView.builder(
            itemCount: screenController.doneAppointmentList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(
                    bottom: 17, left: 5, right: 5, top: 5),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _userNameModule(i),
                          const SizedBox(height: 8),
                          _dateAndTimeModule(i),
                          const SizedBox(height: 8),
                          _statusModule(i),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _viewButton(i),
                          // const SizedBox(width: 10),
                          // _confirmButton(),
                        ],
                      ),
                    ),
                  ],
                ).commonAllSidePadding(10),
              );
            },
          ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.doneAppointmentList[i].firstName,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _dateAndTimeModule(i) {
    List<String> dateList =
        screenController.pendingAppointmentList[i].startDateTime.split('T');
    String date = dateList[0];
    return Row(
      children: [
        Image.asset(
          AppImages.dateImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          date,
          style: const TextStyle(fontSize: 9),
        ),

        /*const SizedBox(width: 10),

        Image.asset(
          AppImages.timeImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          time,
          style: const TextStyle(fontSize: 9),
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.doneAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () => Get.to(() => AppointmentDetailsScreen(),
          transition: Transition.zoom,
          arguments: [
            screenController.allAppointmentList[i].bookingId,
            screenController.allAppointmentList[i].status,
            screenController.allAppointmentList[i].id,
          ]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'View',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /*Widget _confirmButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Confirm',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }*/
}
