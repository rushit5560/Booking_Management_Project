import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/user_side_screens/index_screen/index_screen.dart';


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
