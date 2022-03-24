import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';

import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import 'vendor_notification_screen_widgets.dart';

class VendorNotificationScreen extends StatelessWidget {
  const VendorNotificationScreen({Key? key}) : super(key: key);

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
                    VendorNotificationHeaderModule(name: 'Today'),
                    SizedBox(height: 10),
                    VendorNotificationListModule(count: 2),
                    SizedBox(height: 10),
                    VendorNotificationHeaderModule(name: '21-02-2022'),
                    SizedBox(height: 10),
                    VendorNotificationListModule(count: 15),
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