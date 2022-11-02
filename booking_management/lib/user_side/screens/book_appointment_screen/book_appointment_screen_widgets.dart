import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/user_side/screens/user_sign_up_screen/user_sign_up_screen.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../vendor_side/model/vendor_additional_slot_screen_model/get_all_additional_slot_model.dart';
import '../../controllers/book_appointment_screen_controller/book_appointment_screen_controller.dart';
import '../../model/book_appointment_screen_model/get_booking_resources_model.dart';
import '../../model/book_appointment_screen_model/get_booking_service_model.dart';

/// Vendor Details Module
class VendorDetailsModule extends StatelessWidget {
  VendorDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

  @override
  Widget build(BuildContext context) {
    String imgUrl = ApiUrl.apiImagePath +
        screenController.bookVendorDetails!.vendor.categories.image;
    return Row(
      children: [
        Expanded(
          flex: 30,
          child: Container(
            // decoration: BoxDecoration(
            //   // image: DecorationImage(
            //   //   image: NetworkImage(imgUrl),
            //   //   fit: BoxFit.cover,
            //   // ),
            // ),
            child: Image.network(imgUrl, errorBuilder: (context, error, st) {
              return Image.asset(AppImages.logoImg);
            }),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                screenController.bookVendorDetails!.vendor.businessName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),

              RatingBar.builder(
                initialRating: double.parse(
                    screenController.bookVendorDetails!.ratting.toString()),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                ignoreGestures: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),

              // const SizedBox(height: 5),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${screenController.bookVendorDetails!.vendor.state}, ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  Expanded(
                    child: Text(
                      screenController.bookVendorDetails!.vendor.country,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),*/
            ],
          ),
        ),
      ],
    );
  }
}

