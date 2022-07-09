import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/user_side/controllers/user_transaction_screen_controller/user_transaction_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_transactions_screen_widgets.dart';

class UserTransactionsScreen extends StatelessWidget {
  UserTransactionsScreen({Key? key}) : super(key: key);
  final userTransactionScreenController =
      Get.put(UserTransactionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => userTransactionScreenController.isLoading.value
              ? const CustomCircularLoaderModule()
              : Column(
                  children: [
                    const CommonAppBarModule(
                        title: "Transactions",
                        appBarOption: AppBarOption.singleBackButtonOption),
                    Expanded(
                        child: userTransactionScreenController
                                .transactionList.isEmpty
                            ? const Center(child: Text("No Data Available!"))
                            : UserTransactionListModule()),
                  ],
                ),
        ),
      ),
    );
  }
}
