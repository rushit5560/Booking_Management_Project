import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_images.dart';
import '../../common_controller/splash_screen_controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            AppImages.splashAnimationGif,
            width: Get.width * 0.50,
            height: Get.width * 0.50,
          ),
        ),
      ),
    );
  }
}
