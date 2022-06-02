import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/custom_drawer/customer_drawer/customer_drawer.dart';
import '../../controllers/home_screen_controller/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomerDrawer(),
      body: Obx(
        () => homeScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const HeaderModule(),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          SearchCategoryField(),
                          const SizedBox(height: 20),
                          SearchLocationField(),
                          const SizedBox(height: 20),
                          SearchButtonModule(),
                        ],
                      ).commonSymmetricPadding(horizontal: 15),
                      const SizedBox(height: 20),

                      UpcomingAppointmentModule().commonSymmetricPadding(horizontal: 20),
                      // const SizedBox(height: 30),
                      PartialCategoryListModule()
                          .commonSymmetricPadding(horizontal: 20),
                      const SizedBox(height: 15),

                      // homeScreenController.favouriteVendorList.isEmpty
                      // ? Container()
                      // : FavouriteDoctorsModule()
                      //     .commonSymmetricPadding(horizontal: 20),
                      // const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
