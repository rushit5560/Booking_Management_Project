import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';

import 'vendor_resources_screen_widgets.dart';

class VendorResourcesScreen extends StatelessWidget {
  const VendorResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: "Resources", appBarOption: AppBarOption.singleBackButtonOption),

            Expanded(child: const VendorResourcesListModule().commonAllSidePadding(20)),
          ],
        ),
      ),
    );
  }
}
