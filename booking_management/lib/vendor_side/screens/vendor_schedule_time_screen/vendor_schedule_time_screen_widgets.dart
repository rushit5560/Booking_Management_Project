import 'dart:developer';
import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../controllers/vendor_schedule_time_screen_controller/vendor_schedule_time_screen_controller.dart';
import '../../model/vendor_get_all_resources_list_model/vendor_get_all_resources_model.dart';
import '../../model/vendor_schedule_time_screen_model/get_all_resource_by_vendor_id_model.dart';

class ResourcesDropDownModule extends StatelessWidget {
  ResourcesDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleTimeScreenController>();

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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<WorkerList1>(
          value: screenController.selectResourceValue,
          items: screenController.getResourceList
              .map<DropdownMenuItem<WorkerList1>>((WorkerList1 value) {
            return DropdownMenuItem<WorkerList1>(
              value: value,
              child: Text(
                value.resourceName!,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            screenController.isLoading(true);
            screenController.selectResourceValue = newValue!;
            screenController.allScheduleTimeList.clear();
            log("selected resource is event ::: ${screenController.selectResourceValue.isEvent}");

            if (screenController.selectResourceValue.isEvent == true) {
              screenController.selectResourceTimeType.value = "Days";
            } else {
              screenController.selectResourceTimeType.value = "Hours";
            }
            // vendorServicesScreenController.loadUI();
            screenController.isLoading(false);
          },
        ),
      ).commonSymmetricPadding(horizontal: 12),
    );
  }
}

class ResourcesTimeTypeModule extends StatelessWidget {
  ResourcesTimeTypeModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleTimeScreenController>();

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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: screenController.selectResourceTimeType.value,
          items: screenController.selectResourceTimeTypeList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            screenController.isLoading(true);
            screenController.allScheduleTimeList.clear();
            screenController.allScheduleDaysList.clear();
            screenController.selectResourceTimeType.value = newValue!;
            log("selectTimeDuration : ${screenController.selectResourceTimeType.value}");
            // vendorServicesScreenController.loadUI();
            screenController.isLoading(false);
          },
        ),
      ).commonSymmetricPadding(horizontal: 12),
    );
  }
}

class TableModule extends StatelessWidget {
  TableModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleTimeScreenController>();

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
          Text(
            screenController.selectedDate.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              screenController.isCalenderShow.value =
                  !screenController.isCalenderShow.value;
            },
            child: const Icon(Icons.calendar_month),
          ),
        ],
      ).commonSymmetricPadding(vertical: 12, horizontal: 15),
    );
  }
}

class TableEndModule extends StatelessWidget {
  TableEndModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleTimeScreenController>();

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
          Text(
            screenController.selectedEndDate.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              screenController.isEndCalenderShow.value =
                  !screenController.isEndCalenderShow.value;
            },
            child: const Icon(Icons.calendar_month),
          ),
        ],
      ).commonSymmetricPadding(vertical: 12, horizontal: 15),
    );
  }
}

class ResourcesSelectDateModule extends StatelessWidget {
  ResourcesSelectDateModule({Key? key}) : super(key: key);

