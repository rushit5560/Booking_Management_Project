import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/user_side/controllers/user_transaction_screen_controller/user_transaction_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_transaction_screen_widgets.dart';

class UserTransactionScreen extends StatelessWidget {
  UserTransactionScreen({Key? key}) : super(key: key);
  final userTransactionScreenController = Get.put(UserTransactionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> userTransactionScreenController.isLoading.value
        ? const CustomCircularLoaderModule()
        : SafeArea(
          child: Column(
            children: [
              const CommonAppBarModule(
                title: "Transaction Details",
                appBarOption: AppBarOption.singleBackButtonOption,
              ),
              const SizedBox(height: 10),

              Expanded(
                child: TransactionListModule(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
