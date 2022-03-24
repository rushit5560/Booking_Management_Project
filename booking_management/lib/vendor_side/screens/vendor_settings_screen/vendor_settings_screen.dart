import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../controllers/vendor_settings_screen_controller/vendor_settings_screen_controller.dart';
import 'vendor_settings_screen_widgets.dart';

class VendorSettingsScreen extends StatelessWidget {
  VendorSettingsScreen({Key? key}) : super(key: key);
  final vendorSettingsScreenController = Get.put(VendorSettingsScreenController());

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
                  children: const [

                    VendorSettingScreenSingleItemModule(
                      img: AppImages.profileImg,
                      name: 'Profile',
                      vendorSettingScreenOption: VendorSettingScreenOption.profile,
                    ),
                    SizedBox(height: 20),

                    VendorSettingScreenSingleItemModule(
                      img: AppImages.chatImg,
                      name: 'Chat',
                      vendorSettingScreenOption: VendorSettingScreenOption.chat,
                    ),
                    SizedBox(height: 20),

                    VendorSettingScreenSingleItemModule(
                      img: AppImages.bookingHistoryImg,
                      name: 'Booking History',
                      vendorSettingScreenOption: VendorSettingScreenOption.bookingHistory,
                    ),
                    SizedBox(height: 20),

                    VendorSettingScreenSingleItemModule(
                      img: AppImages.paymentImg,
                      name: 'Wallet',
                      vendorSettingScreenOption: VendorSettingScreenOption.wallet,
                    ),
                    SizedBox(height: 20),

                    VendorSettingScreenSingleItemModule(
                      img: AppImages.resourcesImg,
                      name: 'Resources',
                      vendorSettingScreenOption: VendorSettingScreenOption.resources,
                    ),
                    SizedBox(height: 20),

                    VendorSettingScreenSingleItemModule(
                      img: AppImages.subscriptionsImg,
                      name: 'Subscriptions',
                      vendorSettingScreenOption: VendorSettingScreenOption.subscription,
                    ),
                    SizedBox(height: 20),

                    VendorSettingScreenSingleItemModule(
                      img: AppImages.helpImg,
                      name: 'Help',
                      vendorSettingScreenOption: VendorSettingScreenOption.help,
                    ),
                    SizedBox(height: 20),

                    VendorSettingScreenSingleItemModule(
                      img: AppImages.changePasswordImg,
                      name: 'Change Password',
                      vendorSettingScreenOption: VendorSettingScreenOption.changePassword,
                    ),
                    SizedBox(height: 20),

                    VendorSettingScreenSingleItemModule(
                      img: AppImages.logoutImg,
                      name: 'logout',
                      vendorSettingScreenOption: VendorSettingScreenOption.logout,
                    ),
                    // SizedBox(height: 20),


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