  final screenController = Get.find<VendorScheduleTimeScreenController>();
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
            child: Column(
              children: [
                TableCalendar(
                  focusedDay: focusedDay,
                  firstDay: DateTime.now(),
                  lastDay: DateTime(2050),
                  calendarFormat: format,
                  rangeStartDay: DateTime.now(),
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                    String month = "";
                    if (selectedDay.month == 1) {
                      month = "january";
                    } else if (selectedDay.month == 2) {
                      month = "February";
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
                        "${selectedDay.day}-$month-${selectedDay.year}";
                    screenController.isCalenderShow.value =
                        !screenController.isCalenderShow.value;
                    screenController.loadUI();
                    // log('selectedDay :: $selectedDay');
                    // log('focusedDay :: $focusedDay');
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
                    rightChevronIcon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ResourcesSelectEndDateModule extends StatelessWidget {
  ResourcesSelectEndDateModule({Key? key}) : super(key: key);

  final screenController = Get.find<VendorScheduleTimeScreenController>();
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
            child: Column(
              children: [
                TableCalendar(
                  focusedDay: focusedDay,
                  firstDay: DateTime.now(),
                  lastDay: DateTime(2050),
                  calendarFormat: format,
                  rangeStartDay: DateTime.now(),
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                    String month = "";
                    if (selectedDay.month == 1) {
                      month = "january";
                    } else if (selectedDay.month == 2) {
                      month = "February";
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
                    screenController.selectedEndDate.value =
                        "${selectedDay.day}-$month-${selectedDay.year}";
                    screenController.isEndCalenderShow.value =
                        !screenController.isEndCalenderShow.value;
                    screenController.loadUI();
                    // log('selectedDay :: $selectedDay');
                    // log('focusedDay :: $focusedDay');
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
                    rightChevronIcon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ScheduleListModule extends StatelessWidget {
  ScheduleListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleTimeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => screenController.isLoading.value
          ? const CustomCircularLoaderModule()
          : Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      child: Text(
                        "Start Time",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "End Time",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  itemCount:
                      screenController.selectResourceTimeType.value == "Days"
                          ? screenController.allScheduleDaysList.length
                          : screenController.allScheduleTimeList.length - 1,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    /*screenController.allScheduleTimeList.length == i - 1
                  ? Row(
                      children: [
                        Expanded(
                          child: Checkbox(
                            value: true,
                            onChanged: (bool? value) {},
                          ),
                        ),
                        Expanded(
                          child: Text(
                            screenController.allScheduleTimeList[i],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            screenController.allScheduleTimeList[i + 1],
                          ),
                        ),
                      ],
                    )
                  : */

                    return screenController.selectResourceTimeType.value ==
                            "Days"
                        ? Row(
                            children: [
                              Expanded(
                                child: Checkbox(
                                  value:
                                      screenController.checkScheduleTimeList[i],
                                  onChanged: (bool? value) {
                                    screenController.isLoading(true);
                                    screenController.checkScheduleTimeList[i] =
                                        !screenController
                                            .checkScheduleTimeList[i];
                                    screenController.isLoading(false);
                                  },
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  screenController.allScheduleDaysList[i]
                                      .split("T")[0],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  screenController.allScheduleDaysList[i]
                                      .split("T")[0],
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: Checkbox(
                                  value:
                                      screenController.checkScheduleTimeList[i],
                                  onChanged: (bool? value) {
                                    screenController.isLoading(true);
                                    screenController.checkScheduleTimeList[i] =
                                        !screenController
                                            .checkScheduleTimeList[i];
                                    screenController.isLoading(false);
                                  },
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  screenController.allScheduleTimeList[i]
                                      .split("T")[1]
                                      .substring(0, 5),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  screenController.allScheduleTimeList[i + 1]
                                      .split("T")[1]
                                      .substring(0, 5),
                                ),
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
    );
  }
}

/// Submit Button
class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleTimeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (screenController.selectedDate.value == "") {
          Fluttertoast.showToast(msg: "Please select date!");
        } else {
          await screenController.getAllSLotsFunction();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              // spreadRadius: 5,
              blurRadius: 5,
              color: Colors.grey.shade400,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            'Submit',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

/// save Button
class SaveButtonModule extends StatelessWidget {
  SaveButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleTimeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await screenController.setSelectedScheduleTimeFunction();
      },
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ]),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Text(
            'Save',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

/*class ResourcesListModule extends StatelessWidget {
  ResourcesListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorScheduleTimeScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.getAllResourcesList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        AllResourcesWorkerList singleItem =
            screenController.getAllResourcesList[i];
        return _resourcesListTile(singleItem);
      },
    );
  }

  Widget _resourcesListTile(AllResourcesWorkerList singleItem) {
    String imgUrl = ApiUrl.apiImagePath + singleItem.image;
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
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: NetworkImage(imgUrl),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: Image.network(imgUrl,
                  errorBuilder: (context, st, ob){
                    return Image.asset(AppImages.logoImg);
                  },fit: BoxFit.cover),
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
                    // Text(
                    //   singleItem.details,
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    Html(
                      data: singleItem.details,
                    ),
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
          const SizedBox(height: 15),
          singleItem.timingList.isEmpty
              ? Container()
              : GridView.builder(
                  itemCount: singleItem.timingList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 5,
                    // mainAxisExtent: 100,
                  ),
                  itemBuilder: (context, i) {
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
                      child: Center(
                        child: Text(
                          singleItem.timingList[i],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ).commonAllSidePadding(3);
                  },
                ),
        ],
      ).commonAllSidePadding(8),
    ).commonSymmetricPadding(vertical: 8);
  }
}*/
