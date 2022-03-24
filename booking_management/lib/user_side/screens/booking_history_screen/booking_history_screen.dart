import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/screens/booking_history_screen/booking_history_screen_widgets.dart';
import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonAppBarModule(title: "Booking History", appBarOption: AppBarOption.singleBackButtonOption),

            Expanded(
              child: BookingHistoryList().commonAllSidePadding(20),
            )
          ],
        ),
      ),
    );
  }
}