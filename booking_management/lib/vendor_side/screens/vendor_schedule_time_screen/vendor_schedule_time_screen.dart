import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/vendor_schedule_time_screen_controller/vendor_schedule_time_screen_controller.dart';
import 'vendor_schedule_time_screen_widgets.dart';

class VendorScheduleTimeScreen extends StatefulWidget {
  VendorScheduleTimeScreen({Key? key}) : super(key: key);

  @override
  State<VendorScheduleTimeScreen> createState() =>
      _VendorScheduleTimeScreenState();
}

class _VendorScheduleTimeScreenState extends State<VendorScheduleTimeScreen> {
  final vendorScheduleTimeScreenController =
      Get.put(VendorScheduleTimeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => vendorScheduleTimeScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Resource Schedule",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            ResourcesDropDownModule(),
                            const SizedBox(height: 15),
                            ResourcesTimeTypeModule(),
                            const SizedBox(height: 10),
                            vendorScheduleTimeScreenController
                                        .selectResourceValue.isEvent ==
                                    true
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        vendorScheduleTimeScreenController
                                                    .selectResourceTimeType
                                                    .value ==
                                                "Hours"
                                            ? "Select Date"
                                            : "Select Start Date",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                            const SizedBox(height: 10),
                            TableModule(),
                            const SizedBox(height: 10),
                            vendorScheduleTimeScreenController
                                    .isCalenderShow.value
                                ? ResourcesSelectDateModule()
                                : Container(),
                            const SizedBox(height: 10),
                            vendorScheduleTimeScreenController
                                        .selectResourceValue.isEvent ==
                                    true
                                ? vendorScheduleTimeScreenController
                                            .selectResourceTimeType.value ==
                                        "Hours"
                                    ? const SizedBox()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Select End Date",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                : SizedBox(),
                            vendorScheduleTimeScreenController
                                        .selectResourceTimeType.value ==
                                    "Hours"
                                ? const SizedBox()
                                : SizedBox(height: 10),
                            vendorScheduleTimeScreenController
                                        .selectResourceTimeType.value ==
                                    "Hours"
                                ? const SizedBox()
                                : TableEndModule(),
                            vendorScheduleTimeScreenController
                                    .isEndCalenderShow.value
                                ? vendorScheduleTimeScreenController
                                            .selectResourceTimeType.value ==
                                        "Hours"
                                    ? const SizedBox()
                                    : ResourcesSelectEndDateModule()
                                : Container(),
                            const SizedBox(height: 30),
                            SubmitButtonModule(),
                            const SizedBox(height: 30),

                            vendorScheduleTimeScreenController
                                        .allScheduleTimeList.isEmpty &&
                                    vendorScheduleTimeScreenController
                                        .allScheduleDaysList.isEmpty
                                ? Container()
                                : ScheduleListModule(),
                            const SizedBox(height: 20),
                            vendorScheduleTimeScreenController
                                        .allScheduleTimeList.isEmpty &&
                                    vendorScheduleTimeScreenController
                                        .allScheduleDaysList.isEmpty
                                ? Container()
                                : SaveButtonModule(),
                            const SizedBox(height: 20),
                            // ResourcesListModule(),
                          ],
                        ).commonAllSidePadding(15),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
