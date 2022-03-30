import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/choose_court_screen_controller/choose_court_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/choose_court_screen/choose_court_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseCourtScreen extends StatelessWidget {
  ChooseCourtScreen({Key? key}) : super(key: key);

  final chooseCourtScreenController = Get.put(ChooseCourtScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: "Choose Your Court", appBarOption: AppBarOption.singleBackButtonOption),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    CourtDetails(),
                    SizedBox(height: 25,),
                    UpdateButtonModule(),
                    SizedBox(height: 25,),
                    CourtListModule()
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
