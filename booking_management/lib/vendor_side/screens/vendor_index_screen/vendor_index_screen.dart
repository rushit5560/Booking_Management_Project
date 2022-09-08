import 'dart:developer';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/vendor_side/screens/vendor_appointment_list_screen/vendor_appointment_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../controllers/vendor_index_screen_controller/vendor_index_screen_controller.dart';
import '../vendor_chat_list_screen/vendor_chat_list_screen.dart';
import '../vendor_home_screen/vendor_home_screen.dart';
import '../vendor_notification_screen/vendor_notification_screen.dart';

class VendorIndexScreen extends StatelessWidget {
  VendorIndexScreen({Key? key}) : super(key: key);
  final vendorIndexScreenController = Get.put(VendorIndexScreenController());

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

  Widget get getMenuByIndex {
    log("menuIndex -> " +
        vendorIndexScreenController.vendorMenuIndex.toString());

    if (vendorIndexScreenController.vendorMenuIndex.value == 0) {
      return VendorHomeScreen();
    } else if (vendorIndexScreenController.vendorMenuIndex.value == 1) {
      return VendorAppointmentListScreen();
    } else if (vendorIndexScreenController.vendorMenuIndex.value == 2) {
      return VendorNotificationScreen();
    } else {
      return VendorChatListScreen();
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
          vendorIndexScreenController.vendorMenuIndex.value == 0
              ? InkWell(
                  onTap: () {
                    changeIndex.call(0);
                    log("${vendorIndexScreenController.vendorMenuIndex.value}");

                    vendorIndexScreenController.vendorMenuIndex.value = 0;
                  },
                  child: Container(
                    // margin: const EdgeInsets.only(top: 5),
                    // padding: const EdgeInsets.all(5),
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.whiteColor.withOpacity(0.28),
                      // gradient: LinearGradient(
                      //   colors: [
                      //     AppColors.whiteColor.withOpacity(0.4),
                      //     AppColors.colorLightGrey,
                      //   ],
                      //   begin: Alignment.centerLeft,
                      //   end: Alignment.centerRight,
                      // ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            vendorIndexScreenController.vendorMenuIndex.value ==
                                    0
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
                    log("${vendorIndexScreenController.vendorMenuIndex.value}");

                    vendorIndexScreenController.vendorMenuIndex.value = 0;
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      AppImages.menuHomeImg,
                      // vendorIndexScreenController.vendorMenuIndex.value == 0
                      //     ? AppImages.menuHomeImg
                      //     : AppImages.menuHome1Img,
                      height: 25,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
          vendorIndexScreenController.vendorMenuIndex.value == 1
              ? InkWell(
                  onTap: () {
                    changeIndex.call(0);
                    log("${vendorIndexScreenController.vendorMenuIndex.value}");

                    vendorIndexScreenController.vendorMenuIndex.value = 1;
                  },
                  child: Container(
                    // margin: const EdgeInsets.only(top: 5),
                    // padding: const EdgeInsets.all(5),
                    height: 45,
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
                            vendorIndexScreenController.vendorMenuIndex.value ==
                                    1
                                ? AppImages.menuListImg
                                : AppImages.menuList1Img,
                            height: 25,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Appointment",
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
                    changeIndex.call(1);
                    log("${vendorIndexScreenController.vendorMenuIndex.value}");

                    vendorIndexScreenController.vendorMenuIndex.value = 1;
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      AppImages.menuListImg,
                      // vendorIndexScreenController.vendorMenuIndex.value == 1
                      //     ? AppImages.menuListImg
                      //     : AppImages.menuList1Img,
                      height: 25,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
          vendorIndexScreenController.vendorMenuIndex.value == 2
              ? InkWell(
                  onTap: () {
                    changeIndex.call(0);
                    log("${vendorIndexScreenController.vendorMenuIndex.value}");

                    vendorIndexScreenController.vendorMenuIndex.value = 2;
                  },
                  child: Container(
                    // margin: const EdgeInsets.only(top: 5),
                    // padding: const EdgeInsets.all(5),
                    height: 45,
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
                            vendorIndexScreenController.vendorMenuIndex.value ==
                                    2
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
                    changeIndex.call(2);
                    log("${vendorIndexScreenController.vendorMenuIndex.value}");

                    vendorIndexScreenController.vendorMenuIndex.value = 2;
                    vendorIndexScreenController.notiCounter.value = 0;
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            AppImages.menuNotificationImg,
                            // vendorIndexScreenController.vendorMenuIndex.value == 2
                            //     ? AppImages.menuNotificationImg
                            //     : AppImages.menuNotification1Img,
                            height: 25,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        UserDetails.isUserLoggedIn == true &&
                                vendorIndexScreenController.notiCounter.value !=
                                    0
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
                                      "${vendorIndexScreenController.notiCounter.value}",
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
          vendorIndexScreenController.vendorMenuIndex.value == 3
              ? InkWell(
                  onTap: () {
                    changeIndex.call(0);
                    log("${vendorIndexScreenController.vendorMenuIndex.value}");

                    vendorIndexScreenController.vendorMenuIndex.value = 3;
                  },
                  child: Container(
                    // margin: const EdgeInsets.only(top: 5),
                    // padding: const EdgeInsets.all(5),
                    height: 45,
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
                            AppImages.chatImg,
                            height: 25,
                            color: AppColors.whiteColor,
                          ),
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
                    changeIndex.call(3);
                    log("${vendorIndexScreenController.vendorMenuIndex.value}");

                    vendorIndexScreenController.vendorMenuIndex.value = 3;
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      AppImages.chatImg,
                      color: AppColors.whiteColor,
                      height: 25,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  changeIndex(int index) {
    vendorIndexScreenController.vendorMenuIndex.value = index;
  }
}
