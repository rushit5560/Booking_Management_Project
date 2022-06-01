import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/vendor_notification_screen_controller/vendor_notification_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_widgets.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../../user_side/screens/user_notification_screen/user_notification_screen_widgets.dart';



class VendorNotificationScreen extends StatelessWidget {
  VendorNotificationScreen({Key? key}) : super(key: key);

  final vendorNotificationScreenController = Get.put(VendorNotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => vendorNotificationScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CommonAppBarModule(title: 'Notification'),
              const SizedBox(height: 10),
              Expanded(
                child: vendorNotificationScreenController.notificationList.isEmpty
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
