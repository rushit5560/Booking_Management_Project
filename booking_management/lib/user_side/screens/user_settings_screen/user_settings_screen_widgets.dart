import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/user_side/screens/booking_history_screen/booking_history_screen.dart';
import 'package:booking_management/user_side/screens/user_change_password_screen/user_change_password_screen.dart';
import 'package:booking_management/user_side/screens/user_chat_list_screen/user_chat_list_screen.dart';
import 'package:booking_management/user_side/screens/user_profile_screen/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/enums.dart';

class SettingScreenSingleItemModule extends StatelessWidget {
  final String name;
  final String img;
  final UserSettingScreenOption userSettingScreenOption;

  SettingScreenSingleItemModule({
    Key? key,
    required this.name,
    required this.img,
    required this.userSettingScreenOption,
  }) : super(key: key);

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          singleItemOnTap(userSettingScreenOption: userSettingScreenOption),
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

  singleItemOnTap({required UserSettingScreenOption userSettingScreenOption}) async {
    if (userSettingScreenOption == UserSettingScreenOption.profile) {
      Get.to(() => UserProfileScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption == UserSettingScreenOption.chat) {
      Get.to(() => const UserChatListScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption ==
        UserSettingScreenOption.bookingHistory) {
      Get.to(() => BookingHistoryScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption == UserSettingScreenOption.payment) {
    } else if (userSettingScreenOption == UserSettingScreenOption.help) {
    } else if (userSettingScreenOption == UserSettingScreenOption.changePassword) {
      Get.to(() => UserChangePasswordScreen(), transition: Transition.zoom);
    } else if (userSettingScreenOption == UserSettingScreenOption.logOut) {
      await sharedPreferenceData.clearUserLoginDetailsFromPrefs();
      Get.offAll(() => SignInScreen(), transition: Transition.zoom);
      Get.snackbar('You Have Successfully Logout', '');
    }
  }
}
