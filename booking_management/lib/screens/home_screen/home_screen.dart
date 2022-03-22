import 'package:booking_management/common/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_screen_controller/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderModule(),
              const SizedBox(height: 30),
              Column(
                children: const [
                  SearchCategoryField(),
                  SizedBox(height: 20),
                  SearchLocationField(),
                ],
              ).commonSymmetricPadding(horizontal: 45),
              const SizedBox(height: 30),

              const UpcomingAppointmentModule().commonSymmetricPadding(horizontal: 20),
              const SizedBox(height: 30),
              const FavouriteDoctorsModule().commonSymmetricPadding(horizontal: 20),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
