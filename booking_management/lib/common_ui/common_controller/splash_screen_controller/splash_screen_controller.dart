import 'dart:async';

import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  goToNextScreen() {
    Get.offAll(()=> SignInScreen(), transition: Transition.circularReveal);
  }

  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () => goToNextScreen());
    super.onInit();
  }
}