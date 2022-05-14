import 'dart:developer';

import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../controllers/vendor_available_time_screen_controller/vendor_available_time_screen_controller.dart';

class AvailableTimeFormModule extends StatelessWidget {
  AvailableTimeFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAvailableTimeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SundayTimeModule(),
          const SizedBox(height: 10),
          MondayTimeModule(),
          const SizedBox(height: 10),
          TuesdayTimeModule(),
          const SizedBox(height: 10),
          WednesdayTimeModule(),
          const SizedBox(height: 10),
          ThursdayTimeModule(),
          const SizedBox(height: 10),
          FridayTimeModule(),
          const SizedBox(height: 10),
          SaturdayTimeModule(),
          const SizedBox(height: 20),
          SetAvailableTimeButtonModule(),
          const SizedBox(height: 20),
        ],
      ).commonAllSidePadding(10),
    );
  }
}

/// Sunday
class SundayTimeModule extends StatelessWidget {
  SundayTimeModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAvailableTimeScreenController>();
  final SelectTimeClass selectTimeClass = SelectTimeClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 45,
            child: Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: screenController.isSundayOn.value,
                    onChanged: (value) {
                      screenController.isSundayOn.value = !screenController.isSundayOn.value;
                      if(screenController.isSundayOn.value == false) {
                        screenController.sundayStartTime.value = "00:00";
                        screenController.sundayEndTime.value = "00:00";
                      }
                      log("${screenController.isSundayOn.value}");
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Sunday",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 55,
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Start Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {

                          if(screenController.isSundayOn.value == true) {

                            /// Separate Hour & Minute
                            String mainString = screenController.sundayStartTime
                                .value;
                            String hourTime = mainString.substring(
                                0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.sundayStartTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                              () => Text(
                                  screenController.sundayStartTime.value,
                                textAlign: TextAlign.center,
                                      style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                              ).commonAllSidePadding(5),
                            // () => Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       screenController.sundayStartHourTime.value,
                            //       textAlign: TextAlign.center,
                            //       style:
                            //       const TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //
                            //     const Text(
                            //       ":",
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //
                            //     Text(
                            //       screenController.sundayEndMinuteTime.value,
                            //       textAlign: TextAlign.center,
                            //       style:
                            //       const TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //   ],
                            // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "End Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if (screenController.isSundayOn.value == true) {
                            /// Separate Hour & Minute
                            String mainString =
                                screenController.sundayEndTime.value;
                            String hourTime =
                                mainString.substring(0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.sundayEndTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.sundayEndTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                            // () => Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       screenController.sundayEndHourTime.value,
                            //       textAlign: TextAlign.center,
                            //       style:
                            //       const TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //
                            //     const Text(
                            //       ":",
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //
                            //     Text(
                            //       screenController.sundayEndMinuteTime.value,
                            //       textAlign: TextAlign.center,
                            //       style:
                            //       const TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //   ],
                            // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).commonAllSidePadding(5),
    );
  }

}

/// Monday
class MondayTimeModule extends StatelessWidget {
  MondayTimeModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAvailableTimeScreenController>();
  final SelectTimeClass selectTimeClass = SelectTimeClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 45,
            child: Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: screenController.isMondayOn.value,
                    onChanged: (value) {
                      screenController.isMondayOn.value = !screenController.isMondayOn.value;
                      if(screenController.isMondayOn.value == false) {
                        screenController.mondayStartTime.value = "00:00";
                        screenController.mondayEndTime.value = "00:00";
                      }
                      log("${screenController.isMondayOn.value}");
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Monday",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 55,
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Start Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {

                          if(screenController.isMondayOn.value == true) {

                            /// Separate Hour & Minute
                            String mainString = screenController.mondayStartTime
                                .value;
                            String hourTime = mainString.substring(
                                0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.mondayStartTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.mondayStartTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.mondayStartHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.mondayStartMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "End Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if(screenController.isMondayOn.value == true) {


                            /// Separate Hour & Minute
                            String mainString = screenController.mondayEndTime
                                .value;
                            String hourTime = mainString.substring(
                                0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.mondayEndTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.mondayEndTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.mondayEndHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.mondayEndMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).commonAllSidePadding(5),
    );
  }
}

/// TuesDay
class TuesdayTimeModule extends StatelessWidget {
  TuesdayTimeModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAvailableTimeScreenController>();
  final SelectTimeClass selectTimeClass = SelectTimeClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 45,
            child: Row(
              children: [
                Obx(
                      () => Checkbox(
                    value: screenController.isTuesdayOn.value,
                    onChanged: (value) {
                      screenController.isTuesdayOn.value = !screenController.isTuesdayOn.value;
                      if(screenController.isTuesdayOn.value == false) {
                        screenController.tuesdayStartTime.value = "00:00";
                        screenController.tuesdayEndTime.value = "00:00";
                      }
                      log("${screenController.isTuesdayOn.value}");
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Tuesday",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 55,
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Start Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if (screenController.isTuesdayOn.value == true) {
                            /// Separate Hour & Minute
                            String mainString =
                                screenController.tuesdayStartTime.value;
                            String hourTime =
                                mainString.substring(0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.tuesdayStartTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.tuesdayStartTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.tuesdayStartHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.tuesdayStartMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "End Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if (screenController.isTuesdayOn.value == true) {
                            /// Separate Hour & Minute
                            String mainString =
                                screenController.tuesdayEndTime.value;
                            String hourTime =
                                mainString.substring(0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.tuesdayEndTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.tuesdayEndTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.tuesdayEndHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.tuesdayEndMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).commonAllSidePadding(5),
    );
  }
}

/// WednesDay
class WednesdayTimeModule extends StatelessWidget {
  WednesdayTimeModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAvailableTimeScreenController>();
  final SelectTimeClass selectTimeClass = SelectTimeClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 45,
            child: Row(
              children: [
                Obx(
                      () => Checkbox(
                    value: screenController.isWednesdayOn.value,
                    onChanged: (value) {
                      screenController.isWednesdayOn.value = !screenController.isWednesdayOn.value;
                      if(screenController.isWednesdayOn.value == false) {
                        screenController.wednesdayStartTime.value = "00:00";
                        screenController.wednesdayEndTime.value = "00:00";
                      }
                      log("${screenController.isWednesdayOn.value}");
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Wednesday",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 55,
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Start Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if(screenController.isWednesdayOn.value == true) {

                            /// Separate Hour & Minute
                            String mainString = screenController
                                .wednesdayStartTime.value;
                            String hourTime = mainString.substring(
                                0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.wednesdayStartTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.wednesdayStartTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.wednesdayStartHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.wednesdayStartMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "End Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {

                          if(screenController.isWednesdayOn.value == true) {
                            /// Separate Hour & Minute
                            String mainString = screenController
                                .wednesdayEndTime.value;
                            String hourTime = mainString.substring(
                                0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.wednesdayEndTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.wednesdayEndTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.wednesdayEndHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.wednesdayEndMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).commonAllSidePadding(5),
    );
  }
}

/// ThursDay
class ThursdayTimeModule extends StatelessWidget {
  ThursdayTimeModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAvailableTimeScreenController>();
  final SelectTimeClass selectTimeClass = SelectTimeClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 45,
            child: Row(
              children: [
                Obx(
                      () => Checkbox(
                    value: screenController.isThursdayOn.value,
                    onChanged: (value) {
                      screenController.isThursdayOn.value = !screenController.isThursdayOn.value;
                      log("${screenController.isThursdayOn.value}");
                      if(screenController.isThursdayOn.value == false) {
                        screenController.thursdayStartTime.value = "00:00";
                        screenController.thursdayEndTime.value = "00:00";
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Thursday",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 55,
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Start Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if(screenController.isThursdayOn.value == true) {
                            /// Separate Hour & Minute
                            String mainString = screenController
                                .thursdayStartTime.value;
                            String hourTime = mainString.substring(
                                0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.thursdayStartTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.thursdayStartTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.thursdayStartHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.thursdayStartMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "End Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if(screenController.isThursdayOn.value == true) {
                            /// Separate Hour & Minute
                            String mainString = screenController.thursdayEndTime
                                .value;
                            String hourTime = mainString.substring(
                                0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.thursdayEndTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.thursdayEndTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.thursdayEndHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.thursdayEndMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).commonAllSidePadding(5),
    );
  }
}

/// FriDay
class FridayTimeModule extends StatelessWidget {
  FridayTimeModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAvailableTimeScreenController>();
  final SelectTimeClass selectTimeClass = SelectTimeClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 45,
            child: Row(
              children: [
                Obx(
                      () => Checkbox(
                    value: screenController.isFridayOn.value,
                    onChanged: (value) {
                      screenController.isFridayOn.value = !screenController.isFridayOn.value;
                      log("${screenController.isFridayOn.value}");
                      if(screenController.isFridayOn.value == false) {
                        screenController.fridayStartTime.value = "00:00";
                        screenController.fridayEndTime.value = "00:00";
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Friday",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 55,
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Start Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {

                          if(screenController.isFridayOn.value == true) {
                            /// Separate Hour & Minute
                            String mainString = screenController.fridayStartTime
                                .value;
                            String hourTime = mainString.substring(
                                0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.fridayStartTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.fridayStartTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.fridayStartHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.fridayStartMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "End Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if(screenController.isFridayOn.value == true) {

                            /// Separate Hour & Minute
                            String mainString = screenController.fridayEndTime
                                .value;
                            String hourTime = mainString.substring(
                                0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.fridayEndTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.fridayEndTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.fridayEndHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.fridayEndMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).commonAllSidePadding(5),
    );
  }
}

/// SaturDay
class SaturdayTimeModule extends StatelessWidget {
  SaturdayTimeModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAvailableTimeScreenController>();
  final SelectTimeClass selectTimeClass = SelectTimeClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 45,
            child: Row(
              children: [
                Obx(
                      () => Checkbox(
                    value: screenController.isSaturdayOn.value,
                    onChanged: (value) {
                      screenController.isSaturdayOn.value = !screenController.isSaturdayOn.value;
                      log("${screenController.isSaturdayOn.value}");
                      if(screenController.isSaturdayOn.value == false) {
                        screenController.saturdayStartTime.value = "00:00";
                        screenController.saturdayEndTime.value = "00:00";
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Saturday",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 55,
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Start Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if(screenController.isSaturdayOn.value == true) {
                            /// Separate Hour & Minute
                            String mainString = screenController
                                .saturdayStartTime.value;
                            String hourTime = mainString.substring(
                                0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.saturdayStartTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.saturdayStartTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.saturdayStartHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.saturdayStartMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "End Time :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {

                          if(screenController.isSaturdayOn.value == true) {
                            /// Separate Hour & Minute
                            String mainString = screenController.saturdayEndTime
                                .value;
                            String hourTime = mainString.substring(
                                0, mainString.length - 3);
                            String minuteTime = mainString.substring(3);

                            log("Hour : $hourTime");
                            log("Minute : $minuteTime");

                            /// Convert in TimeOfDay
                            TimeOfDay selectedTime = TimeOfDay(
                              hour: int.parse(hourTime),
                              minute: int.parse(minuteTime),
                            );

                            /// Call Time Select Table
                            await selectTimeClass.selectTime(
                              context,
                              selectedTime,
                              AvailableTimeDay.saturdayEndTime,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                                () => Text(
                              screenController.saturdayEndTime.value,
                              textAlign: TextAlign.center,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ).commonAllSidePadding(5),
                                // () => Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       screenController.saturdayEndHourTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     const Text(
                                //       ":",
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //
                                //     Text(
                                //       screenController.saturdayEndMinuteTime.value,
                                //       textAlign: TextAlign.center,
                                //       style:
                                //       const TextStyle(fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ).commonAllSidePadding(5),
                          ),
                        ).commonSymmetricPadding(horizontal: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).commonAllSidePadding(5),
    );
  }
}

/// Set Available Time Button
class SetAvailableTimeButtonModule extends StatelessWidget {
  SetAvailableTimeButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAvailableTimeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(
        screenController.isSundayOn.value == false &&
        screenController.isMondayOn.value == false &&
        screenController.isTuesdayOn.value == false &&
        screenController.isWednesdayOn.value == false &&
        screenController.isThursdayOn.value == false &&
        screenController.isFridayOn.value == false &&
        screenController.isSaturdayOn.value == false
        ) {
          Fluttertoast.showToast(msg: "Please fill details!");
        }
        else if(screenController.isSundayOn.value == true && (screenController.sundayStartTime.value == "00:00" || screenController.sundayEndTime.value == "00:00")) {
          // if(screenController.sundayStartTime.value == "00:00" || screenController.sundayEndTime.value == "00:00") {
            Fluttertoast.showToast(msg: "Please fill details!");
          // }
        }
        else if(screenController.isMondayOn.value && (screenController.mondayStartTime.value == "00:00" || screenController.mondayEndTime.value == "00:00")) {
          // if(screenController.mondayStartTime.value == "00:00" || screenController.mondayEndTime.value == "00:00") {
            Fluttertoast.showToast(msg: "Please fill details!");
          // }
        }
        else if(screenController.isTuesdayOn.value && (screenController.tuesdayStartTime.value == "00:00" || screenController.tuesdayEndTime.value == "00:00")) {
          // if(screenController.tuesdayStartTime.value == "00:00" || screenController.tuesdayEndTime.value == "00:00") {
            Fluttertoast.showToast(msg: "Please fill details!");
          // }
        }
        else if(screenController.isWednesdayOn.value && (screenController.wednesdayStartTime.value == "00:00" || screenController.wednesdayEndTime.value == "00:00")) {
          // if(screenController.wednesdayStartTime.value == "00:00" || screenController.wednesdayEndTime.value == "00:00") {
            Fluttertoast.showToast(msg: "Please fill details!");
          // }
        }
        else if(screenController.isThursdayOn.value && (screenController.thursdayStartTime.value == "00:00" || screenController.thursdayEndTime.value == "00:00")) {
          // if(screenController.thursdayStartTime.value == "00:00" || screenController.thursdayEndTime.value == "00:00") {
            Fluttertoast.showToast(msg: "Please fill details!");
          // }
        }
        else if(screenController.isFridayOn.value && (screenController.fridayStartTime.value == "00:00" || screenController.fridayEndTime.value == "00:00")) {
          // if(screenController.fridayStartTime.value == "00:00" || screenController.fridayEndTime.value == "00:00") {
            Fluttertoast.showToast(msg: "Please fill details!");
          // }
        }
        else if(screenController.isSaturdayOn.value && (screenController.saturdayStartTime.value == "00:00" || screenController.saturdayEndTime.value == "00:00")) {
          // if(screenController.saturdayStartTime.value == "00:00" || screenController.saturdayEndTime.value == "00:00") {
            Fluttertoast.showToast(msg: "Please fill details!");
          // }
        }

        else {
          log("Else Part Go");
          await screenController.setVendorAvailableTimeFunction();
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
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Text(
            'Set Available Time',
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

/// Select Time Function
class SelectTimeClass {
  final screenController = Get.find<VendorAvailableTimeScreenController>();

  selectTime(BuildContext context, selectedTime, availableTimeDay) async {
    log('availableTimeDay : $availableTimeDay');

    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
        selectedTime = timeOfDay;
        log(selectedTime.toString());
        String s1 = selectedTime.toString();
        /// Remove First Sub Part of String
        String s2 = s1.substring(10);
        /// Remove Last Character of String
        String s3 = s2.substring(0, s2.length-1);

        if(availableTimeDay == AvailableTimeDay.sundayStartTime) {
          screenController.sundayStartTime.value = s3;
          log(screenController.sundayStartTime.value);
        } else if(availableTimeDay == AvailableTimeDay.sundayEndTime) {
          screenController.sundayEndTime.value = s3;
          log(screenController.sundayEndTime.value);
        }
        else if(availableTimeDay == AvailableTimeDay.mondayStartTime) {
          screenController.mondayStartTime.value = s3;
          log(screenController.mondayStartTime.value);
        } else if(availableTimeDay == AvailableTimeDay.mondayEndTime) {
          screenController.mondayEndTime.value = s3;
          log(screenController.mondayEndTime.value);
        }
        else if(availableTimeDay == AvailableTimeDay.tuesdayStartTime) {
          screenController.tuesdayStartTime.value = s3;
          log(screenController.tuesdayStartTime.value);
        } else if(availableTimeDay == AvailableTimeDay.tuesdayEndTime) {
          screenController.tuesdayEndTime.value = s3;
          log(screenController.tuesdayEndTime.value);
        }
        else if(availableTimeDay == AvailableTimeDay.wednesdayStartTime) {
          screenController.wednesdayStartTime.value = s3;
          log(screenController.wednesdayStartTime.value);
        } else if(availableTimeDay == AvailableTimeDay.wednesdayEndTime) {
          screenController.wednesdayEndTime.value = s3;
          log(screenController.wednesdayEndTime.value);
        }
        else if(availableTimeDay == AvailableTimeDay.thursdayStartTime) {
          screenController.thursdayStartTime.value = s3;
          log(screenController.thursdayStartTime.value);
        } else if(availableTimeDay == AvailableTimeDay.thursdayEndTime) {
          screenController.thursdayEndTime.value = s3;
          log(screenController.thursdayEndTime.value);
        }
        else if(availableTimeDay == AvailableTimeDay.fridayStartTime) {
          screenController.fridayStartTime.value = s3;
          log(screenController.fridayStartTime.value);
        } else if(availableTimeDay == AvailableTimeDay.fridayEndTime) {
          screenController.fridayEndTime.value = s3;
          log(screenController.fridayEndTime.value);
        }
        else if(availableTimeDay == AvailableTimeDay.saturdayStartTime) {
          screenController.saturdayStartTime.value = s3;
          log(screenController.sundayEndTime.value);
        } else if(availableTimeDay == AvailableTimeDay.saturdayEndTime) {
          screenController.saturdayEndTime.value = s3;
          log(screenController.saturdayEndTime.value);
        }

    }
  }
}