import 'package:booking_management/common_modules/constants/app_logos.dart';
import 'package:booking_management/user_side/controllers/user_sign_up_screen_controller/user_sign_up_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_ui/common_controller/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'constants/app_images.dart';

class HeaderLogoModule extends StatelessWidget {
  const HeaderLogoModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      AppLogo.homeLogo,
      height: Get.height * 0.10,
      scale: 0.9,
    );
  }
}

class HeaderTextModule extends StatelessWidget {
  final String name;
  const HeaderTextModule({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }
}

class OrTextModule extends StatelessWidget {
  const OrTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('OR');
  }
}


class SocialMediaLoginModule extends StatelessWidget {
  final UserSignUpScreenController userSignUpScreenController;
  const SocialMediaLoginModule({Key? key, required this.userSignUpScreenController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await userSignUpScreenController.signInWithGoogleFunction();
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.googleLoginImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 60),
        GestureDetector(
          onTap: () async {
            await userSignUpScreenController.signInWithFacebookFunction();
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.fbLoginImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomCircularLoaderModule extends StatelessWidget {
  const CustomCircularLoaderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
    /*return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.white30,
      child: Image.asset(
        AppImages.loadingAnimationGif,
        height: Get.width * 0.50,
        width: Get.width * 0.50,
      ),
    );*/
  }
}
