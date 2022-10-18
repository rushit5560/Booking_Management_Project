import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/user_side/controllers/user_search_results_screen_controller/user_search_results_screen_controller.dart';
import 'package:booking_management/user_side/screens/business_details_screen/business_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../model/user_search_results_screen_model/get_all_search_vendor_model.dart';
import '../book_appointment_screen/book_appointment_screen.dart';

class SearchCategoryTextField extends StatelessWidget {
  SearchCategoryTextField({Key? key}) : super(key: key);
  final screenController = Get.find<UserSearchResultsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
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
        controller: screenController.categoryFieldController,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Search category or Name',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          suffixIcon: GestureDetector(
            onTap: () async {
              await screenController.getAllSearchVendorListFunction(
                  searchText: screenController.searchText,
                  locationText: screenController.locationText);
            },
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

/*class SearchLocationTextField extends StatelessWidget {
  const SearchLocationTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
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
        //controller: screenController.categoryFieldController,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Search Location',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}*/

class PopularSearchAndDistance extends StatefulWidget {
  const PopularSearchAndDistance({Key? key}) : super(key: key);

  @override
  State<PopularSearchAndDistance> createState() =>
      _PopularSearchAndDistanceState();
}

class _PopularSearchAndDistanceState extends State<PopularSearchAndDistance> {
  final screenController = Get.find<UserSearchResultsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              // Expanded(
              //   child: Container(
              //     height: 45,
              //     //padding: EdgeInsets.all(3),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       boxShadow: [
              //         BoxShadow(
              //           color: AppColors.colorLightGrey.withOpacity(0.5),
              //           blurRadius: 5,
              //           //spreadRadius: 5,
              //           blurStyle: BlurStyle.outer,
              //         ),
              //       ],
              //       //border: Border.all(color: AppColors.colorLightGrey)
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         SizedBox(width: 17,),
              //         Expanded(child: Text("Popular Search", style: TextStyle(fontSize: 12),)),
              //
              //       ],
              //     ),
              //   ),
              // ),

              // const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(right: 8),
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorGreyIconDark.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 1,
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
                        icon: Image.asset(
                          AppImages.dropDownArrowImg,
                          width: 15,
                          color: AppColors.colorGreyIconDark,
                        ),
                        isExpanded: false,
                        focusColor: Colors.white,
                        value: screenController.rating,
                        //elevation: 5,
                        style: TextStyle(color: AppColors.colorGreyIconDark),
                        // iconEnabledColor: Colors.black,
                        items: <String>[
                          'Rating',
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                        ].map<DropdownMenuItem<String>>((String value) {
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
                        onChanged: (newValue) async {
                          setState(() {
                            screenController.rating = newValue!;
                          });

                          if (screenController.searchType ==
                              SearchType.categoryWise) {
                            await screenController
                                .getSearchCategoryWithRatingWiseFunction();
                          } else if (screenController.searchType ==
                              SearchType.none) {
                            await screenController
                                .getAllSearchVendorListRatingWiseFunction(
                                    searchText: screenController
                                        .categoryFieldController.text);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(right: 4),
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorGreyIconDark.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 1,
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
                        icon: Image.asset(
                          AppImages.dropDownArrowImg,
                          width: 15,
                          color: AppColors.colorGreyIconDark,
                        ),
                        isExpanded: true,
                        focusColor: Colors.white,
                        value: screenController.dropdownDistance,
                        //elevation: 5,
                        style: TextStyle(
                          color: AppColors.colorGreyIconDark,
                        ),
                        // iconEnabledColor: Colors.black,
                        items: <String>[
                          'Distance',
                          '1 Km',
                          '5 Km',
                          '10 Km',
                          '15 Km',
                          '20 Km',
                          '25 Km',
                          '50 Km'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              // style: TextStyle(color: AppColors.colorLightGrey),
                            ),
                          );
                        }).toList(),
                        // hint: const Text(
                        //   "Distance",
                        //   style: TextStyle(color: Colors.black, fontSize: 11),
                        // ),
                        onChanged: (newValue) async {
                          setState(() {
                            screenController.dropdownDistance = newValue!;

                            screenController.distance =
                                screenController.dropdownDistance.split(" ")[0];
                          });
                          log("distance is :  ${screenController.distance}");

                          if (screenController.searchType ==
                              SearchType.categoryWise) {
                            await screenController
                                .getSearchCategoryWithRatingWiseFunction();
                          } else if (screenController.searchType ==
                              SearchType.none) {
                            await screenController
                                .getAllSearchVendorListRatingWiseFunction(
                                    searchText: screenController
                                        .categoryFieldController.text);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 12,
                  ),
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorGreyIconDark.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        screenController.selectedDate.value,
                        style: TextStyle(
                          // fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.colorGreyIconDark,
                        ),
                      ),

                      /// Calender Image Button
                      GestureDetector(
                        onTap: () {
                          screenController.isServiceCalenderShow.value =
                              !screenController.isServiceCalenderShow.value;

                          log("screenController.isCalenderShow.value : ${screenController.isServiceCalenderShow.value}");
                        },
                        child: Icon(
                          Icons.calendar_month,
                          color: AppColors.colorGreyIconDark,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          screenController.isServiceCalenderShow.value
              ? SelectDateModule()
              : Container(),
        ],
      ),
    );
  }

  /*Future<void> _selectDate(BuildContext context, DateTime dateTime) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    );
    if (d != null) {
      screenController.isLoading(true);
      screenController.selectedDate = d;
      screenController.isLoading(false);

      if (screenController.searchType == SearchType.categoryWise) {
        await screenController.getSearchCategoryWithRatingWiseFunction();
      } else if (screenController.searchType == SearchType.none) {
        await screenController.getAllSearchVendorListRatingWiseFunction(searchText: screenController.categoryFieldController.text);
      }

      //setState(() {
      // screenController.selectedDate = DateFormat.yMd("en_US").format(d);
      // log(screenController.selectedDate.value);
      //});
    }
  }*/
}

