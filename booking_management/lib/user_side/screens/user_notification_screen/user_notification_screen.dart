import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/index_screen_controller/index_screen_controller.dart';
import 'package:booking_management/vendor_side/controllers/vendor_notification_screen_controller/vendor_notification_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_widgets.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import 'user_notification_screen_widgets.dart';

class UserNotificationScreen extends StatelessWidget {
  UserNotificationScreen({Key? key}) : super(key: key);

  final vendorNotificationScreenController =
      Get.put(VendorNotificationScreenController());
  final indexScreenController = Get.find<IndexScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => indexScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CommonAppBarModule(title: 'Notification'),
                    const SizedBox(height: 10),
                    Expanded(
                      child: indexScreenController.notificationList.isEmpty
                          ? const Center(
                              child: Text("No Notification Received!"),
                            )
                          : NotificationListModule().commonAllSidePadding(20),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