/// Vendor Booking Service
class BookingServicesListModule extends StatelessWidget {
  BookingServicesListModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Services",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        screenController.allServicesList.length > 2
            ? servicesCollapsable()
            : ListView.separated(
                itemCount: screenController.allServicesList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, i) {
                  return const SizedBox(height: 10);
                },
                itemBuilder: (context, i) {
                  BookServiceWorkerList singleItem =
                      screenController.allServicesList[i];
                  return _bookingServiceListTile(singleItem);
                },
              ),
      ],
    );
  }

  Widget servicesCollapsable() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ExpandablePanel(
        header: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All Services",
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.blackColor,
                ),
              ).commonSymmetricPadding(horizontal: 10),
            ],
          ),
        ),
        theme: ExpandableThemeData(
          // collapseIcon: Icons.arrow_drop_down,

          animationDuration: const Duration(milliseconds: 500),
          headerAlignment: ExpandablePanelHeaderAlignment.center,

          iconColor: AppColors.blackColor,
        ),
        collapsed: Container(),
        expanded: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView.separated(
            itemCount: screenController.allServicesList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, i) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (context, i) {
              BookServiceWorkerList singleItem =
                  screenController.allServicesList[i];
              return _bookingServiceListTile(singleItem);
            },
          ),
        ),
      ).commonSymmetricPadding(vertical: 5),
    ).commonSymmetricPadding(vertical: 5);
    /*return ExpansionTile(
      // backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,

      title: Text("Dog"),
      children: [],
    );*/
  }

  Widget _bookingServiceListTile(BookServiceWorkerList singleItem) {
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
      child: Row(
        children: [
          Checkbox(
            value: singleItem.isSelect,
            onChanged: (value) async {
              singleItem.isSelect = !singleItem.isSelect;
              screenController.loadUI();

              if (singleItem.isSelect == true) {
                // Selected Service Add in List
                screenController.selectedServiceList.add(singleItem.id);
                log("screenController.selectedServiceList : ${screenController.selectedServiceList}");
              } else {
                // Selected Service Remove From the List
                screenController.selectedServiceList
                    .removeWhere((element) => singleItem.id == element);
                log("screenController.selectedServiceList : ${screenController.selectedServiceList}");
              }

              await screenController.getAllResourcesListByIdFunction();
            },
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  singleItem.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                screenController.isPriceDisplay.value
                    ? Column(
                        children: [
                          const SizedBox(height: 5),
                          Text(
                              "From \$${singleItem.price} / ${singleItem.timeDuration} mins"),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ).commonAllSidePadding(5),
    );
  }
}

/// Vendor Resources List
class BookingResourcesListModule extends StatelessWidget {
  BookingResourcesListModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select ${screenController.resourcePrefix}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        ListView.builder(
          itemCount: screenController.allResourcesList.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            BookingResourceWorkerData singleItem =
                screenController.allResourcesList[i];
            return _resourcesListTile(singleItem);
          },
        ),
      ],
    );
  }

  Widget _resourcesListTile(BookingResourceWorkerData singleItem) {
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
                // decoration: BoxDecoration(
                //   // image: DecorationImage(
                //   //   image: NetworkImage(imgUrl),
                //   //   fit: BoxFit.cover,
                //   // ),
                // ),
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
                    screenController.isPriceDisplay.value
                        ? Text(
                            "\$${singleItem.price}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        : Container(),
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
                            screenController.selectedDate.value =
                                "${dateModuleList[2]}-${dateModuleList[0]}-${dateModuleList[1]}";
                            await screenController
                                .getAllResourcesListByIdFunction(
                                    searchType2: SearchType2.dateTimeWise);
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
                            /// First All Slot Set Unselected
                            for (int i = 0;
                                i < screenController.allResourcesList.length;
                                i++) {
                              for (int j = 0;
                                  j <
                                      screenController.allResourcesList[i]
                                          .timingList.length;
                                  j++) {
                                screenController.allResourcesList[i]
                                    .timingList[j].isSelected = false;
                              }
                            }

                            /// Selected Item Become Blue
                            int selectedId = singleItem.timingList[i].id;
                            log("selectedId : $selectedId");
                            screenController.selectedResourceTimeSlotId =
                                selectedId;

                            screenController.selectedResourceIsEvent =
                                singleItem.isEvent;
                            screenController.selectedResource = singleItem.id;
                            log("isEvent :: ${singleItem.isEvent}");

                            for (int j = 0;
                                j < singleItem.timingList.length;
                                j++) {
                              if (singleItem.timingList[j].id == selectedId) {
                                singleItem.timingList[j].isSelected = true;
                              } else {
                                singleItem.timingList[j].isSelected = false;
                              }
                            }
                            screenController.loadUI();
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
                                color:
                                    singleItem.timingList[i].isSelected == true
                                        ? Colors.blue
                                        : null),
                            child: screenController.isServiceSlot.value
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        singleItem.timingList[i].startDateTime,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: singleItem.timingList[i]
                                                        .isSelected ==
                                                    true
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      Text(
                                        "-",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: singleItem.timingList[i]
                                                      .isSelected ==
                                                  true
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ).commonSymmetricPadding(horizontal: 5),
                                      Text(
                                        singleItem.timingList[i].endDateTime,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: singleItem.timingList[i]
                                                      .isSelected ==
                                                  true
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Select",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: singleItem.timingList[i]
                                                      .isSelected ==
                                                  true
                                              ? Colors.white
                                              : Colors.black,
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
    ).commonSymmetricPadding(vertical: 8);
  }
}

/// Available Slot
class AdditionalSlotModule extends StatelessWidget {
  AdditionalSlotModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ResourceCalenderTableModule(),
          screenController.isCalenderShow.value
              ? SelectAdditionalSlotDateModule()
              : Container(),
          const SizedBox(height: 10),
          // screenController.isEvent.value ?  Container() : AnytimeDropDownModule(),
          // const SizedBox(height: 10),
          screenController.isEvent.value
              ? Container()
              : AdditionalSlotDropDownModule(),
          const SizedBox(height: 15),
          AdditionalSlotSubmitButton(),
          // SubmitButtonModule(),
        ],
      ),
    );
  }
}

class AdditionalSlotSubmitButton extends StatelessWidget {
  AdditionalSlotSubmitButton({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // if(/*screenController.selectedTimeValue.value == "Any Time" && */screenController.additionalSlotWorkerList.name == "Select Additional Slot") {
        //   await screenController.getAllResourcesListByIdFunction();
        // }
        if (/*screenController.selectedTimeValue.value == "Any Time" &&*/ screenController
                .additionalSlotWorkerList.name ==
            "Select Additional Slot") {
          await screenController.getAllResourcesListByIdFunction(
              searchType2: SearchType2.anyTimeWise);
        } else if (/*screenController.selectedTimeValue.value == "Any Time" && */ screenController
                .additionalSlotWorkerList.name !=
            "Select Additional Slot") {
          await screenController.getAllResourcesListByIdFunction(
              searchType2: SearchType2.additionalSlotWise);
        }
        // else if(/*screenController.selectedTimeValue.value != "Any Time" &&*/ screenController.additionalSlotWorkerList.name != "Select Additional Slot") {
        //   await screenController.getAllResourcesListByIdFunction(searchType2: SearchType2.anyTimeWithAdditionalSlotWise);
        // }
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
          padding: EdgeInsets.all(12.0),
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

class CalenderTableModule extends StatelessWidget {
  CalenderTableModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

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
            screenController.selectedShowDate.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          /// Calender Image Button
          GestureDetector(
            onTap: () {
              screenController.isServiceCalenderShow.value =
                  !screenController.isServiceCalenderShow.value;

              log("screenController.isCalenderShow.value : ${screenController.isServiceCalenderShow.value}");
            },
            child: const Icon(Icons.calendar_month),
          ),
        ],
      ).commonSymmetricPadding(vertical: 12, horizontal: 10),
    );
  }
}

