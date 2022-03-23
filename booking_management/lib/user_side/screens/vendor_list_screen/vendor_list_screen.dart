import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';

import 'vendor_list_screen_widgets.dart';

class VendorListScreen extends StatelessWidget {
  const VendorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Vendor List"),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: "Vendor List"),
            Expanded(
              child: Column(
                children: const [
                  Expanded(child: VendorListScreenVendorList()),
                ],
              ).commonAllSidePadding(20),
            )
          ],
        ),
      ),
    );
  }
}
