import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_controller/splash_screen_controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          /*child: Image.asset(
            AppImages.headerLogoImg,
            width: Get.width * 0.50,
            height: Get.width * 0.50,
          ),*/
          child: Text(
            "Booking Management",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
