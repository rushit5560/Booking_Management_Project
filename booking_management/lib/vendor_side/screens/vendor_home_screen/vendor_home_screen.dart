import 'package:booking_management/common_modules/common_functions.dart';
import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/appointment_details_screen_controller/appointment_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/custom_drawer/vendor_drawer/vendor_drawer.dart';
import '../../controllers/vendor_home_screen_controller/vendor_home_screen_controller.dart';
import 'vendor_home_screen_widgets.dart';

class VendorHomeScreen extends StatelessWidget {
  VendorHomeScreen({Key? key}) : super(key: key);
  final vendorHomeScreenController = Get.put(VendorHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        drawer: VendorDrawer(),
        body: Obx(
          () => vendorHomeScreenController.isLoading.value
              ? const CustomCircularLoaderModule()
              : SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await vendorHomeScreenController
                          .getAppointmentListFunction();
                    },
                    child: Column(
                      children: [
                        VendorHeaderModule(),
                        const SizedBox(height: 10),
                        // SearchAppointmentField().commonSymmetricPadding(horizontal: 45),
                        // const SizedBox(height: 20),
                        // PendingListTextModule().commonSymmetricPadding(horizontal: 25),
                        Obx(
                          () => vendorHomeScreenController.isLoading.value
                              ? const Center(child: CircularProgressIndicator())
                              : Expanded(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      children: [
                                        UserDetails.vendorVerification == false
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.accentColor,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Text(
                                                    "Please complete your business profile to activate the account. If you have done already then your business will be visible to public as soon as the verification process completes from admin.",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(),
                                        const SizedBox(height: 20),
                                        vendorHomeScreenController
                                                .isBookingAvailability.value
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.accentColor,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  child: Text(
                                                    vendorHomeScreenController.bookingAvailabilityString,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        vendorHomeScreenController.isBookingAvailability.value
                                            ? const SizedBox(height: 20)
                                            : Container(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Hello, ${UserDetails.userName}",
                                              maxLines: 2,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ).commonSymmetricPadding(
                                                horizontal: 20),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        PendingListTextModule(
                                                size: 20,
                                                text: "Today Resource Summary")
                                            .commonSymmetricPadding(
                                                horizontal: 20, vertical: 10),
                                        ResourcesModule(),
                                        const SizedBox(height: 10),
                                        PendingListTextModule(
                                                size: 20,
                                                text: "Today Appointment List")
                                            .commonSymmetricPadding(
                                                horizontal: 20, vertical: 10),
                                        TodayAppointmentListModule(),
                                      ],
                                    ).commonSymmetricPadding(horizontal: 20),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
