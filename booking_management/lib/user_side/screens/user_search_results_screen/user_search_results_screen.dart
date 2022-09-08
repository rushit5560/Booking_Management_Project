import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_search_results_screen_controller/user_search_results_screen_controller.dart';
import 'package:booking_management/user_side/screens/user_search_results_screen/user_search_results_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSearchResultsScreen extends StatelessWidget {
  UserSearchResultsScreen({Key? key}) : super(key: key);

  final userSearchResultsScreenController =
      Get.put(UserSearchResultsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => userSearchResultsScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CommonAppBarModule(
                        title: "Search Results",
                        appBarOption: AppBarOption.singleBackButtonOption),
                    // userSearchResultsScreenController.searchType == SearchType.categoryWise
                    //     ? Container()
                    //     : const SizedBox(height: 0),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /*userSearchResultsScreenController.searchType == SearchType.categoryWise
                      ? Container()
                      : SearchCategoryTextField(),
                      userSearchResultsScreenController.searchType == SearchType.categoryWise
                          ? Container()
                          : const SizedBox(height: 20),*/

                            // SearchLocationTextField(),
                            // SizedBox(height: 30,),
                            const PopularSearchAndDistance(),
                            const SizedBox(height: 30),
                            userSearchResultsScreenController
                                    .searchVendorList.isEmpty
                                ? const Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      child: Text(
                                        "Sorry, no business found for selected criteria. Please change location and try again!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 17,
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                  )
                                : BusinessListModule(),
                          ],
                        ).commonSymmetricPadding(horizontal: 12, vertical: 20),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
