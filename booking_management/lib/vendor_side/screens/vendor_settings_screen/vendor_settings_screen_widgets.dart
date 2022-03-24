import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/constants/enums.dart';
import '../../controllers/vendor_settings_screen_controller/vendor_settings_screen_controller.dart';

VendorSettingsScreenController screenController = Get.find<VendorSettingsScreenController>();

class VendorSettingScreenSingleItemModule extends StatelessWidget {
  final String name;
  final String img;
  final VendorSettingScreenOption vendorSettingScreenOption;

  const VendorSettingScreenSingleItemModule({
    Key? key,
    required this.name,
    required this.img,
    required this.vendorSettingScreenOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          singleItemOnTap(vendorSettingScreenOption: vendorSettingScreenOption),
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

  singleItemOnTap(
      {required VendorSettingScreenOption vendorSettingScreenOption}) {
    if (vendorSettingScreenOption == VendorSettingScreenOption.profile) {
    } else if (vendorSettingScreenOption == VendorSettingScreenOption.chat) {
    } else if (vendorSettingScreenOption ==
        VendorSettingScreenOption.bookingHistory) {
    } else if (vendorSettingScreenOption == VendorSettingScreenOption.wallet) {
    } else if (vendorSettingScreenOption ==
        VendorSettingScreenOption.resources) {
    } else if (vendorSettingScreenOption ==
        VendorSettingScreenOption.subscription) {
    } else if (vendorSettingScreenOption == VendorSettingScreenOption.help) {
    } else if (vendorSettingScreenOption ==
        VendorSettingScreenOption.changePassword) {
    } else if (vendorSettingScreenOption == VendorSettingScreenOption.logout) {}
  }
}