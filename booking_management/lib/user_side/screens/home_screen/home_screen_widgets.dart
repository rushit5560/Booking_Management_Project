import 'dart:async';
import 'dart:developer';
import 'package:booking_management/common_modules/common_functions.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_logos.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/screens/business_details_screen/business_details_screen.dart';
import 'package:booking_management/user_side/screens/user_search_results_screen/user_search_results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/constants/enums.dart';
import '../../controllers/home_screen_controller/home_screen_controller.dart';
import '../../model/home_screen_models/get_all_appointment_list_model.dart';
import '../../model/home_screen_models/get_all_category_model.dart';
import '../../model/home_screen_models/get_favourite_vendor_model.dart';
import 'upcoming_appointment_details_screen/upcoming_appointment_details_screen.dart';

/// Header Logo Module
class HeaderModule extends StatelessWidget {
  const HeaderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.15,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: Get.height * 0.15,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.shapeImg),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.07,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(AppLogo.homeLogo),
                scale: 0.9,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: GestureDetector(
              onTap: () {
                log("Clk");
                // Scaffold.of(context).openDrawer();
                Scaffold.of(context).openDrawer();
              },
              child: Icon(
                Icons.menu_rounded,
                color: Colors.grey.shade600,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Search Field (Category & Name)
/*class SearchCategoryField extends StatelessWidget {
  SearchCategoryField({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
        decoration: const InputDecoration(
          hintText: 'Search category or Name',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          prefixIcon: Icon(
              Icons.search_rounded,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}*/

class SearchCategoryField extends StatelessWidget {
  SearchCategoryField({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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

      child: TypeAheadField(
        suggestionsCallback: (text) async {
          return await screenController.getCategorySearchFunction(text);
        },
        hideSuggestionsOnKeyboardHide: true,
        textFieldConfiguration: TextFieldConfiguration(
          controller: screenController.categoryFieldController,
          onChanged: (value) {
            screenController.loadUI();
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
              size: 18,
            ),
            suffixIcon: screenController.categoryFieldController.text == ""
                ? null
                : IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.grey,
                    iconSize: 20,
                    onPressed: () {
                      screenController.categoryFieldController.clear();
                      screenController.loadUI();
                    },
                  ),
            border: InputBorder.none,
            hintText: 'Service/Business Name',
            hintStyle: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          ),
        ),
        itemBuilder: (context, suggestion) {
          final cat = suggestion!;
          return ListTile(
            title: Text(cat.toString()),
          );
        },
        onSuggestionSelected: (suggestion) {
          screenController.categoryFieldController.text = suggestion.toString();
          log("Text : ${screenController.categoryFieldController.text}");
        },
        noItemsFoundBuilder: (ctx) {
          return const ListTile(
            title: Text(
              "No Service/Business Name Found!",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          );
        },
      ),

      // child: TextFormField(
      //   controller: screenController.categoryFieldController,
      //   cursorColor: Colors.grey,
      //   decoration: const InputDecoration(
      //     hintText: 'Search category or Name',
      //     hintStyle: TextStyle(
      //       color: Colors.grey,
      //       fontSize: 15,
      //     ),
      //     border: InputBorder.none,
      //     isDense: true,
      //     contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      //     prefixIcon: Icon(
      //       Icons.search_rounded,
      //       color: Colors.grey,
      //     ),
      //   ),
      // ),
    );
  }
}

/// Search Location Wise
class SearchLocationField extends StatelessWidget {
  SearchLocationField({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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

      // child: TypeAheadField(
      //   suggestionsCallback: (text) async {
      //     return await screenController.autoCompleteLocationSearch(text);
      // // if (text.isNotEmpty) {
      // //       return screenController.autoCompleteLocationSearch(text);
      // //     } else {
      // //       screenController.predictions.clear();
      // //     }
      //
      //     // if(screenController.debounce?.isActive ?? false) screenController.debounce!.cancel();
      //     // screenController.debounce = Timer(const Duration(milliseconds: 800), () {
      //     //   if (text.isNotEmpty) {
      //     //     screenController.autoCompleteLocationSearch(text);
      //     //   } else {
      //     //     screenController.predictions.clear();
      //     //   }
      //     // }
      //     // );
      //   },
      //   hideSuggestionsOnKeyboardHide: true,
      //   textFieldConfiguration: TextFieldConfiguration(
      //     controller: screenController.locationFieldController,
      //     decoration: const InputDecoration(
      //       prefixIcon: Icon(Icons.search_rounded, color: Colors.grey, size: 18),
      //       border: InputBorder.none,
      //       hintText: 'Search Location',
      //       hintStyle: TextStyle(fontSize: 15, color: Colors.grey,),
      //       contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      //     ),
      //
      //   ),
      //   itemBuilder: (context, String? suggestion) {
      //     final cat = suggestion!;
      //     return ListTile(
      //       title: Text(cat),
      //     );
      //   },
      //   onSuggestionSelected: (String? suggestion) {
      //     screenController.locationFieldController.text = suggestion!;
      //     log("Text : ${screenController.locationFieldController.text}");
      //   },
      // ),

      child: TextFormField(
        controller: screenController.locationFieldController,
        cursorColor: Colors.grey,
        onChanged: (value) {
          if (screenController.debounce?.isActive ?? false)
            screenController.debounce!.cancel();
          screenController.debounce =
              Timer(const Duration(milliseconds: 800), () {
            if (value.isNotEmpty) {
              screenController.autoCompleteLocationSearch(value);
            } else {
              screenController.predictions.clear();
            }
          });

          if (screenController.locationFieldController.text == "") {
            screenController.predictions.clear();
          }

          screenController.loadUI();
        },
        decoration: InputDecoration(
          hintText: 'Location',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Colors.grey,
          ),
          suffixIcon: screenController.locationFieldController.text == ""
              ? null
              : IconButton(
                  icon: const Icon(Icons.close),
                  color: Colors.grey,
                  iconSize: 20,
                  onPressed: () {
                    screenController.locationFieldController.clear();
                    screenController.predictions.clear();
                    screenController.loadUI();
                  },
                ),
        ),
      ),
    );
  }
}

