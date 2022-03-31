import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/business_list_screen_controller/business_list_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'business_list_screen_widgets.dart';

class BusinessListScreen extends StatelessWidget {
  BusinessListScreen({Key? key}) : super(key: key);

  final businessListScreenController = Get.put(BusinessListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Vendor List"),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: "Business List"),

            Obx(()=>
               businessListScreenController.isLoading.value
               ? const Center(child: CircularProgressIndicator()) :
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: BusinessList()),
                  ],
                ).commonAllSidePadding(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
