import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/user_side/controllers/user_profile_screen_controller/user_profile_screen_controller.dart';
import 'package:booking_management/user_side/screens/user_profile_screen/user_profile_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  final userProfileScreenController = Get.put(UserProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => userProfileScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CommonAppBarModule(
                      title: "Profile",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    Expanded(
                      child: ProfileDetailsModule(),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
