import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_logos.dart';
import '../../common_controller/splash_screen_controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          ()=> splashScreenController.isLoading.value
          ? const CustomCircularLoaderModule()
          : Center(
            child: Image.network(
              AppLogo.splashLogo,
              width: Get.width * 0.50,
              height: Get.width * 0.50,
            ),
            /*child: Text(
              "Booking Management",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),*/
          ),
        ),
      ),
    );
  }
}
