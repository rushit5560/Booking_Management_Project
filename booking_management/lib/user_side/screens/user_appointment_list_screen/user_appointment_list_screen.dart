import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_appointment_list_screen_controller/user_appointment_list_screen_controller.dart';
import 'package:booking_management/user_side/screens/user_appointment_list_screen/user_appointment_list_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAppointmentListScreen extends StatelessWidget {
  UserAppointmentListScreen({Key? key}) : super(key: key);

  final userAppointmentListScreenController = Get.put(UserAppointmentScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CommonAppBarModule(title: 'Appointment List'),
            // const SizedBox(height: 10),

            Expanded(
              child: Column(
                children: [
                  // SearchAppointmentField(),
                  // SizedBox(height: 30),
                  AppointmentListTextModule(),

                  Obx(
                        ()=> userAppointmentListScreenController.isLoading.value
                        ? const Center(child: CircularProgressIndicator()) :
                    Expanded(
                      child: userAppointmentListScreenController.selectedTabIndex.value == 1
                          ? const AllAppointmentListModule()
                          : userAppointmentListScreenController.selectedTabIndex.value == 2
                          ? const UserPendingAppointmentListModule()
                          : userAppointmentListScreenController.selectedTabIndex.value == 3
                          ? ConfirmAppointmentListModule()
                          : userAppointmentListScreenController.selectedTabIndex.value ==4
                          ? CancelAppointmentListModule()
                          : DoneAppointmentListModule(),
                    ),
                  ),
                ],
              ).commonAllSidePadding(20),
            )

          ],
        ),
      ),
    );
  }
}
