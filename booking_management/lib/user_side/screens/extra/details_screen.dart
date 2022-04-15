import 'dart:developer';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/user_side/controllers/business_details_screen_controller/business_details_screen_controller.dart';
import 'package:booking_management/user_side/screens/extra/details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


final vendorDetailsScreenController = Get.put(DetailsScreenController());
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Obx(()=>
              vendorDetailsScreenController.isLoading.value ?
              const Center(child: CircularProgressIndicator()) :
              Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileModule(),
                  const SizedBox(height: 20,),
                  const TabViewModule(),
                  const SizedBox(height: 20),
                  Expanded(
                    child:
                    vendorDetailsScreenController.isOverviewSelected.value ?
                    OverviewModule() :  const ReviewModule(),
                  )
                ],
              ),
            ),
            const BackArrow()

          ],
        ),
      ),
    );
  }
}

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
          margin: const EdgeInsets.only(top: 15, left: 20),
          child: Image.asset(AppImages.backArrowImg)),
    );
  }
}

class ProfileModule extends StatelessWidget {
  const ProfileModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Image.asset(AppImages.vendorImg, scale: 2.5,)
    );
  }
}

class TabViewModule extends StatelessWidget {
  const TabViewModule({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              vendorDetailsScreenController.isOverviewSelected.value = true;
              vendorDetailsScreenController.isReviewSelected.value = false;
              log('overview : ${vendorDetailsScreenController.isOverviewSelected.value}');
              log('Review : ${vendorDetailsScreenController.isReviewSelected.value}');
            },
            child: Container(
              width: Get.width/4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.colorLightGrey,
                      blurRadius: 5,
                      //spreadRadius: 3,
                      blurStyle: BlurStyle.outer
                  )
                ],
                // border: Border.all(
                //     color: AppColors.colorLightGrey,
                //     width: 2
                // ),
                color: vendorDetailsScreenController.isOverviewSelected.value ? AppColors.colorLightGrey2 : Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric( vertical: 12),
                child: Center(
                  child: Text(
                    'Overview',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          GestureDetector(
            onTap: () {
              vendorDetailsScreenController.isOverviewSelected.value = false;
              vendorDetailsScreenController.isReviewSelected.value = true;
              log('Review : ${vendorDetailsScreenController.isReviewSelected.value}');
              log('Overview : ${vendorDetailsScreenController.isOverviewSelected.value}');
            },
            child: Container(
              width: Get.width/4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.colorLightGrey,
                      blurRadius: 5,
                      //spreadRadius: 3,
                      blurStyle: BlurStyle.outer
                  )
                ],
                // border: Border.all(
                //     color: AppColors.colorLightGrey,
                //     width: 2
                // ),
                color: vendorDetailsScreenController.isReviewSelected.value ? AppColors.colorLightGrey2 : Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: Center(
                  child: Text(
                    'Review',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OverviewModule extends StatelessWidget {
  //OverviewModule ({Key? key}) : super(key: key);
  //UserBusinessDetailsModel ? userBusinessDetailsModel;

  OverviewModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('overview1: ${vendorDetailsScreenController.isOverviewSelected.value}');
    log('review1: ${vendorDetailsScreenController.isReviewSelected.value}');
    return Scaffold(
      body: Center(
        child: Text("Overview"),
      ),
    );
  }
}

class ReviewModule extends StatelessWidget {
  const ReviewModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('overview1: ${vendorDetailsScreenController.isOverviewSelected.value}');
    log('review1: ${vendorDetailsScreenController.isReviewSelected.value}');
    return Scaffold(
      body: Center(
        child: Text("Review"),
      ),
    );
  }

}