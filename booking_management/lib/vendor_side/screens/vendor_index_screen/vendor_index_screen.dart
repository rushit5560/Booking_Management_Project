import 'dart:developer';
import 'package:booking_management/vendor_side/screens/vendor_appointment_list_screen/vendor_appointment_list_screen.dart';
import 'package:flutter/cupertino.dart';
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
        color: AppColors.colorLightGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          vendorIndexScreenController.vendorMenuIndex.value == 0 ?
          InkWell(
            onTap: () {
              changeIndex.call(0);
              log("${vendorIndexScreenController.vendorMenuIndex.value}");

              vendorIndexScreenController.vendorMenuIndex.value = 0;
            },
            child: Container(
              // margin: const EdgeInsets.only(top: 5),
              // padding: const EdgeInsets.all(5),
              height: 35,
              //width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image.asset(
                        vendorIndexScreenController.vendorMenuIndex.value == 0
                            ? AppImages.menuHomeImg
                            : AppImages.menuHome1Img,
                        scale: 1, ),
                    SizedBox(width: 15),
                    Text("Home", style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),)
                  ],
                ),
              ),
            ),
          ):
          InkWell(
            onTap: () {
              changeIndex.call(0);
              log("${vendorIndexScreenController.vendorMenuIndex.value}");

              vendorIndexScreenController.vendorMenuIndex.value = 0;
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                vendorIndexScreenController.vendorMenuIndex.value == 0
                    ? AppImages.menuHomeImg
                    : AppImages.menuHome1Img,
                scale: 0.9,
              ),
            ),
          ),

          vendorIndexScreenController.vendorMenuIndex.value == 1 ?
          InkWell(
            onTap: () {
              changeIndex.call(0);
              log("${vendorIndexScreenController.vendorMenuIndex.value}");

              vendorIndexScreenController.vendorMenuIndex.value = 1;
            },
            child: Container(
              // margin: const EdgeInsets.only(top: 5),
              // padding: const EdgeInsets.all(5),
              height: 35,
              //width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image.asset(
                      vendorIndexScreenController.vendorMenuIndex.value == 1
                          ? AppImages.menuListImg
                          : AppImages.menuList1Img,
                      scale: 1, ),
                    SizedBox(width: 15),
                    Text("Appointment", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade800),)
                  ],
                ),
              ),
            ),
          ):
          InkWell(
            onTap: () {
              changeIndex.call(1);
              log("${vendorIndexScreenController.vendorMenuIndex.value}");

              vendorIndexScreenController.vendorMenuIndex.value = 1;
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                vendorIndexScreenController.vendorMenuIndex.value == 1
                    ? AppImages.menuListImg
                    : AppImages.menuList1Img,
                scale: 0.9,
              ),
            ),
          ),

          vendorIndexScreenController.vendorMenuIndex.value == 2 ?
          InkWell(
            onTap: () {
              changeIndex.call(0);
              log("${vendorIndexScreenController.vendorMenuIndex.value}");

              vendorIndexScreenController.vendorMenuIndex.value = 2;
            },
            child: Container(
              // margin: const EdgeInsets.only(top: 5),
              // padding: const EdgeInsets.all(5),
              height: 35,
              //width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image.asset(
                      vendorIndexScreenController.vendorMenuIndex.value == 2
                          ? AppImages.menuNotificationImg
                          : AppImages.menuNotification1Img,
                      scale: 1, ),
                    SizedBox(width: 15),
                    Text("Notification", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade800),)
                  ],
                ),
              ),
            ),
          ):
          InkWell(
            onTap: () {
              changeIndex.call(2);
              log("${vendorIndexScreenController.vendorMenuIndex.value}");

              vendorIndexScreenController.vendorMenuIndex.value = 2;
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                  vendorIndexScreenController.vendorMenuIndex.value == 2
                      ? AppImages.menuNotificationImg
                      : AppImages.menuNotification1Img,
                  scale: 0.9),
            ),
          ),

          vendorIndexScreenController.vendorMenuIndex.value == 3 ?
          InkWell(
            onTap: () {
              changeIndex.call(0);
              log("${vendorIndexScreenController.vendorMenuIndex.value}");

              vendorIndexScreenController.vendorMenuIndex.value = 3;
            },
            child: Container(
              // margin: const EdgeInsets.only(top: 5),
              // padding: const EdgeInsets.all(5),
              height: 35,
              //width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.chatImg,
                      scale: 1,
                      color: vendorIndexScreenController.vendorMenuIndex.value == 3
                          ? AppColors.colorGreyIconDark
                          : AppColors.colorGreyIconLight,),
                    SizedBox(width: 15),
                    Text("Chat", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade800),)
                  ],
                ),
              ),
            ),
          ):
          InkWell(
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
                scale: 0.9,
                color: vendorIndexScreenController.vendorMenuIndex.value == 3
                    ? AppColors.colorGreyIconDark
                    : AppColors.colorGreyIconLight,
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
