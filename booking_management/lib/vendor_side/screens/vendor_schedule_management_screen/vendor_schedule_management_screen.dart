import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/vendor_schedule_management_screen_controller/vendor_schedule_management_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/vendor_available_time_screen/vendor_available_time_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_schedule_management_screen/vendor_schedule_management_screen_widgets.dart';
import 'package:booking_management/vendor_side/screens/vendor_schedule_time_screen/vendor_schedule_time_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorScheduleManagementScreen extends StatelessWidget {
  VendorScheduleManagementScreen({Key? key}) : super(key: key);

  final vendorScheduleManagementScreenController =
      Get.put(VendorScheduleManagementScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => vendorScheduleManagementScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonAppBarModule(
                        title: "Schedule Management",
                        appBarOption: AppBarOption.singleBackButtonOption,
                      ),

                      const SizedBox(height: 15),

                      vendorScheduleManagementScreenController.isTiming.value
                          ? Container(
                              decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                          'To manage schedule please add business timing from ',
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                        text: 'Timings',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.to(
                                                    () =>
                                                        VendorAvailableTimeScreen(),
                                                    transition:
                                                        Transition.zoom)!
                                                .then((value) async {
                                              await vendorScheduleManagementScreenController
                                                  .getTimingFunction();
                                            });
                                          }),
                                    TextSpan(
                                      text: ' page.',
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]),
                                  /*child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "To manage schedule please add business timing from ",
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(()=> VendorAvailableTimeScreen(),
                                        transition: Transition.zoom);
                                      },
                                      child: const Text(
                                        "Timings",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),

                                    Text(
                                      " page.",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),*/
                                ),
                              ),
                            ).commonSymmetricPadding(horizontal: 10)
                          : const SizedBox(),

                      const SizedBox(height: 15),
                      const ScheduleMangementText(),
                      const SizedBox(height: 15),

                      /// Select Start Date Module
                      StartDateSelectModule(),
                      vendorScheduleManagementScreenController
                              .isStartDateCalenderShow.value
                          ? SelectStartDateCalender()
                          : Container(),

                      const SizedBox(height: 10),

                      /// Select End Date Module
                      EndDateSelectModule(),
                      vendorScheduleManagementScreenController
                              .isEndDateCalenderShow.value
                          ? SelectEndDateCalender()
                          : Container(),

                      SelectResourcesModule(),
                      const SizedBox(height: 15),
                      SubmitButton(),

                      const SizedBox(height: 10),

                      /// Search schedule Timing module
                      const SearchScheduleTimingText(),
                      const SizedBox(height: 10),
                      SearchScheduleTimingModule(),
                      vendorScheduleManagementScreenController
                              .isScheduleTimingCalenderShow.value
                          ? ScheduleTimingCalender()
                          : Container(),

                      const SizedBox(height: 15),
                      SearchScheduleSubmitButton(),
                      const SizedBox(height: 15),

                      ResourceScheduleListModule(),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
