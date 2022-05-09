import 'package:booking_management/common_ui/common_screens/splash_screen/splash_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_business_document_screen/vendor_business_document_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
      home: SplashScreen(),
    );
  }
}
