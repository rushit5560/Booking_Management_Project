import 'package:booking_management/screens/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/index_screen/index_screen.dart';
import 'screens/user_sign_up_screen/user_sign_up_screen.dart';


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
      home: IndexScreen(),
    );
  }
}
