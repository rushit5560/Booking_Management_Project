import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      home: VendorSettingsScreen(),
    );
  }
}