class SearchLocationListModule extends StatelessWidget {
  SearchLocationListModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.predictions.isEmpty
        ? Container()
        : ListView.builder(
            itemCount: screenController.predictions.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () async {
                  final placeId = screenController.predictions[i].placeId;
                  final details =
                      await screenController.googlePlace.details.get(placeId!);

                  screenController.locationFieldController.text =
                      screenController.predictions[i].description.toString();

                  screenController.selectedFromListLatitude =
                      "${details!.result!.geometry!.location!.lat}";
                  screenController.selectedFromListLongitude =
                      "${details.result!.geometry!.location!.lng}";

                  screenController.isLoading(true);
                  screenController.predictions.clear();
                  screenController.isLoading(false);

                  // UtilFunctions().formatPlaceSearchKeyword(
                  //   details: details,
                  //   index: i,
                  // );
                  // DetailsResponse placeDetails = details!;
                  // if (details != null && details.result != null) {
                  //   log(details.result!.addressComponents![0].longName!);
                  //   var document = parse(details.result!.adrAddress);

                  //   var regionNameData =
                  //       document.getElementsByClassName("region");
                  //   var localityData =
                  //       document.getElementsByClassName("locality");
                  //   var postalCodeData =
                  //       document.getElementsByClassName("postal-code");

                  //   // var pinCode = document.getElementsByClassName("postal-code");
                  //   log("place details body : ${details.result!.adrAddress}");

                  //   var region = regionNameData[0].innerHtml;
                  //   var locality = localityData[0].innerHtml;
                  //   var postalCode = postalCodeData[0].innerHtml;

                  //   log("region name : ${region}");
                  //   log("locality : ${locality}");
                  //   log("postal code :${postalCode} ");

                  //   screenController.locationFieldController.text =
                  //       screenController.predictions[i].description.toString();
                  //   // "$postalCode, $region";
                  //   // log("pinCode : $pinCode");
                  //   screenController.isLoading(true);
                  //   screenController.predictions.clear();
                  //   screenController.isLoading(false);
                  // } else {}
                },
                leading: const CircleAvatar(
                  child: Icon(Icons.pin_drop_rounded),
                ),
                title: Text(
                    screenController.predictions[i].description.toString()),
              );
            },
          );
  }
}

