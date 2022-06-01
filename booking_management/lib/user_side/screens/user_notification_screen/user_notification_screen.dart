import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_widgets.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../controllers/user_notification_screen_controller/user_notification_screen_controller.dart';
import 'user_notification_screen_widgets.dart';

class UserNotificationScreen extends StatelessWidget {
  UserNotificationScreen({Key? key}) : super(key: key);
  final userNotificationScreenController =
      Get.put(UserNotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => userNotificationScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CommonAppBarModule(title: 'Notification'),
                    const SizedBox(height: 10),
                    Expanded(
                      child: userNotificationScreenController.notificationList.isEmpty
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
