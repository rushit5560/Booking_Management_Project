import 'dart:developer';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
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
    String imgUrl = screenController.bookVendorDetails!.vendor.categories.image;
    return Row(
      children: [
        Expanded(
          flex: 30,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
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
              // const SizedBox(height: 5),

              RatingBar.builder(
                initialRating: double.parse(screenController.bookVendorDetails!.ratting.toString()),
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
              Row(
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
              ),


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

        ListView.builder(
          itemCount: screenController.allServicesList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            BookServiceWorkerList singleItem = screenController.allServicesList[i];
            return _bookingServiceListTile(singleItem);
          },
        ),
      ],
    );
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
            onChanged: (value) {
              singleItem.isSelect = !singleItem.isSelect;
              screenController.loadUI();

              /// Selected Service Add in List
              screenController.selectedServiceList.add(singleItem.id);

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
                const SizedBox(height: 5),
                Text(
                  "From \$${singleItem.price} / ${singleItem.timeDuration} mins"
                ),
              ],
            ),
          ),
        ],
      ).commonAllSidePadding(5),
    ).commonSymmetricPadding(vertical: 6);
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
            BookingResourceWorkerData singleItem = screenController.allResourcesList[i];
            return _resourcesListTile(singleItem);
          },
        ),
      ],
    );
  }

  Widget _resourcesListTile(BookingResourceWorkerData singleItem) {
    String imgUrl = singleItem.image;
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
                  image: DecorationImage(
                    image: NetworkImage(imgUrl),
                    fit: BoxFit.cover,
                  ),
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
                    Text(
                      singleItem.details,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
          const SizedBox(height: 5),
          singleItem.timingList.isEmpty
              ? Container()
              : GridView.builder(
            itemCount: singleItem.timingList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                childAspectRatio: 5
            ),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {

                  /// First All Slot Set Unselected
                  for(int i = 0; i < screenController.allResourcesList.length; i++) {
                    for(int j = 0; j < screenController.allResourcesList[i].timingList.length; j++) {
                      screenController.allResourcesList[i].timingList[j].isSelected = false;
                    }
                  }

                  /// Selected Item Become Blue
                  int selectedId = singleItem.timingList[i].id;
                  screenController.selectedResourceTimeSlotId = selectedId;

                    for(int j=0; j < singleItem.timingList.length; j++) {
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
                    color: singleItem.timingList[i].isSelected == true
                      ? Colors.blue
                        : null
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        singleItem.timingList[i].startDateTime,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: singleItem.timingList[i].isSelected == true
                            ? Colors.white
                              : Colors.black
                        ),
                      ),

                      /*Text(
                        "-",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: singleItem.timingList[i].isSelected == true
                              ? Colors.white
                              : Colors.black,
                        ),
                      ).commonSymmetricPadding(horizontal: 5),*/

                      /*Text(
                        singleItem.timingList[i].endDateTime,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                            color: singleItem.timingList[i].isSelected == true
                                ? Colors.white
                                : Colors.black,
                        ),
                      ),*/
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
      ()=> Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ResourceCalenderTableModule(),
          screenController.isCalenderShow.value
          ? SelectDateModule()
          : Container(),
          const SizedBox(height: 10),
          AnytimeDropDownModule(),
          const SizedBox(height: 10),
          AdditionalSlotDropDownModule(),
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
        if(screenController.selectedTimeValue.value == "Any Time" && screenController.additionalSlotWorkerList.name == "Select Additional Slot") {
          await screenController.getAllResourcesListByIdFunction();
        }
        else if(screenController.selectedTimeValue.value != "Any Time" && screenController.additionalSlotWorkerList.name != "Select Additional Slot") {
          await screenController.getAllResourcesListByIdFunction(searchType2: SearchType2.anyTimeWithAdditionalSlotWise);
        }
        else if(screenController.selectedTimeValue.value != "Any Time" && screenController.additionalSlotWorkerList.name == "Select Additional Slot") {
          await screenController.getAllResourcesListByIdFunction(searchType2: SearchType2.anyTimeWise);
        }
        else if(screenController.selectedTimeValue.value == "Any Time" && screenController.additionalSlotWorkerList.name != "Select Additional Slot") {
          await screenController.getAllResourcesListByIdFunction(searchType2: SearchType2.additionalSlotWise);
        }
      },
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
            ]
        ),
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
            screenController.selectedDate.value,
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
              firstDay: DateTime(2020),
              lastDay: DateTime(2050),
              calendarFormat: format,
              rangeStartDay: DateTime.now(),
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                selectedDay = selectDay;
                focusedDay = focusDay;


                String hour = "${selectedDay.hour}";
                String minute = "${selectedDay.minute}";

                /// For Hour Format
                for(int i = 0; i < 10; i++) {
                  if(selectedDay.hour.toString() == i.toString()) {
                    if(selectedDay.hour.toString().length == 1) {
                      hour = "0${selectedDay.hour}";
                    }
                  }
                }

                /// For Minute
                for (int i = 0; i < 10; i++) {
                  if(selectedDay.minute.toString() == i.toString()) {
                    if(selectedDay.minute.toString().length == 1) {
                      minute = "0${selectedDay.minute}";
                    }
                  }
                }

                screenController.selectedTime.value = "$hour:$minute:00";


                screenController.selectedDate.value = "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";

                log("screenController.selectedTime.value : ${screenController.selectedTime.value}");
                // screenController.selectedTime.value = "${selectedDay.hour}:${selectedDay.minute}:${selectedDay.second}";

                screenController.isServiceCalenderShow.value = !screenController.isServiceCalenderShow.value;
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
        await screenController.getAllResourcesListByIdFunction(searchType2: SearchType2.dateTimeWise);
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
              ]
          ),
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


