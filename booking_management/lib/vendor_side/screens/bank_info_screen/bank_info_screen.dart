import 'package:booking_management/common_modules/common_functions.dart';
import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/field_decorations.dart';
import 'package:booking_management/common_modules/field_validation.dart';
import 'package:booking_management/vendor_side/controllers/bank_info_screen_controller/bank_info_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bank_info_screen_widgets.dart';

class BankInfoScreen extends StatelessWidget {
  BankInfoScreen({Key? key}) : super(key: key);
  final bankInfoScreenController = Get.put(BankInfoScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: ()=> hideKeyboard(),
        child: SafeArea(
          child: Column(
            children: [
              const CommonAppBarModule(
                title: "Bank Account Information",
                appBarOption: AppBarOption.singleBackButtonOption,
              ),
              Expanded(
                child: Obx(
                  () => bankInfoScreenController.isLoading.value
                      ? const CustomCircularLoaderModule()
                      : Form(
                          key: bankInfoScreenController.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FinancialInstituteNameFieldModule(),
                              AccountNameFieldModule(),
                              AccountNumberFieldModule(),
                              IfscFieldModule(),

                              const SizedBox(height: 20),
                              SaveChangesButtonModule(),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