class ResourceCalenderTableModule extends StatelessWidget {
  ResourceCalenderTableModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

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
            screenController.selectedShowDate.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              screenController.isCalenderShow.value =
                  !screenController.isCalenderShow.value;

              log("screenController.isCalenderShow.value : ${screenController.isCalenderShow.value}");
            },
            child: const Icon(Icons.calendar_month),
          ),
        ],
      ).commonSymmetricPadding(vertical: 12, horizontal: 10),
    );
  }
}

class SelectDateModule extends StatelessWidget {
  SelectDateModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();
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

                String hour = "${selectedDay.hour}";
                String minute = "${selectedDay.minute}";

                /// For Hour Format
                for (int i = 0; i < 10; i++) {
                  if (selectedDay.hour.toString() == i.toString()) {
                    if (selectedDay.hour.toString().length == 1) {
                      hour = "0${selectedDay.hour}";
                    }
                  }
                }

                /// For Minute
                for (int i = 0; i < 10; i++) {
                  if (selectedDay.minute.toString() == i.toString()) {
                    if (selectedDay.minute.toString().length == 1) {
                      minute = "0${selectedDay.minute}";
                    }
                  }
                }

                screenController.selectedTime.value = "$hour:$minute:00";

                screenController.selectedDate.value =
                    "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";
                screenController.selectedShowDate.value =
                    "${selectedDay.day}-${selectedDay.month}-${selectedDay.year}";

                log("screenController.selectedTime.value : ${screenController.selectedTime.value}");
                log("screenController.selectedadte.value : ${screenController.selectedDate.value}");
                // screenController.selectedTime.value = "${selectedDay.hour}:${selectedDay.minute}:${selectedDay.second}";

                screenController.isServiceCalenderShow.value =
                    !screenController.isServiceCalenderShow.value;
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

class SelectAdditionalSlotDateModule extends StatelessWidget {
  SelectAdditionalSlotDateModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();
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

                String selectedDayDummy = selectedDay
                    .toString()
                    .substring(0, selectedDay.toString().length - 14);
                log("selectedDayDummy : $selectedDayDummy");
                String d1 = DateTime.now().toString();

                String todayDateDummy = d1.substring(0, d1.length - 16);
                log("todayDateDummy : $todayDateDummy");

                if (selectedDayDummy == todayDateDummy) {
                  DateTime dummyDate = DateTime.now();
                  String hour = "${dummyDate.hour}";
                  String minute = "${dummyDate.minute}";

                  screenController.selectedDate.value =
                      "${dummyDate.year}-${dummyDate.month}-${dummyDate.day}";

                  /// For Hour Format
                  for (int i = 0; i < 10; i++) {
                    if (dummyDate.hour.toString() == i.toString()) {
                      if (dummyDate.hour.toString().length == 1) {
                        hour = "0${dummyDate.hour}";
                      }
                    }
                  }

                  /// For Minute
                  for (int i = 0; i < 10; i++) {
                    if (dummyDate.minute.toString() == i.toString()) {
                      if (dummyDate.minute.toString().length == 1) {
                        minute = "0${dummyDate.minute}";
                      }
                    }
                  }

                  screenController.selectedTime.value = "$hour:$minute:00";
                } else {
                  String hour = "${selectedDay.hour}";
                  String minute = "${selectedDay.minute}";

                  /// For Hour Format
                  for (int i = 0; i < 10; i++) {
                    if (selectedDay.hour.toString() == i.toString()) {
                      if (selectedDay.hour.toString().length == 1) {
                        hour = "0${selectedDay.hour}";
                      }
                    }
                  }

                  /// For Minute
                  for (int i = 0; i < 10; i++) {
                    if (selectedDay.minute.toString() == i.toString()) {
                      if (selectedDay.minute.toString().length == 1) {
                        minute = "0${selectedDay.minute}";
                      }
                    }
                  }

                  screenController.selectedTime.value = "$hour:$minute:00";
                  screenController.selectedDate.value =
                      "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";
                  screenController.selectedShowDate.value =
                      "${selectedDay.day}-${selectedDay.month}-${selectedDay.year}";

                  log("screenController.selectedDate.value : ${screenController.selectedDate.value}");
                }

