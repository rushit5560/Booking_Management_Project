import 'package:booking_management/common_ui/common_screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/user_side/screens/book_appointment_screen/book_appointment_screen.dart';
import 'package:booking_management/user_side/screens/business_details_screen/business_details_screen.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:booking_management/user_side/screens/user_checkout_screen/user_checkout_screen.dart';
import 'package:booking_management/user_side/screens/user_map_screen/user_map_screen.dart';
import 'package:booking_management/user_side/screens/user_profile_screen/user_profile_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_profile_screen/vendor_profile_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_sign_up_screen/vendor_sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_side/screens/user_search_results_screen/user_search_results_screen.dart';
import 'vendor_side/screens/vendor_settings_screen/vendor_settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Booking Management System",
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
