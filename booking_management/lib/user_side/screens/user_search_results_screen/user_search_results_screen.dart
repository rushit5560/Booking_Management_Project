import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_search_results_screen_controller/user_search_results_screen_controller.dart';
import 'package:booking_management/user_side/screens/user_search_results_screen/user_search_results_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSearchResultsScreen extends StatelessWidget {
  UserSearchResultsScreen({Key? key}) : super(key: key);

  final userSearchResultsScreenController = Get.put(UserSearchResultsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonAppBarModule(title: "Search Results", appBarOption: AppBarOption.singleBackButtonOption),
            SizedBox(height: 20,),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SearchCategoryTextField(),
                    SizedBox(height: 20,),
                    SearchLocationTextField(),
                    SizedBox(height: 30,),
                    PopularSearchAndDistance(),
                    SizedBox(height: 30,),
                    BusinessListModule()
                  ],
                ).commonAllSidePadding(20),
              ),
            ),

          ],
        ),
      ),
    );
  }
}