import 'package:booking_management/vendor_side/screens/vendor_resources_screen/vendor_update_resources_screen/vendor_update_resources_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_modules/common_widgets.dart';
import '../../../../common_modules/constants/app_colors.dart';
import '../../../../common_modules/constants/app_images.dart';
import '../../../controllers/vendor_resources_screen_controller/vendor_update_resources_screen_controller.dart';

class VendorUpdateResourcesScreen extends StatelessWidget {
  VendorUpdateResourcesScreen({Key? key}) : super(key: key);

  final vendorUpdateResourcesScreenController =
      Get.put(VendorUpdateResourcesScreenController());

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit Editing'),
              content: const Text('Do you want to exit editing?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  //return false when click on "NO"
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    vendorUpdateResourcesScreenController.updateFile = null;
                    Get.back();
                    Get.back();
                  },
                  //return true when click on "Yes"
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: Obx(
          () => vendorUpdateResourcesScreenController.isLoading.value
              ? const CustomCircularLoaderModule()
              : SafeArea(
                  child: Column(
                    children: [
                      commonAppbar(title: "Update Resources"),
                      const SizedBox(height: 10),
                      Expanded(child: UpdateResourceFormModule()),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  commonAppbar({required String title}) {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          color: AppColors.accentColor
          //color: Colors.grey
          ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftSideButton(),
            Text(
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget leftSideButton() {
    return GestureDetector(
      onTap: () {
        showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: Get.context!,
          builder: (context) => AlertDialog(
            title: const Text('Exit Editing'),
            content: const Text('Do you want to exit editing?'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                //return false when click on "NO"
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  vendorUpdateResourcesScreenController.updateFile = null;
                  Get.back();
                  Get.back();
                },
                //return true when click on "Yes"
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
      child: SizedBox(
        height: 50,
        width: 50,
        child: Image.asset(AppImages.backArrowImg),
      ),
    );
  }
}
