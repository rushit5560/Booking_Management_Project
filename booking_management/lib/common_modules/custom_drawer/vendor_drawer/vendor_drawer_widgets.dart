import 'package:booking_management/vendor_side/screens/vendor_available_time_screen/vendor_available_time_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_schedule_time_screen/vendor_schedule_time_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import '../../../user_side/screens/user_change_password_screen/user_change_password_screen.dart';
import '../../../vendor_side/screens/appointment_report_screen/appointment_report_screen.dart';
import '../../../vendor_side/screens/my_customer_screen/my_customer_screen.dart';
import '../../../vendor_side/screens/review_screen/review_screen.dart';
import '../../../vendor_side/screens/vendor_additional_slot_screen/vendor_additional_slot_screen.dart';
import '../../../vendor_side/screens/vendor_booking_history_screen/vendor_booking_history_screen.dart';
import '../../../vendor_side/screens/vendor_business_document_screen/vendor_business_document_screen.dart';
import '../../../vendor_side/screens/vendor_chat_list_screen/vendor_chat_list_screen.dart';
import '../../../vendor_side/screens/vendor_invoice_list_screen/vendor_invoice_list_screen.dart';
import '../../../vendor_side/screens/vendor_profile_screen/vendor_profile_screen.dart';
import '../../../vendor_side/screens/vendor_resources_screen/vendor_resources_screen.dart';
import '../../../vendor_side/screens/vendor_services_screen/vendor_services_screen.dart';
import '../../../vendor_side/screens/vendor_subscription_plan_screen/vendor_subscription_plan_screen.dart';
import '../../../vendor_side/screens/vendor_wallet_screen/vendor_wallet_screen.dart';
import '../../constants/app_images.dart';
import '../../constants/enums.dart';
import '../../sharedpreference_data/sharedpreference_data.dart';


class VendorDrawerSingleItemModule extends StatelessWidget {
  final String name;
  final String img;
  final VendorDrawerOption vendorDrawerOption;

  VendorDrawerSingleItemModule({
    Key? key,
    required this.name,
    required this.img,
    required this.vendorDrawerOption,
  }) : super(key: key);

  final SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        singleItemOnTap(vendorSettingScreenOption: vendorDrawerOption);
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
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(img, scale: 0.85),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(AppImages.rightArrowImg, scale: 0.95),
            ],
          ),
        ),
      ),
    );
  }

  singleItemOnTap({required VendorDrawerOption vendorSettingScreenOption}) {
    if (vendorSettingScreenOption == VendorDrawerOption.profile) {
      Get.to(() => VendorProfileScreen(), transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.myCustomer) {
      Get.to(() => MyCustomerScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.chat) {
      Get.to(() => VendorChatListScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.bookingHistory) {
      Get.to(() => const VendorBookingHistoryScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.wallet) {
      Get.to(() => VendorWalletScreen(), transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.resources) {
      Get.to(() => VendorResourcesScreen(), transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.services) {
      Get.to(() => VendorServicesScreen(), transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.additionalSlot) {
      Get.to(() => VendorAdditionalSlotScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.businessDocument) {
      Get.to(() => VendorBusinessDocumentScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.review) {
      Get.to(() => ReviewScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.subscription) {
      Get.to(() => VendorSubscriptionPlanScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.help) {
      // Get.to(()=> VendorBookingHistoryScreen(), transition: Transition.rightToLeft);
    } else if(vendorSettingScreenOption == VendorDrawerOption.scheduleTime) {
      Get.to(() => VendorScheduleTimeScreen(),
          transition: Transition.rightToLeft);
    } else if(vendorSettingScreenOption == VendorDrawerOption.availableTime) {
      Get.to(() => VendorAvailableTimeScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.changePassword) {
      Get.to(() => UserChangePasswordScreen(),
          transition: Transition.rightToLeft);
    } else if(vendorSettingScreenOption == VendorDrawerOption.invoices) {
      Get.to(() => VendorInvoiceListScreen(),
          transition: Transition.rightToLeft);
    }else if (vendorSettingScreenOption == VendorDrawerOption.logout) {
      sharedPreferenceData.clearUserLoginDetailsFromPrefs();
      Get.offAll(() => SignInScreen(), transition: Transition.rightToLeft);
      Get.snackbar('You Have Successfully Logout', '');
    } else if(vendorSettingScreenOption == VendorDrawerOption.appointmentReport) {
      Get.to(() => AppointmentReportScreen(),
          transition: Transition.rightToLeft);
    }  else if(vendorSettingScreenOption == VendorDrawerOption.invoiceReport) {
      // Get.to(() => UserChangePasswordScreen(),
      //     transition: Transition.rightToLeft);
    } else if(vendorSettingScreenOption == VendorDrawerOption.customerReport) {
      // Get.to(() => UserChangePasswordScreen(),
      //     transition: Transition.rightToLeft);
    }
  }
}