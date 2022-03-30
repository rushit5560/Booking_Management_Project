import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/vendor_booking_history_screen/vendor_booking_history_screen_widgets.dart';
import 'package:flutter/material.dart';

class VendorBookingHistoryScreen extends StatelessWidget {
  const VendorBookingHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonAppBarModule(title: "Booking History", appBarOption: AppBarOption.singleBackButtonOption),

            Expanded(
              child: const VendorBookingHistoryList().commonAllSidePadding(20),
            )
          ],
        ),
      ),
    );
  }
}
