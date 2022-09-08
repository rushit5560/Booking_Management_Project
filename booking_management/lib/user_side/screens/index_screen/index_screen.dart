import 'dart:developer';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/user_side/screens/user_appointment_list_screen/user_appointment_list_screen.dart';
import 'package:booking_management/user_side/screens/user_chat_list_screen/user_chat_list_screen.dart';
import 'package:booking_management/user_side/screens/user_notification_screen/user_notification_screen.dart';
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
      return UserAppointmentListScreen();
    } else if (indexScreenController.menuIndex.value == 2) {
      return UserNotificationScreen();
    } else {
      return UserChatListScreen();
    }
  }

  Widget naviBar(BuildContext context, changeIndex) {
    return Container(
      height: Get.height * 0.08,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(25),
        //   topRight: Radius.circular(25),
        // ),
        color: AppColors.accentColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          indexScreenController.menuIndex.value == 0
              ? InkWell(
                  onTap: () {
                    changeIndex.call(0);
                    log("${indexScreenController.menuIndex.value}");
                    indexScreenController.menuIndex.value = 0;
                  },
                  child: Container(
                    // margin: const EdgeInsets.only(top: 5),
                    // padding: const EdgeInsets.all(5),
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    //width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.whiteColor.withOpacity(0.28),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.asset(
                            indexScreenController.menuIndex.value == 0
                                ? AppImages.menuHomeImg
                                : AppImages.menuHome1Img,
                            height: 25,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Home",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : InkWell(
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
                      AppImages.menuHomeImg,
                      // indexScreenController.menuIndex.value == 0
                      //     ? AppImages.menuHomeImg
                      //     : AppImages.menuHome1Img
                      // height: 25,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
          /*InkWell(
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
          ),*/

          indexScreenController.menuIndex.value == 2
              ? InkWell(
                  onTap: () {
                    changeIndex.call(0);
                    log("${indexScreenController.menuIndex.value}");
                    indexScreenController.menuIndex.value = 2;
                  },
                  child: Container(
                    // margin: const EdgeInsets.only(top: 5),
                    // padding: const EdgeInsets.all(5),
                    height: 42,

                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    //width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.whiteColor.withOpacity(0.28),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.asset(
                            indexScreenController.menuIndex.value == 2
                                ? AppImages.menuNotificationImg
                                : AppImages.menuNotification1Img,
                            height: 25,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Notification",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    if (UserDetails.isUserLoggedIn == true) {
                      changeIndex.call(2);
                      log("${indexScreenController.menuIndex.value}");

                      indexScreenController.menuIndex.value = 2;
                      // Counter make 0
                      indexScreenController.notiCounter.value = 0;
                    } else {
                      Get.to(() => SignInScreen(), transition: Transition.zoom);
                    }
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            AppImages.menuNotificationImg,
                            // indexScreenController.menuIndex.value == 2
                            //     ? AppImages.menuNotificationImg
                            //     : AppImages.menuNotification1Img,
                            height: 25,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        UserDetails.isUserLoggedIn == true &&
                                indexScreenController.notiCounter.value != 0
                            ? Obx(
                                () => Container(
                                  height: 16,
                                  width: 16,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${indexScreenController.notiCounter.value}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
          indexScreenController.menuIndex.value == 3
              ? InkWell(
                  onTap: () {
                    changeIndex.call(0);
                    log("${indexScreenController.menuIndex.value}");
                    indexScreenController.menuIndex.value = 3;
                  },
                  child: Container(
                    // margin: const EdgeInsets.only(top: 5),
                    // padding: const EdgeInsets.all(5),
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    //width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.whiteColor.withOpacity(0.28),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.asset(AppImages.chatImg,
                              height: 25, color: AppColors.whiteColor),
                          const SizedBox(width: 10),
                          Text(
                            "Chat",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    if (UserDetails.isUserLoggedIn == true) {
                      changeIndex.call(3);
                      log("${indexScreenController.menuIndex.value}");

                      indexScreenController.menuIndex.value = 3;
                    } else {
                      Get.to(() => SignInScreen(), transition: Transition.zoom);
                    }
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      AppImages.chatImg,
                      height: 25,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
