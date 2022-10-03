import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/vendor_wallet_screen_controller/vendor_wallet_screen_controller.dart';
import 'vendor_wallet_screen_widgets.dart';

class VendorWalletScreen extends StatelessWidget {
  VendorWalletScreen({Key? key}) : super(key: key);
  final vendorWalletScreenController = Get.put(VendorWalletScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CommonAppBarModule(
                    title: "Wallet",
                    appBarOption: AppBarOption.singleBackButtonOption),
                const SizedBox(height: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AvailableBalTextModule(),
                      const SizedBox(height: 15),
                      const BalanceAmountModule(),
                      const WalletSelectableTabModule(),
                      Expanded(
                          child: vendorWalletScreenController
                                      .isTransactionSelected.value ==
                                  0
                              ? const TransactionsListModule()
                              : const BankDetailsFormModule()),
                    ],
                  ).commonAllSidePadding(20),
                ),
              ],
            )),
      ),
    );
  }
}
