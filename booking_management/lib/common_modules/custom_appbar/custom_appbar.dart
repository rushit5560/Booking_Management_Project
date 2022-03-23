
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppBarModule extends StatelessWidget {
  final String title;
  final AppBarOption ? appBarOption;
  //Function? onTap;

  const CommonAppBarModule(
      {Key? key, required this.title, this.appBarOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
          color: AppColors.colorLightGrey
        //color: Colors.grey
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftSideButton(context),


            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),


            rightSideButton(),
          ],
        ),
      ),
    );
  }

  Widget leftSideButton(BuildContext context){
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: SizedBox(
        height: 50,
        width: 50,
        child: appBarOption == AppBarOption.singleBackButtonOption ?
        Image.asset(AppImages.backArrowImg) : Container(),
      ),
    );
  }

  Widget rightSideButton(){
    return SizedBox(
      height: 50,
      width: 50,
    );
  }
}
