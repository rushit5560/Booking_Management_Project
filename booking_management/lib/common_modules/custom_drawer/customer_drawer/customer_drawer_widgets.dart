import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_ui/common_controller/custom_drawer_controller/custom_drawer_controller.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/user_side/screens/user_favourite_list_screen/user_favourite_list_screen.dart';
import 'package:booking_management/user_side/screens/user_transactions_screen/user_transactions_screen.dart';
import 'package:booking_management/vendor_side/screens/Privacy_policy_screen/vendor_privacy_policy_screen.dart';
import 'package:booking_management/vendor_side/screens/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../user_side/screens/booking_history_screen/booking_history_screen.dart';
import '../../../user_side/screens/customer_order_list_screen/customer_order_list_screen.dart';
import '../../../user_side/screens/user_change_password_screen/user_change_password_screen.dart';
import '../../../user_side/screens/user_chat_list_screen/user_chat_list_screen.dart';
import '../../../user_side/screens/user_profile_screen/user_profile_screen.dart';
import '../../constants/app_images.dart';

class CustomerDrawerSingleItemModule extends StatelessWidget {
  final String name;
  final String img;
  final CustomerDrawerOption customerDrawerOption;

  CustomerDrawerSingleItemModule({
    Key? key,
    required this.name,
    required this.img,
    required this.customerDrawerOption,
  }) : super(key: key);

  final customDrawerController = Get.find<CustomDrawerController>();
  // final SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        singleItemOnTap(userSettingScreenOption: customerDrawerOption);
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
                      color: AppColors.blackColor,
                      height: 20,
                      width: 20,
                    ),
                    // Image.asset(img, scale: 1),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
      {required CustomerDrawerOption userSettingScreenOption}) async {
    if (userSettingScreenOption == CustomerDrawerOption.profile) {
      Get.to(() => UserProfileScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption == CustomerDrawerOption.chat) {
      Get.to(() => UserChatListScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption == CustomerDrawerOption.orderList) {
      Get.to(() => CustomerOrderListScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption == CustomerDrawerOption.bookingHistory) {
      Get.to(() => BookingHistoryScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption == CustomerDrawerOption.payment) {
    } else if (userSettingScreenOption == CustomerDrawerOption.transaction) {
      Get.to(() => UserTransactionsScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption == CustomerDrawerOption.help) {
    } else if (userSettingScreenOption == CustomerDrawerOption.changePassword) {
      Get.to(() => UserChangePasswordScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption == CustomerDrawerOption.logOut) {
      await customDrawerController.signOutFunction();
    } else if (userSettingScreenOption == CustomerDrawerOption.favourites) {
      Get.to(() => UserFavouriteListScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption == CustomerDrawerOption.login) {
      Get.to(() => SignInScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption ==
        CustomerDrawerOption.termsAndCondition) {
      Get.to(() => TermsAndConditionScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption == CustomerDrawerOption.privacyPolicy) {
      Get.to(() => VendorPrivacyPolicyScreen(), transition: Transition.zoom);
    }
  }
}
