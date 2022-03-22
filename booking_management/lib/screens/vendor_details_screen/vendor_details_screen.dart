import 'package:booking_management/common/extension_methods/extension_methods.dart';
import 'package:booking_management/screens/vendor_details_screen/vendor_details_screen_widgets.dart';
import 'package:flutter/material.dart';

class VendorDetailScreen extends StatelessWidget {
  const VendorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileModule(),
              SizedBox(height: 10,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  VendorName(),
                  SizedBox(height: 10,),
                  Ratting(),
                  SizedBox(height: 10,),
                  Description(),
                  SizedBox(height: 10,),
                  PriceAndLocation(),
                  SizedBox(height: 20,),
                  ViewMapButtonModule(),
                  SizedBox(height: 20,),
                  ReviewTextFieldAndButtonModule()
                ],
              ).commonAllSidePadding(20)
            ],
          ),
        ),
      ),
    );
  }
}
