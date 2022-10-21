import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/model/book_appointment_screen_model/get_booking_resources_model.dart';
import 'package:booking_management/vendor_side/controllers/vendor_schedule_management_screen_controller/vendor_schedule_management_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleMangementText extends StatelessWidget {
  const ScheduleMangementText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Create time slots for selected date range",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        .commonSymmetricPadding(horizontal: 10);
  }
}

/// Start Date Select Module
class StartDateSelectModule extends StatelessWidget {
  StartDateSelectModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleManagementScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            screenController.startDate.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          /// Calender Image Button
          GestureDetector(
            onTap: () {
              screenController.isStartDateCalenderShow.value =
                  !screenController.isStartDateCalenderShow.value;

              screenController.isEndDateCalenderShow.value = false;

              log("screenController.isStartDateCalenderShow.value : ${screenController.isStartDateCalenderShow.value}");
            },
            child: const Icon(Icons.calendar_month),
          ),
        ],
      ).commonSymmetricPadding(vertical: 12, horizontal: 10),
    ).commonSymmetricPadding(horizontal: 10);
  }
}

class SelectStartDateCalender extends StatelessWidget {
  SelectStartDateCalender({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleManagementScreenController>();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //   "Select Date",
        //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        // ),
        const SizedBox(height: 10),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TableCalendar(
              focusedDay: focusedDay,
              firstDay: DateTime.now(),
              lastDay: DateTime(2050),
              calendarFormat: format,
              rangeStartDay: DateTime.now(),
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                selectedDay = selectDay;
                focusedDay = focusDay;

                screenController.selectedStartDate = selectedDay;

                screenController.startDate.value =
                    "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";

                screenController.isStartDateCalenderShow.value =
                    !screenController.isStartDateCalenderShow.value;

                screenController.isEndDateCalenderShow.value = false;

                screenController.loadUI();

                log('start date: ${screenController.startDate.value}');
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),

                weekendStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                leftChevronIcon: const Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.black),
                rightChevronIcon: const Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// End Date Select Module
class EndDateSelectModule extends StatelessWidget {
  EndDateSelectModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleManagementScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            screenController.endDate.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          /// Calender Image Button
          GestureDetector(
            onTap: () {
              screenController.isEndDateCalenderShow.value =
                  !screenController.isEndDateCalenderShow.value;

              screenController.isStartDateCalenderShow.value = false;

              log("screenController.isEndDateCalenderShow.value : ${screenController.isEndDateCalenderShow.value}");
            },
            child: const Icon(Icons.calendar_month),
          ),
        ],
      ).commonSymmetricPadding(vertical: 12, horizontal: 10),
    ).commonSymmetricPadding(horizontal: 10);
  }
}

class SelectEndDateCalender extends StatelessWidget {
  SelectEndDateCalender({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleManagementScreenController>();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //   "Select Date",
        //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        // ),
        const SizedBox(height: 10),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TableCalendar(
              focusedDay: focusedDay,
              firstDay: DateTime.now(),
              lastDay: DateTime(2050),
              calendarFormat: format,
              rangeStartDay: DateTime.now(),
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                selectedDay = selectDay;
                focusedDay = focusDay;

                screenController.endDate.value =
                    "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";
                screenController.isEndDateCalenderShow.value =
                    !screenController.isEndDateCalenderShow.value;

                screenController.isStartDateCalenderShow.value = false;

                screenController.loadUI();
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),

                weekendStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                leftChevronIcon: const Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.black),
                rightChevronIcon: const Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SelectResourcesModule extends StatelessWidget {
  SelectResourcesModule({Key? key}) : super(key: key);

  final screenController = Get.find<VendorScheduleManagementScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              fillColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.accentColor),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              value: screenController.isAllSelected.value,
              onChanged: (value) {
                screenController.isLoading(true);
                screenController.isAllSelected.value = !screenController.isAllSelected.value;


                if(screenController.isAllSelected.value == true) {
                  screenController.selectedResourceIdList.clear();
                  for (int i = 0; i < screenController.allResourcesList.length; i++) {
                    screenController.allResourcesList[i].isSelected = true;
                    screenController.selectedResourceIdList.add(screenController.allResourcesList[i].id);
                  }
                } else {
                  screenController.selectedResourceIdList.clear();
                  for (int i = 0; i < screenController.allResourcesList.length; i++) {
                    screenController.allResourcesList[i].isSelected = false;
                  }
                }

                log('selectedResourceIdList:${screenController.selectedResourceIdList}');

                screenController.isLoading(false);
              },
            ),
            const Text('All'),
          ],
        ),

        ListView.builder(
          itemCount: screenController.allResourcesList.length,
          // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            BookingResourceWorkerData singleItem =
                screenController.allResourcesList[i];
            return ResourceNameCheckBoxRow(
              resourceText: singleItem.resourceName,
              resourceCheckBool: screenController.resourcesCheckList[i],
              singleItem: singleItem,
            );
          },
        ),
      ],
    );
  }
}

