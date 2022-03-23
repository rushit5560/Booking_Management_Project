import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/screens/booking_details_screen/booking_details_screen_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({Key? key}) : super(key: key);

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
                 const SizedBox(height: 10,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: const [
                     VendorName(),
                     SizedBox(height: 10,),
                     BookingDateAndTime(),
                     SizedBox(height: 20,),
                     Description(),
                     SizedBox(height: 20,),
                     BookingDetails()
                   ],
                 ).commonAllSidePadding(20)

              ],
            ),
            const BackArrow()

          ],
        ),
      ),
    );
  }
}