/// Search Button
class SearchButtonModule extends StatelessWidget {
  SearchButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if(screenController.categoryFieldController.text.isNotEmpty) {
        Get.to(
          () => UserSearchResultsScreen(),
          arguments: [
            screenController.categoryFieldController.text,
            screenController.locationFieldController.text,
            SearchType.none,
            screenController.selectedFromListLatitude,
            screenController.selectedFromListLongitude,
          ],
        )!
            .then((value) async {
          await screenController.getFavouriteVendorByIdFunction();

          screenController.predictions.clear();

          screenController.locationFieldController.clear();
          screenController.locationFieldController.removeListener(() {});
          screenController.categoryFieldController.clear();
        });
        hideKeyboard();

        // }
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.accentColor,
              boxShadow: [
                BoxShadow(
                  // spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey.shade300,
                  blurStyle: BlurStyle.outer,
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Search',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DatePickerModule extends StatelessWidget {
  const DatePickerModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Row(
        children: [
          Expanded(child: CalenderTableModule()),
          const SizedBox(width: 20),
          SubmitButtonModule(),
        ],
      ),
    );
  }
}

class CalenderTableModule extends StatelessWidget {
  CalenderTableModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 5),
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
          Obx(
            () => Text(
              screenController.selectedDisplayDate.value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
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

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await screenController.getAllUpcomingAppointmentDateWiseFunction();
        //await screenController.getAllResourcesListByIdFunction(searchType2: SearchType2.dateTimeWise);
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

class SelectDateModule extends StatefulWidget {
  SelectDateModule({Key? key}) : super(key: key);

  @override
  State<SelectDateModule> createState() => _SelectDateModuleState();
}

class _SelectDateModuleState extends State<SelectDateModule> {
  final screenController = Get.find<HomeScreenController>();

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

                setState(() {
                  screenController.selectedDisplayDate.value =
                      "${selectedDay.day}-${selectedDay.month}-${selectedDay.year}";
                });

                screenController.selectedDate.value =
                    "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";

                log("screenController.selectedTime.value : ${screenController.selectedTime.value}");
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

/// Upcoming Appointment
class UpcomingAppointmentModule extends StatelessWidget {
  UpcomingAppointmentModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming Appointment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),

        /* const DatePickerModule(),

          const SizedBox(height: 10),
          screenController.isServiceCalenderShow.value
              ? SelectDateModule()
              : Container(),*/

        screenController.allUpcomingAppointmentList.isEmpty
            ? const Center(child: Text('No Upcoming Appointment'))
            : ListView.builder(
                itemCount: screenController.allUpcomingAppointmentList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  UpcomingAppointmentDatum singleItem =
                      screenController.allUpcomingAppointmentList[i];
                  return _upcomingAppointmentListTile(singleItem);
                },
              ),
      ],
    );
  }

  Widget _upcomingAppointmentListTile(UpcomingAppointmentDatum singleItem) {
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
                          singleItem.vendor.businessName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          singleItem.startDateTime,
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
                    id: singleItem.bookingId);
                Get.to(() => UpcomingAppointmentDetailsScreen(),
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

/// All Category List
class PartialCategoryListModule extends StatelessWidget {
  PartialCategoryListModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: screenController.allCategoryList.length == 0
              ? SizedBox(
                  child: Text("No Categories availbale"),
                )
              : GridView.builder(
                  itemCount: screenController.allCategoryList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, i) {
                    CategoryDatum singleItem =
                        screenController.allCategoryList[i];
                    return _categoryListModule(singleItem);
                  },
                ),
        ),
      ],
    );
  }

  Widget _categoryListModule(CategoryDatum singleItem) {
    String imgUrl = ApiUrl.apiImagePath + singleItem.image;
    return GestureDetector(
      onTap: () {
        log("latitude : ${UserDetails.latitude} \nlongitude : ${UserDetails.longitude}");
        Get.to(
          () => UserSearchResultsScreen(),
          transition: Transition.zoom,
          arguments: [
            singleItem.id.toString(),
            "",
            SearchType.categoryWise,
            UserDetails.latitude,
            UserDetails.longitude,
          ],
        )!
            .then((value) async {
          await screenController.getFavouriteVendorByIdFunction();
        });
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
        ),
        child: Column(
          children: [
            Expanded(
              flex: 80,
              child: Container(
                height: 100,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colorLightGrey2,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    imgUrl,
                    errorBuilder: (context, st, ob) {
                      return Image.asset(
                        AppImages.logoImg,
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ).commonAllSidePadding(10),
            ),
            Expanded(
              flex: 20,
              child: Center(
                child: Text(
                  singleItem.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ).commonAllSidePadding(5),
    );
  }
}

/// Favourite Vendor List
class FavouriteVendorsModule extends StatelessWidget {
  FavouriteVendorsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Favourite Vendors',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 130,
          child: GridView.builder(
            itemCount: screenController.favouriteVendorList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, i) {
              FavouriteVendorDetails singleVendor =
                  screenController.favouriteVendorList[i];
              return _favouriteVendorListTile(singleVendor);
            },
          ),
        ),
      ],
    );
  }

  Widget _favouriteVendorListTile(FavouriteVendorDetails singleVendor) {
    String imgUrl = ApiUrl.apiImagePath + singleVendor.businessLogo;
    return GestureDetector(
      onTap: () {
        Get.to(() => BusinessDetailScreen(), arguments: [
          singleVendor.id,
          singleVendor.userId,
          singleVendor.email,
          singleVendor.businessName,
        ])!
            .then((value) async {
          await screenController.getFavouriteVendorByIdFunction();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 3, top: 3, left: 3, right: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 5,
              color: Colors.grey.shade400,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(imgUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        singleVendor.businessName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      /*Text(
                    'Lorem Ipsum',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),*/
                    ],
                  ).commonAllSidePadding(5),
                ),
              ],
            ),
            IconButton(
              onPressed: () async {
                await screenController
                    .addVendorInFavoriteFunction(singleVendor.id);
                // screenController.loadUI();
              },
              icon: const Icon(Icons.favorite_rounded),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
