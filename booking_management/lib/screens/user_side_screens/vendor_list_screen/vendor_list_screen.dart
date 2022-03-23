import 'package:booking_management/common/extension_methods/extension_methods.dart';
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
            const VendorListScreen(),
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
