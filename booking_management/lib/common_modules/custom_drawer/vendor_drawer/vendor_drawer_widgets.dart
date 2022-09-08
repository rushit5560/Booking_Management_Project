import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_ui/common_controller/custom_drawer_controller/custom_drawer_controller.dart';
import 'package:booking_management/vendor_side/controllers/vendor_home_screen_controller/vendor_home_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/Privacy_policy_screen/vendor_privacy_policy_screen.dart';
import 'package:booking_management/vendor_side/screens/bank_info_screen/bank_info_screen.dart';
import 'package:booking_management/vendor_side/screens/invoice_report_screen/invoice_report_screen.dart';
import 'package:booking_management/vendor_side/screens/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_available_time_screen/vendor_available_time_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_schedule_management_screen/vendor_schedule_management_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_schedule_time_screen/vendor_schedule_time_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_subscription_report_screen/vendor_subscription_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../user_side/screens/user_change_password_screen/user_change_password_screen.dart';
import '../../../vendor_side/screens/appointment_report_screen/appointment_report_screen.dart';
import '../../../vendor_side/screens/customer_report_screen/customer_report_screen.dart';
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

  final customDrawerController = Get.find<CustomDrawerController>();
  final vendorHomeScreenController = Get.find<VendorHomeScreenController>();
  // final SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      img,
                      height: 20,
                      width: 20,
                      color: AppColors.blackColor,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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

  singleItemOnTap(
      {required VendorDrawerOption vendorSettingScreenOption}) async {
    if (vendorSettingScreenOption == VendorDrawerOption.profile) {
      Get.to(() => VendorProfileScreen(), transition: Transition.rightToLeft)!
          .then((value) async {
        await vendorHomeScreenController.getAppointmentListFunction();
      });
    } /*else if (vendorSettingScreenOption == VendorDrawerOption.myCustomer) {
      Get.to(() => MyCustomerScreen(), transition: Transition.rightToLeft);
    }*/
    else if (vendorSettingScreenOption == VendorDrawerOption.chat) {
      Get.to(() => VendorChatListScreen(), transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.bookingHistory) {
      Get.to(() => const VendorBookingHistoryScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.wallet) {
      Get.to(() => VendorWalletScreen(), transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.resources) {
      Get.to(() => VendorResourcesScreen(), transition: Transition.rightToLeft)!
          .then((value) async {
        await vendorHomeScreenController.getAppointmentListFunction();
      });
    } else if (vendorSettingScreenOption == VendorDrawerOption.services) {
      Get.to(() => VendorServicesScreen(), transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.additionalSlot) {
      Get.to(() => VendorAdditionalSlotScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.businessDocument) {
      Get.to(() => VendorBusinessDocumentScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.review) {
      Get.to(() => ReviewScreen(), transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.subscription) {
      Get.to(
        () => VendorSubscriptionPlanScreen(),
        transition: Transition.rightToLeft,
        arguments: SubscriptionOption.drawer,
      );
    } else if (vendorSettingScreenOption == VendorDrawerOption.help) {
      // Get.to(()=> VendorBookingHistoryScreen(), transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.scheduleTime) {
      Get.to(() => VendorScheduleTimeScreen(),
              transition: Transition.rightToLeft)!
          .then((value) async {
        await vendorHomeScreenController.getAppointmentListFunction();
      });
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.scheduleManagement) {
      // if (UserDetails.isSubscription == false) {
      //   Fluttertoast.showToast(
      //     msg: 'Subscription Expired, Purchase any subscription plan',
      //   );
      // } else {
      Get.to(() => VendorScheduleManagementScreen(),
              transition: Transition.rightToLeft)!
          .then((value) async {
        await vendorHomeScreenController.getAppointmentListFunction();
      });
      // }
    } else if (vendorSettingScreenOption == VendorDrawerOption.availableTime) {
      Get.to(() => VendorAvailableTimeScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.changePassword) {
      Get.to(() => UserChangePasswordScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.invoices) {
      Get.to(() => VendorInvoiceListScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.logout) {
      await customDrawerController.signOutFunction();
      // sharedPreferenceData.clearUserLoginDetailsFromPrefs();
      // Get.offAll(() => SignInScreen(), transition: Transition.rightToLeft);
      // Get.snackbar('You Have Successfully Logout', '');
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.appointmentReport) {
      Get.to(() => AppointmentReportScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.invoiceReport) {
      Get.to(() => InvoiceReportScreen(), transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.customerReport) {
      Get.to(() => CustomerReportScreen(), transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.subscriptionReport) {
      Get.to(() => VendorSubscriptionReportScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption == VendorDrawerOption.privacyPolicy) {
      Get.to(() => VendorPrivacyPolicyScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.termsAndCondition) {
      Get.to(() => TermsAndConditionScreen(),
          transition: Transition.rightToLeft);
    } else if (vendorSettingScreenOption ==
        VendorDrawerOption.bankAccountInfo) {
      Get.to(() => BankInfoScreen(), transition: Transition.rightToLeft);
    }
  }
}
