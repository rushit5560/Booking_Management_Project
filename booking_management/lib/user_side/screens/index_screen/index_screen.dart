import 'dart:developer';
import 'package:booking_management/user_side/screens/business_list_screen/business_list_screen.dart';
import 'package:booking_management/user_side/screens/user_notification_screen/user_notification_screen.dart';
import 'package:booking_management/user_side/screens/user_settings_screen/user_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../controllers/index_screen_controller/index_screen_controller.dart';
import '../home_screen/home_screen.dart';


class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          child: getMenuByIndex,
        ),
      ),
      bottomNavigationBar: Obx(() => naviBar(context, changeIndex)),
    );
  }

  changeIndex(int index) {
    indexScreenController.menuIndex.value = index;
  }

  Widget get getMenuByIndex {
    log("menuIndex -> " + indexScreenController.menuIndex.toString());

    if (indexScreenController.menuIndex.value == 0) {
      return HomeScreen();
    } else if (indexScreenController.menuIndex.value == 1) {
      return const BusinessListScreen();
    } else if (indexScreenController.menuIndex.value == 2) {
      return const UserNotificationScreen();
    } else {
      return const UserSettingsScreen();
    }
  }

  Widget naviBar(BuildContext context, changeIndex) {
    return Container(
      height: Get.height * 0.07,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: AppColors.colorLightGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              changeIndex.call(0);
              log("${indexScreenController.menuIndex.value}");

              indexScreenController.menuIndex.value = 0;
            },
            child: SizedBox(
              // margin: const EdgeInsets.only(top: 5),
              // padding: const EdgeInsets.all(5),
              height: 30,
              width: 30,
              child: Image.asset(
                  indexScreenController.menuIndex.value == 0
                      ? AppImages.menuHomeImg
                      : AppImages.menuHome1Img,
                  scale: 0.9),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(1);
              log("${indexScreenController.menuIndex.value}");

              indexScreenController.menuIndex.value = 1;
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                indexScreenController.menuIndex.value == 1
                    ? AppImages.menuListImg
                    : AppImages.menuList1Img,
                scale: 0.9,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(2);
              log("${indexScreenController.menuIndex.value}");

              indexScreenController.menuIndex.value = 2;
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                  indexScreenController.menuIndex.value == 2
                      ? AppImages.menuNotificationImg
                      : AppImages.menuNotification1Img,
                  scale: 0.9),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(3);
              log("${indexScreenController.menuIndex.value}");

              indexScreenController.menuIndex.value = 3;
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                indexScreenController.menuIndex.value == 3
                    ? AppImages.menuSettingImg
                    : AppImages.menuSetting1Img,
                  scale: 0.9
              ),
            ),
          ),
        ],
      ),
    );
  }
}