class ResourceNameCheckBoxRow extends StatelessWidget {
  ResourceNameCheckBoxRow({
    Key? key,
    required this.resourceCheckBool,
    required this.resourceText,
    required this.singleItem,
  }) : super(key: key);

  RxBool resourceCheckBool;
  final String resourceText;
  final screenController = Get.find<VendorScheduleManagementScreenController>();
  final BookingResourceWorkerData singleItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.resolveWith(
                  (states) => AppColors.accentColor),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          value: singleItem.isSelected,
          onChanged: (value) {
            screenController.isLoading(true);
            singleItem.isSelected = !singleItem.isSelected;
            screenController.selectedResourceIdList.clear();
            for(int i=0; i < screenController.allResourcesList.length; i++) {
              if(screenController.allResourcesList[i].isSelected == true){
                screenController.selectedResourceIdList.add(
                    screenController.allResourcesList[i].id,
                );
              }
            }

            // If Select All Checkbox manually then All name checkbox make true otherwise false
            if(screenController.selectedResourceIdList.length < screenController.allResourcesList.length) {
              screenController.isAllSelected.value = false;
            } else if(screenController.selectedResourceIdList.length == screenController.allResourcesList.length) {
              screenController.isAllSelected.value = true;
            }
            //

            log('selectedResourceIdList:${screenController.selectedResourceIdList}');

            screenController.isLoading(false);
          },
        ),
        const SizedBox(width: 5),
        Text(
          resourceText,
          maxLines: 2,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

/// Submit Button
class SubmitButton extends StatelessWidget {
  SubmitButton({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleManagementScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (screenController.startDate.value == "Select Start Date") {
          Fluttertoast.showToast(msg: "Please select start date");
        } else if (screenController.endDate.value == "Select End Date") {
          Fluttertoast.showToast(msg: "Please select end date");
        } else {
          if(screenController.selectedResourceIdList.isEmpty) {
            Fluttertoast.showToast(msg: "Please select resources");
          }
          else {
            await screenController.getAutoScheduleFunction();
          }
        }
        //await screenController.getFilterAppointmentReportFunction();
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  // spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey.shade300,
                  blurStyle: BlurStyle.outer,
                ),
              ]),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Submit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ).commonSymmetricPadding(horizontal: 15),
    );
  }
}

/// Search schedule Timing Module
class SearchScheduleTimingText extends StatelessWidget {
  const SearchScheduleTimingText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Search Schedule Timings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        .commonSymmetricPadding(horizontal: 10)
        .commonSymmetricPadding(horizontal: 10);
  }
}

/// End Date Select Module
class SearchScheduleTimingModule extends StatelessWidget {
  SearchScheduleTimingModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleManagementScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            screenController.scheduleTimingDate.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          /// Calender Image Button
          GestureDetector(
            onTap: () {
              screenController.isScheduleTimingCalenderShow.value =
                  !screenController.isScheduleTimingCalenderShow.value;

              screenController.isStartDateCalenderShow.value = false;

              log("screenController.isScheduleTimingCalenderShow.value : ${screenController.isScheduleTimingCalenderShow.value}");
            },
            child: const Icon(Icons.calendar_month),
          ),
        ],
      ).commonSymmetricPadding(vertical: 12, horizontal: 10),
    ).commonSymmetricPadding(horizontal: 10);
  }
}

class ScheduleTimingCalender extends StatelessWidget {
  ScheduleTimingCalender({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleManagementScreenController>();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //   "Select Date",
        //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        // ),
        const SizedBox(height: 10),
        Material(
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
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                selectedDay = selectDay;
                focusedDay = focusDay;

                screenController.scheduleTimingDate.value =
                    "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";
                screenController.isScheduleTimingCalenderShow.value =
                    !screenController.isScheduleTimingCalenderShow.value;

                screenController.isStartDateCalenderShow.value = false;

                screenController.loadUI();
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),

                weekendStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                leftChevronIcon: const Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.black),
                rightChevronIcon: const Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Submit Button
class SearchScheduleSubmitButton extends StatelessWidget {
  SearchScheduleSubmitButton({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleManagementScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (screenController.scheduleTimingDate.value == "Select Date") {
          Fluttertoast.showToast(msg: "Please select date");
        } else {
          await screenController.getAllResourceListFunction(
              searchWise: SearchWise.dateWise);
        }
        //await screenController.getFilterAppointmentReportFunction();
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  // spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey.shade300,
                  blurStyle: BlurStyle.outer,
                ),
              ]),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Submit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ).commonSymmetricPadding(horizontal: 15),
    );
  }
}

