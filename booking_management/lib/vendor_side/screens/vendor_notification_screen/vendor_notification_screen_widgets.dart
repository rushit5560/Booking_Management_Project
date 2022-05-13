import 'package:booking_management/vendor_side/controllers/vendor_notification_screen_controller/vendor_notification_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_images.dart';

class VendorNotificationHeaderModule extends StatelessWidget {
  final String name;
  const VendorNotificationHeaderModule({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    );
  }
}

class VendorNotificationListModule extends StatelessWidget {
  final int count;
  VendorNotificationListModule({Key? key, required this.count}) : super(key: key);

  final screenController = Get.find<VendorNotificationScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 3),
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
                        const Expanded(
                          child: Text(
                            'Lorem Ipsum accept your booking',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '01:22 PM',
                    style: TextStyle(fontSize: 9),
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