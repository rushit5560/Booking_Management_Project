import 'package:booking_management/vendor_side/controllers/vendor_notification_screen_controller/vendor_notification_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../../user_side/model/booking_success_screen_model/notification_get_model.dart';



class VendorNotificationHeaderModule extends StatelessWidget {
  final String name;
  const VendorNotificationHeaderModule({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(color: Colors.grey, fontSize: 16),
    );
  }
}

class VendorNotificationListModule extends StatelessWidget {
  VendorNotificationListModule({Key? key}) : super(key: key);

  final screenController = Get.find<VendorNotificationScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.notificationList.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        NotificationData singleItem = screenController.notificationList[i];

        String dateTime = screenController.notificationList[i].dateTime;

        String date = dateTime.substring(0,dateTime.length - 9);
        String time = dateTime.substring(11, dateTime.length - 3);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.menuNotification1Img,
                          scale: 0.85,
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            singleItem.message,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        date,
                        style: const TextStyle(fontSize: 9),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        time,
                        style: const TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}