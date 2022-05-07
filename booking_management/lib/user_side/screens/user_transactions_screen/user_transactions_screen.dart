import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'user_transactions_screen_widgets.dart';

class UserTransactionsScreen extends StatelessWidget {
  const UserTransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            CommonAppBarModule(title: "Transactions", appBarOption: AppBarOption.singleBackButtonOption),
            Expanded(child: UserTransactionListModule()),
          ],
        ),
      ),
    );
  }
}
