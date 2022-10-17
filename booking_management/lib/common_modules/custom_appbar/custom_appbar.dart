import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppBarModule extends StatelessWidget {
  final String title;
  final AppBarOption? appBarOption;

  //Function? onTap;

  const CommonAppBarModule({Key? key, required this.title, this.appBarOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          color: AppColors.accentColor
          //color: Colors.grey
          ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftSideButton(),
            appBarOption == AppBarOption.userConversationScreen
                ? Row(
                    children: [
                      /*Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.vendorImg),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),*/
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  )
                : Text(
                    title,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
            rightSideButton(),
          ],
        ),
      ),
    );
  }

  Widget leftSideButton() {
    return GestureDetector(
      onTap: () {
        if (appBarOption == AppBarOption.singleBackButtonOption ||
            appBarOption == AppBarOption.userConversationScreen) {
          Get.back();
        }
      },
      child: SizedBox(
        height: 50,
        width: 50,
        child: appBarOption == AppBarOption.singleBackButtonOption
            ? Image.asset(
                AppImages.backArrowImg,
                color: AppColors.whiteColor,
                scale: 0.85,
              )
            : appBarOption == AppBarOption.userConversationScreen
                ? Image.asset(
                    AppImages.backArrowImg,
                    color: AppColors.whiteColor,
                    scale: 0.85,
                  )
                : appBarOption == AppBarOption.none
                    ? null
                    : Container(),
      ),
    );
  }

  Widget rightSideButton() {
    return const SizedBox(
      height: 50,
      width: 50,
    );
  }
}
