import 'dart:developer';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../controllers/appointment_report_screen_controller/appointment_report_screen_controller.dart';
import '../../model/appointment_report_screen_model/appointment_report_model.dart';

/// Status DD Module
class StatusDropDownModule extends StatelessWidget {
  StatusDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 3),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorLightGrey.withOpacity(0.5),
            blurRadius: 5,
            //spreadRadius: 5,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.grey.shade100,
            // background color for the dropdown items
            buttonTheme: ButtonTheme.of(context).copyWith(
              alignedDropdown:
                  true, //If false (the default), then the dropdown's menu will be wider than its button.
            )),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            icon: Image.asset(AppImages.dropDownArrowImg, scale: 3),
            isExpanded: true,
            focusColor: Colors.white,
            value: screenController.selectedStatusValue.value,
            //elevation: 5,
            // style: TextStyle(color: AppColors.colorLightGrey),
            iconEnabledColor: Colors.black,
            items: screenController.statusList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  // style: TextStyle(color: AppColors.colorLightGrey),
                ),
              );
            }).toList(),
            // hint: const Text(
            //   "Ratting",
            //   style: TextStyle(color: Colors.black, fontSize: 11),
            // ),
            onChanged: (newValue) {
              screenController.isLoading(true);
              screenController.selectedStatusValue.value = newValue!;
              screenController.getAppointmentReportFunction();
              screenController.isLoading(false);
              // if (screenController.searchType == SearchType.categoryWise) {
              //   await screenController.getSearchCategoryWithRatingWiseFunction();
              // } else if (screenController.searchType == SearchType.none) {
              //   await screenController.getAllSearchVendorListRatingWiseFunction(searchText: screenController.categoryFieldController.text);
              // }
            },
          ),
        ),
      ),
    ).commonAllSidePadding(10);
  }
}

/// Start Date Select Module
class StartDateSelectModule extends StatelessWidget {
  StartDateSelectModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentReportScreenController>();

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
  final screenController = Get.find<AppointmentReportScreenController>();
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
              lastDay: DateTime.now(),
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
  final screenController = Get.find<AppointmentReportScreenController>();

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
  final screenController = Get.find<AppointmentReportScreenController>();
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
              lastDay: DateTime.now(),
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

/// Submit Button
class SubmitButton extends StatelessWidget {
  SubmitButton({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (screenController.startDate.value == "Select Start Date") {
          Fluttertoast.showToast(msg: "Please select start date");
        } else if (screenController.endDate.value == "Select End Date") {
          Fluttertoast.showToast(msg: "Please select end date");
        } else {
          await screenController.getFilterAppointmentReportFunction();
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

/// Export Button
// class ExcelButton extends StatelessWidget {
//   ExcelButton({Key? key}) : super(key: key);
//   final screenController = Get.find<AppointmentReportScreenController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         await screenController.createExcel();
//       },
//       child: Container(
//         alignment: Alignment.centerLeft,
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   // spreadRadius: 3,
//                   blurRadius: 5,
//                   color: Colors.grey.shade300,
//                   blurStyle: BlurStyle.outer,
//                 ),
//               ]),
//           child: const Padding(
//             padding: EdgeInsets.all(12),
//             child: Text(
//               'Export',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ).commonSymmetricPadding(horizontal: 15),
//     );
//   }
// }

/// Appointment Report List
class AppointmentReportListModule extends StatelessWidget {
  AppointmentReportListModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.appointmentReportList.isEmpty
        ? const Center(child: Text("No data available!"))
        : ListView.builder(
            itemCount: screenController.appointmentReportList.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) {
              AppointmentListModule singleItem =
                  screenController.appointmentReportList[i];
              return _appointmentListTile(singleItem);
            },
          ).commonAllSidePadding(10);
  }

  Widget _appointmentListTile(AppointmentListModule singleItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 17, left: 5, right: 5, top: 5),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                "Booking Id : ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  singleItem.bookingId,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Vendor :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            singleItem.vendor.businessName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          "Customer :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            singleItem.firstName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          "Start Time :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            singleItem.startDateTime,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          "End Time :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            singleItem.endDateTime,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${singleItem.bookingItems.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${singleItem.bookingItems.quantity}",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    singleItem.status,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // const SizedBox(width: 5),
          // _viewButton(),
        ],
      ).commonAllSidePadding(10),
    );
  }
}
