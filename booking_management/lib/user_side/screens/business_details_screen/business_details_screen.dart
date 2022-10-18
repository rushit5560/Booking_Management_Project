import 'dart:developer';

import 'package:booking_management/user_side/controllers/business_details_screen_controller/business_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'business_details_screen_widgets.dart';

class BusinessDetailScreen extends StatelessWidget {
  BusinessDetailScreen({Key? key}) : super(key: key);
  final vendorDetailsScreenController =
      Get.put(BusinessDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Obx(
              () => vendorDetailsScreenController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: Get.size.height + Get.size.height * 0.1,
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 25,
                              child: ProfileModule(),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              flex: 65,
                              child: Column(
                                children: [
                                  TabViewModule(),
                                  const SizedBox(height: 20),
                                  Expanded(
                                    child: vendorDetailsScreenController
                                            .isOverviewSelected.value
                                        ? OverviewModule()
                                        : ReviewModule(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            const BackArrow()
          ],
        ),
      ),
    );
  }
}
