import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
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
      drawer: CustomerDrawer(),
      body: Obx(
        () => homeScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const HeaderModule(),
                      const SizedBox(height: 10),
                      UserDetails.isUserLoggedIn == true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello, " + UserDetails.userName,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ).commonSymmetricPadding(horizontal: 15),
                              ],
                            )
                          : Container(),
                      const SizedBox(height: 15),
                      Column(
                        children: [
                          SearchCategoryField(),
                          const SizedBox(height: 20),
                          SearchLocationField(),
                          SearchLocationListModule(),
                          const SizedBox(height: 20),
                          SearchButtonModule(),
                        ],
                      ).commonSymmetricPadding(horizontal: 15),
                      //const SizedBox(height: 10),
                      // DatePickerModule(),
                      //
                      // const SizedBox(height: 10),
                      // homeScreenController.isServiceCalenderShow.value
                      //     ? SelectDateModule() : Container(),
                      const SizedBox(height: 10),

                      homeScreenController.favouriteVendorList.isEmpty
                          ? Container()
                          : FavouriteVendorsModule()
                              .commonSymmetricPadding(horizontal: 20),
                      const SizedBox(height: 20),

                      UserDetails.isUserLoggedIn == true
                          ? UpcomingAppointmentModule()
                              .commonSymmetricPadding(horizontal: 20)
                          : Container(),
                      const SizedBox(height: 15),

                      homeScreenController.allCategoryList.isEmpty
                          ? const SizedBox()
                          : PartialCategoryListModule()
                              .commonSymmetricPadding(horizontal: 20),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
