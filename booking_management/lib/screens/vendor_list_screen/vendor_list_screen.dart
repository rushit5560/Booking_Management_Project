import 'package:booking_management/common/extension_methods/extension_methods.dart';
import 'package:booking_management/screens/vendor_list_screen/vendor_list_screen_widgets.dart';
import 'package:flutter/material.dart';

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
            const AppBarWidget(),
            Expanded(
              child: Column(
                children: const [
                  Expanded(child: VendorList())
                ],
              ).commonAllSidePadding(),
            )
          ],
        ),
      ),
    );
  }
}
