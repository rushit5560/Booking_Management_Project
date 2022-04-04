import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';

import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import 'user_settings_screen_widgets.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(
              title: 'Settings',
              appBarOption: AppBarOption.none,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    SettingScreenSingleItemModule(
                      img: AppImages.profileImg,
                      name: 'Profile',
                      userSettingScreenOption: UserSettingScreenOption.profile,
                    ),
                    SizedBox(height: 20),

                    SettingScreenSingleItemModule(
                      img: AppImages.chatImg,
                      name: 'Chat',
                      userSettingScreenOption: UserSettingScreenOption.chat,
                    ),
                    SizedBox(height: 20),

                    SettingScreenSingleItemModule(
                      img: AppImages.bookingHistoryImg,
                      name: 'Booking History',
                      userSettingScreenOption: UserSettingScreenOption.bookingHistory,
                    ),
                    SizedBox(height: 20),

                    SettingScreenSingleItemModule(
                      img: AppImages.paymentImg,
                      name: 'Payment',
                      userSettingScreenOption: UserSettingScreenOption.payment,
                    ),
                    SizedBox(height: 20),

                    SettingScreenSingleItemModule(
                      img: AppImages.helpImg,
                      name: 'Help',
                      userSettingScreenOption: UserSettingScreenOption.help,
                    ),
                    SizedBox(height: 20),

                    SettingScreenSingleItemModule(
                      img: AppImages.changePasswordImg,
                      name: 'Change Password',
                      userSettingScreenOption: UserSettingScreenOption.changePassword,
                    ),
                    SizedBox(height: 20),

                    SettingScreenSingleItemModule(
                      img: AppImages.logoutImg,
                      name: 'Logout',
                      userSettingScreenOption: UserSettingScreenOption.logOut,
                    ),
                    SizedBox(height: 20),

                  ],
                ).commonAllSidePadding(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
