import 'dart:developer';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_logos.dart';
import 'package:booking_management/user_side/controllers/user_sign_up_screen_controller/user_sign_up_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:html/parser.dart';
import '../user_side/controllers/home_screen_controller/home_screen_controller.dart';
import 'constants/app_images.dart';

class HeaderLogoModule extends StatelessWidget {
  const HeaderLogoModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      AppLogo.homeLogo,
      height: Get.height * 0.10,
      scale: 0.9,
      alignment: Alignment.center,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('OR'),
      ],
    );
  }
}

class SocialMediaLoginModule extends StatelessWidget {
  final UserSignUpScreenController userSignUpScreenController;
  const SocialMediaLoginModule(
      {Key? key, required this.userSignUpScreenController})
      : super(key: key);

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
    return Center(
      child: CircularProgressIndicator(color: AppColors.accentColor),
    );
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

class UtilFunctions {
  formatPlaceSearchKeyword({DetailsResponse? details, int? index}) {
    final screenController = Get.find<HomeScreenController>();

    if (details != null && details.result != null) {
      log(details.result!.addressComponents![0].longName!);
      var document = parse(details.result!.adrAddress);

      // variables source data

      // var postalCodeData = document.getElementsByClassName("postal-code");

      // var regionData = document.getElementsByClassName("region");

      // // variables

      // var postalCode = "";
      // var region = "";

      //variable value assign
      // if (postalCodeData.isNotEmpty) {
      //   postalCode = postalCodeData[0].innerHtml;

      //   log(" postal code is  :   $postalCode\n ");
      //   if (regionData.isNotEmpty) {
      //     region = regionData[0].innerHtml;
      //     log("postal region is  :   $postalCode\n$region\n ");
      //   } else {}
      // } else if (regionData.isNotEmpty) {
      //   region = regionData[0].innerHtml;

      //   log("only region is  :  \n$region\n ");
      // }

      // var pinCode = document.getElementsByClassName("postal-code");
      log("place details full body : ${details.result!.adrAddress}");

      screenController.locationFieldController.text =
          screenController.predictions[index!].description.toString();
      // "$postalCode $region";
      // log("pinCode : $pinCode");
      screenController.isLoading(true);
      screenController.predictions.clear();
      screenController.isLoading(false);
    } else {}
  }
}

class CommonWidgets {
  static yesOrNoDialog({
    BuildContext? context,
    String? title,
    String? body,
    Function()? onYesPressed,
    Function()? onNoPressed,
  }) async {
    await showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(title!),
          content: Text(body!),
          actions: <Widget>[
            TextButton(
              onPressed: onNoPressed,
              child: const Text(
                'No',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: onYesPressed,
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
