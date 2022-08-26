import 'package:booking_management/common_modules/common_functions.dart';
import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
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
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => hideKeyboard(),
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
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SingleChildScrollView(
                                  physics: const ClampingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      FinancialInstituteNameFieldModule(),
                                      AccountNameFieldModule(),
                                      AccountNumberFieldModule(),
                                      IfscFieldModule(),
                                    ],
                                  ).commonSymmetricPadding(
                                      horizontal: 8, vertical: 15),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SaveChangesButtonModule(),
                            ],
                          ).commonAllSidePadding(5),
                        ).commonAllSidePadding(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
