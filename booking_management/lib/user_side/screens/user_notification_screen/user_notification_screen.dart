import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';

import '../../../common_modules/custom_appbar/custom_appbar.dart';
import 'user_notification_screen_widgets.dart';

class UserNotificationScreen extends StatelessWidget {
  const UserNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CommonAppBarModule(title: 'Notification', appBarOption: AppBarOption.singleBackButtonOption),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    NotificationHeaderModule(name: 'Today'),
                    SizedBox(height: 10),
                    NotificationListModule(count: 2),
                    SizedBox(height: 10),
                    NotificationHeaderModule(name: '21-02-2022'),
                    SizedBox(height: 10),
                    NotificationListModule(count: 15),
                  ],
                ).commonAllSidePadding(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
