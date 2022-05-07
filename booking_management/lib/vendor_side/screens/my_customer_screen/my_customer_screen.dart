import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/my_customer_screen/my_customer_screen_widgets.dart';
import 'package:flutter/material.dart';

class MyCustomerScreen extends StatelessWidget {
  const MyCustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: "My Customer", appBarOption: AppBarOption.singleBackButtonOption),

            const Expanded(
              child: CustomerList(),
            ).commonSymmetricPadding(horizontal: 15, vertical: 15)
          ],
        ),
      ),
    );
  }
}
