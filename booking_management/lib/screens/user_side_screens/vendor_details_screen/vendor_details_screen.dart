import 'package:booking_management/controllers/vendor_details_screen_controller/vendor_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'vendor_details_screen_widgets.dart';

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileModule(),
                const SizedBox(height: 20,),
                const TabViewModule(),
                const SizedBox(height: 20),
                Expanded(
                  child: vendorDetailsScreenController.isOverviewSelected.value ?
                   const OverviewModule() : const OverviewModule(),
                )
                // Expanded(
                //   child: SingleChildScrollView(
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: const [
                //         VendorName(),
                //         SizedBox(height: 10,),
                //         Ratting(),
                //         SizedBox(height: 10,),
                //         Description(),
                //         SizedBox(height: 20,),
                //         PriceAndLocation(),
                //         SizedBox(height: 25,),
                //         ViewMapButtonModule(),
                //         SizedBox(height: 25,),
                //         ReviewTextFieldAndButtonModule(),
                //         SizedBox(height: 40,),
                //         BookAppointmentButtonModule()
                //       ],
                //     ).commonAllSidePadding(20),
                //   ),
                // )
              ],
            ),
            const BackArrow()

          ],
        ),
      ),
    );
  }
}