class AnytimeDropDownModule extends StatelessWidget {
  AnytimeDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookAppointmentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Container(
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
            value: screenController.selectedTimeValue.value,
            items:screenController.timeList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,style: const TextStyle(color:Colors.black),),
              );
            }).toList(),
            onChanged: (newValue) {
              screenController.selectedTimeValue.value = newValue!;
              log("selectTimeDuration : ${screenController.selectedTimeValue}");
              // vendorServicesScreenController.loadUI();
            },
          ),
        ).commonSymmetricPadding(horizontal: 5),
      ),
    );
  }
}

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
          items:screenController.allAdditionalSlotList
              .map<DropdownMenuItem<AdditionalSlotWorkerList>>((AdditionalSlotWorkerList value) {
            return DropdownMenuItem<AdditionalSlotWorkerList>(
              value: value,
              child: Text(value.name!,style: const TextStyle(color:Colors.black),),
            );
          }).toList(),
          onChanged: (newValue) {
            screenController.additionalSlotWorkerList = newValue!;
            log("selectTimeDuration : ${screenController.additionalSlotWorkerList}");
            // vendorServicesScreenController.loadUI();
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
        const Text("Select Time", style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 10,),
        GridView.builder(
          itemCount: screenController.timeList.length,
          shrinkWrap: true,
          physics:  const AlwaysScrollableScrollPhysics(),
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.9,
          ),
          itemBuilder: (context, i) {
            return Obx(()=>
              GestureDetector(
                  onTap: (){
                    screenController.selectedTimeIndex.value = i;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:screenController.selectedTimeIndex.value == i  ? AppColors.colorLightGrey1 : Colors.white,
                        border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
                    ),
                    child: Center(
                      child: Text(screenController.timeList[i], style: const TextStyle(fontWeight: FontWeight.bold),),
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

        if(screenController.selectedResourceTimeSlotId == 0) {
         Fluttertoast.showToast(msg: "Please select time slot!");
        } else {
          if (screenController.isServiceSlot.value) {
            await screenController.bookSelectedSlotFunction();
          } else {
            await screenController.bookAvailableTimeSlotFunction();
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
              ]
          ),
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
}

