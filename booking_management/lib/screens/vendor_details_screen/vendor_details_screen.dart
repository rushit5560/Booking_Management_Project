import 'package:booking_management/common/constants/app_images.dart';
import 'package:booking_management/common/extension_methods/extension_methods.dart';
import 'package:booking_management/controllers/vendor_details_screen_controller/vendor_details_screen_controller.dart';
import 'package:booking_management/screens/vendor_details_screen/vendor_details_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDetailScreen extends StatelessWidget {
  VendorDetailScreen({Key? key}) : super(key: key);

  final vendorDetailsScreenController = Get.put(VendorDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            SingleChildScrollView(
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
                      SizedBox(height: 20,),
                      PriceAndLocation(),
                      SizedBox(height: 25,),
                      ViewMapButtonModule(),
                      SizedBox(height: 25,),
                      ReviewTextFieldAndButtonModule(),
                      SizedBox(height: 40,),
                      BookAppointmentButtonModule()
                    ],
                  ).commonAllSidePadding(20)
                ],
              ),
            ),
            const BackArrow()

          ],
        ),
      ),
    );
  }
}