class SelectDateModule extends StatelessWidget {
  SelectDateModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserSearchResultsScreenController>();
  CalendarFormat format = CalendarFormat.month;

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
              onDaySelected: (DateTime selectDay, DateTime focusDay) async {
                screenController.selectedDay = selectDay;
                focusedDay = focusDay;

                String hour = "${screenController.selectedDay.hour}";
                String minute = "${screenController.selectedDay.minute}";

                /// For Hour Format
                for (int i = 0; i < 10; i++) {
                  if (screenController.selectedDay.hour.toString() ==
                      i.toString()) {
                    if (screenController.selectedDay.hour.toString().length ==
                        1) {
                      hour = "0${screenController.selectedDay.hour}";
                    }
                  }
                }

                /// For Minute
                for (int i = 0; i < 10; i++) {
                  if (screenController.selectedDay.minute.toString() ==
                      i.toString()) {
                    if (screenController.selectedDay.minute.toString().length ==
                        1) {
                      minute = "0${screenController.selectedDay.minute}";
                    }
                  }
                }

                screenController.selectedTime.value = "$hour:$minute:00";

                screenController.selectedDate.value =
                    "${screenController.selectedDay.day}-${screenController.selectedDay.month}-${screenController.selectedDay.year}";

                log("screenController.selectedTime.value : ${screenController.selectedTime.value}");
                // screenController.selectedTime.value = "${selectedDay.hour}:${selectedDay.minute}:${selectedDay.second}";

                screenController.isServiceCalenderShow.value =
                    !screenController.isServiceCalenderShow.value;
                screenController.loadUI();

                if (screenController.searchType == SearchType.categoryWise) {
                  await screenController
                      .getSearchCategoryWithRatingWiseFunction();
                } else if (screenController.searchType == SearchType.none) {
                  await screenController
                      .getAllSearchVendorListRatingWiseFunction(
                          searchText:
                              screenController.categoryFieldController.text);
                }
              },

              // Day Changed
              selectedDayPredicate: (DateTime date) {
                return isSameDay(screenController.selectedDay, date);
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

class BusinessListModule extends StatelessWidget {
  BusinessListModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserSearchResultsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Business",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
            itemCount: screenController.searchVendorList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              SearchVendorDatum singleItem =
                  screenController.searchVendorList[index];
              return _vendorListTile(singleItem);
            })
      ],
    );
  }

  Widget _vendorListTile(SearchVendorDatum singleItem) {
    String imgUrl = ApiUrl.apiImagePath + singleItem.businessLogo;
    log("Business Logo : $imgUrl");
    return GestureDetector(
      onTap: () {
        Get.to(() => BusinessDetailScreen(), arguments: [
          singleItem.id,
          singleItem.userId,
          singleItem.email,
          singleItem.businessName,
        ]);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.colorLightGrey.withOpacity(0.5),
              blurRadius: 5,
              //spreadRadius: 5,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(AppImages.vendorImg),
                                ),
                              ),
                              SizedBox(width: 15,),

                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Lorem Ipsum", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                                    Row(
                                      children: [
                                        Text("4.5", style: TextStyle(fontSize: 12),),
                                        SizedBox(width: 5,),
                                        RatingBar.builder(
                                          initialRating: 5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20,
                                          //itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                          itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            // if (kDebugMode) {
                                            //   print(rating);
                                            // }
                                          },
                                        )

                                      ],
                                    ),
                                    Text("Lorem Ipsum is simply dummy text of the printing", maxLines: 1),

                                    Text("Location - 1156, Lorem Soc. simply dummy text of the printing", maxLines: 1,
                                    style: TextStyle(fontWeight: FontWeight.w500),),


                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.asset(AppImages.rightArrowImg),
                        )*/
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    height: 125,
                    width: 125,
                    errorBuilder: (context, st, ob) {
                      return Image.asset(
                        AppImages.logoImg,
                        fit: BoxFit.cover,
                        height: 125,
                        width: 125,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          // flex:3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                singleItem.businessName,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      // Text(
                                      //   singleItem.rating.toString(),
                                      //   style: const TextStyle(fontSize: 12),
                                      // ),
                                      // const SizedBox(width: 5),
                                      RatingBar.builder(
                                        initialRating: double.parse(
                                            singleItem.rating.toString()),
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
                                      )
                                    ],
                                  ),
                                  /*screenController.distance == "Distance"
                                      ? Container()
                                      : Text(
                                          "${screenController.distance} km",
                                          style: const TextStyle(fontSize: 13),
                                        ),*/
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Location - ${singleItem.address}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: singleItem.workingHoursStatus ==
                                                "Close"
                                            ? Colors.red
                                            : Colors.green),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                      flex: 20,
                                      child: Text(
                                        singleItem.workingHoursStatus == "Close"
                                            ? "Close"
                                            : "Open",
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Expanded(
                        //   flex: 1,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Get.to(()=> BusinessDetailScreen(),
                        //       arguments: singleItem.id);
                        //     },
                        //       child: Image.asset(AppImages.rightArrowImg),
                        //   ),
                        // ),
                      ],
                    ),

                    /*Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Container(
                                  height:8, width: 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Expanded(
                                  flex: 20,
                                  child: Text("Open - Available Time 08.30 AM",maxLines: 1, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),))
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text("0.5 km away", style: TextStyle(
                              fontSize: 12
                          ),),
                        )
                      ],
                    ),*/

                    const SizedBox(height: 2),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => BookAppointmentScreen(),
                          arguments: singleItem.id,
                        );
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
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'BOOK APPOINTMENT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
