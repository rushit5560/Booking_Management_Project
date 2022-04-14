
import 'package:booking_management/user_side/controllers/business_details_screen_controller/business_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'business_details_screen_widgets.dart';

class BusinessDetailScreen extends StatelessWidget {
  BusinessDetailScreen({Key? key}) : super(key: key);

  final vendorDetailsScreenController = Get.put(BusinessDetailsScreenController());

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
                        child: Obx(()=>
                          vendorDetailsScreenController.isOverviewSelected.value ?
                          OverviewModule() :  const ReviewModule(),
                        ),
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