                log("screenController.selectedTime.value : ${screenController.selectedTime.value}");

                screenController.isCalenderShow.value =
                    !screenController.isCalenderShow.value;
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

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await screenController.getAllResourcesListByIdFunction(
            searchType2: SearchType2.dateTimeWise);
      },
      child: Container(
        alignment: Alignment.center,
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
              'Submit',
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

// class AnytimeDropDownModule extends StatelessWidget {
//   AnytimeDropDownModule({Key? key}) : super(key: key);
//   final screenController = Get.find<BookAppointmentScreenController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//           ()=> Container(
//         width: Get.width,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: AppColors.colorLightGrey,
//               blurRadius: 5,
//               blurStyle: BlurStyle.outer,
//             ),
//           ],
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<String>(
//             value: screenController.selectedTimeValue.value,
//             items:screenController.timeList
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value,style: const TextStyle(color:Colors.black),),
//               );
//             }).toList(),
//             onChanged: (newValue) {
//               screenController.selectedTimeValue.value = newValue!;
//               log("selectTimeDuration : ${screenController.selectedTimeValue}");
//               // vendorServicesScreenController.loadUI();
//             },
//           ),
//         ).commonSymmetricPadding(horizontal: 5),
//       ),
//     );
//   }
// }

class AdditionalSlotDropDownModule extends StatelessWidget {
  AdditionalSlotDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

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
        child: DropdownButton<AdditionalSlotWorkerList>(
          value: screenController.additionalSlotWorkerList,
          items: screenController.allAdditionalSlotList
              .map<DropdownMenuItem<AdditionalSlotWorkerList>>(
                  (AdditionalSlotWorkerList value) {
            return DropdownMenuItem<AdditionalSlotWorkerList>(
              value: value,
              child: Text(
                value.name!,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            screenController.additionalSlotWorkerList = newValue!;
            log("selectAdditionalSlotDuration : ${screenController.additionalSlotWorkerList.name}");
            screenController.loadUI();
          },
        ),
      ).commonSymmetricPadding(horizontal: 5),
    );
  }
}

class SelectTimeModule extends StatelessWidget {
  SelectTimeModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Time",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          itemCount: screenController.timeList.length,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.9,
          ),
          itemBuilder: (context, i) {
            return Obx(
              () => GestureDetector(
                onTap: () {
                  screenController.selectedTimeIndex.value = i;
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: screenController.selectedTimeIndex.value == i
                          ? AppColors.colorLightGrey1
                          : Colors.white,
                      border: Border.all(
                          color: AppColors.colorLightGrey.withOpacity(0.7),
                          width: 2)),
                  child: Center(
                    child: Text(
                      screenController.timeList[i],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

/// Book Button
class BookButtonModule extends StatelessWidget {
  BookButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (UserDetails.isUserLoggedIn == true) {
          if (screenController.allServicesList.isEmpty) {
            int timeSlotsCount = 0;
            // var servicesCount = screenController.allResourcesList.length;

            for (int i = 0; i < screenController.allResourcesList.length; i++) {
              if (screenController.allResourcesList[i].timingList.isEmpty) {
                timeSlotsCount++;
                log("timeSlotsCount : $timeSlotsCount");
              }
            }

            if (timeSlotsCount == screenController.allResourcesList.length) {
              Fluttertoast.showToast(
                msg: "There is no time slots available to book appointment !",
              );
            } else if (timeSlotsCount !=
                screenController.allResourcesList.length) {
              if (screenController.selectedResourceTimeSlotId == 0) {
                Fluttertoast.showToast(msg: "Please select time slot!");
              } else {
                //api calling
                if (screenController.isServiceSlot.value) {
                  if (screenController.selectedServiceList.isEmpty) {
                    Fluttertoast.showToast(msg: "No services available !");
                  } else {
                    await screenController.bookSelectedSlotFunction(
                        userName: "", email: "");
                  }
                } else {
                  await screenController.bookAvailableTimeSlotFunction(
                      userName: "", email: "");
                }
              }
            }

            // if (screenController.allResourcesList[i].timingList.isEmpty) {
            //   timeSlotsCount++;
            // } else if (screenController
            //     .allResourcesList[i].timingList.isNotEmpty) {
            //
            //   log("else if ----- first ");
            //   log("services are : $servicesCount \n& not available timeslot are : $timeSlotsCount");
            //
            // } else {
            //   log("else ----- first ");
            //   log("services are : $servicesCount \n& not available timeslot are : $timeSlotsCount");
            // }

            //   if (servicesCount == timeSlotsCount) {
            //     log("if ----- second");
            //     log("services are : $servicesCount \n& not available timeslot are : $timeSlotsCount");
            //
            //     var notAvailTimeslotsCount = 0;
            //
            //     Fluttertoast.showToast(
            //       msg: "There is no time slots available to book appointment !",
            //     );

            // } else if (screenController.selectedResourceTimeSlotId == 0) {
            //   log("else second ----");
            //
            //   Fluttertoast.showToast(msg: "Please select time slot!");
            // }

            // else if (screenController.allResourcesList[0].timingList.isEmpty &&
            //     screenController.allResourcesList[0].nextDate.isEmpty) {
            //   Fluttertoast.showToast(
            //       msg: "There is no time slots available to book appointment !");
            // }
          } else {
            if (screenController.isServiceSlot.value) {
              await screenController.bookSelectedSlotFunction(
                  userName: "", email: "");
            } else {
              await screenController.bookAvailableTimeSlotFunction(
                  userName: "", email: "");
            }
            // }
          }
        } else if (UserDetails.isUserLoggedIn == false) {
          if (screenController.selectedResourceTimeSlotId == 0) {
            Fluttertoast.showToast(msg: "Please select time slot!");
          } else {
            await _bottomSheetModule(context);
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
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
              'Book',
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

  /// Bottom sheet
  Future _bottomSheetModule(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Almost there!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: const Icon(Icons.close_rounded),
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 1, color: Colors.grey),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Get.to(() => SignInScreen(),
                            arguments: SignInRoute.fromBookScreen);
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        " to book faster with your saved details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _singleModule(
                    text:
                        "Book appointments and complete online forms faster with saved details"),
                const SizedBox(height: 5),
                _singleModule(text: "Save your favourite healthcare providers"),
                const SizedBox(height: 5),
                _singleModule(text: "Manage your appointments easily"),
                const SizedBox(height: 10),
                _socialMediaModule(),
                const SizedBox(height: 10),
                _signUpModule(),
                const SizedBox(height: 5),
                const Text(
                  "or",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 8),
                guestButtonModule(),
              ],
            ),
          );
        });
  }

  Widget _singleModule({required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.check,
          color: Colors.green,
          // size: 20,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _socialMediaModule() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Tooltip(
          message: "This feature is coming soon",
          preferBelow: true,
          triggerMode: TooltipTriggerMode.tap,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.googleLoginImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: () async {
        //     await screenController.signInWithGoogleFunction();
        //   },
        //   child: Container(
        //     height: 30,
        //     width: 30,
        //     decoration: const BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage(AppImages.googleLoginImg),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
        const SizedBox(width: 60),
        Tooltip(
          message: "This feature is coming soon",
          preferBelow: true,
          triggerMode: TooltipTriggerMode.tap,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.fbLoginImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // GestureDetector(
        //   onTap: () async {
        //     await screenController.signInWithFacebookFunction();
        //   },
        //   child: Container(
        //     height: 30,
        //     width: 30,
        //     decoration: const BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage(AppImages.fbLoginImg),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _signUpModule() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => UserSignUpScreen(),
                    arguments: SignInRoute.fromBookScreen);
              },
              child: const Text(
                "Sign up ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const Text(
          "to book faster next time",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget guestButtonModule() {
    return GestureDetector(
      onTap: () async {
        Get.back();
        if (screenController.isServiceSlot.value) {
          await screenController.bookSelectedSlotFunction(
              userName: "", email: "");
        } else {
          await screenController.bookAvailableTimeSlotFunction(
              userName: "", email: "");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "Continue as guest",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ).commonSymmetricPadding(horizontal: 30, vertical: 15),
      ),
    );
  }
}