class ResourceScheduleListModule extends StatelessWidget {
  ResourceScheduleListModule({Key? key}) : super(key: key);

  final screenController = Get.find<VendorScheduleManagementScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.allResourcesList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        BookingResourceWorkerData singleItem =
            screenController.allResourcesList[i];
        return _resourcesListTile(singleItem);
      },
    );
  }

  Widget _resourcesListTile(BookingResourceWorkerData singleItem) {
    String imgUrl = ApiUrl.apiImagePath + singleItem.image;
    log('singleItem.timingList: ${singleItem.timingList}');
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                // decoration: BoxDecoration(
                //     // image: DecorationImage(
                //     //   image: NetworkImage(imgUrl),
                //     //   fit: BoxFit.cover,
                //     // ),
                //     ),
                child: Image.network(
                  imgUrl,
                  errorBuilder: (context, st, ob) {
                    return Image.asset(AppImages.logoImg);
                  },
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      singleItem.resourceName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Html(
                      data: singleItem.details,
                    ),
                    // Text(
                    //   singleItem.details,
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    const SizedBox(height: 5),
                    Text(
                      "\$${singleItem.price}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          singleItem.timingList.isEmpty && singleItem.nextDate.isEmpty
              ? Row(
                  children: const [Text("Time slot is not available.")],
                )
              : singleItem.nextDate.isNotEmpty
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            String nextDate = singleItem.nextDate;
                            List<String> dateModuleList = nextDate.split('/');
                            for (int i = 0; i < dateModuleList.length; i++) {
                              log("dateModuleList : ${dateModuleList[i]}");
                            }
                            log("dateModuleList.length : ${dateModuleList.length}");
                            screenController.scheduleTimingDate.value =
                                "${dateModuleList[2]}-${dateModuleList[0]}-${dateModuleList[1]}";
                            await screenController.getAllResourceListFunction(
                                searchWise: SearchWise.dateWise);
                          },
                          child: Text(
                            "Next Available ${singleItem.nextDate}",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.accentColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  : GridView.builder(
                      itemCount: singleItem.timingList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 3,
                              crossAxisSpacing: 3,
                              childAspectRatio: 5),
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            // /// First All Slot Set Unselected
                            // for(int i = 0; i < screenController.allResourcesList.length; i++) {
                            //   for(int j = 0; j < screenController.allResourcesList[i].timingList.length; j++) {
                            //     screenController.allResourcesList[i].timingList[j].isSelected = false;
                            //   }
                            // }
                            //
                            // /// Selected Item Become Blue
                            // int selectedId = singleItem.timingList[i].id;
                            // log("selectedId : $selectedId");
                            // screenController.selectedResourceTimeSlotId = selectedId;
                            //
                            // for(int j=0; j < singleItem.timingList.length; j++) {
                            //   if (singleItem.timingList[j].id == selectedId) {
                            //     singleItem.timingList[j].isSelected = true;
                            //   } else {
                            //     singleItem.timingList[j].isSelected = false;
                            //   }
                            // }
                            // screenController.loadUI();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.grey.shade300,
                                  blurStyle: BlurStyle.outer,
                                ),
                              ],
                              // color: singleItem.timingList[i].isSelected == true
                              //     ? Colors.blue
                              //     : null
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  singleItem.timingList[i].startDateTime,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: /*singleItem.timingList[i].isSelected == true
                                ? Colors.white
                                : */
                                          Colors.black),
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: /*singleItem.timingList[i].isSelected == true
                              ? Colors.white
                              :*/
                                        Colors.black,
                                  ),
                                ).commonSymmetricPadding(horizontal: 5),
                                Text(
                                  singleItem.timingList[i].endDateTime,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: /*singleItem.timingList[i].isSelected == true
                              ? Colors.white
                              :*/
                                        Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ).commonAllSidePadding(3),
                        );
                      },
                    ),
        ],
      ).commonAllSidePadding(8),
    ).commonSymmetricPadding(vertical: 8, horizontal: 10);
  }
}
