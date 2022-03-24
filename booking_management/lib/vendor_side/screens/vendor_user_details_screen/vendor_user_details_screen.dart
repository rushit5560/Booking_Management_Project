import 'package:flutter/material.dart';
import 'vendor_user_details_screen_widgets.dart';


class VendorUserDetailsScreen extends StatelessWidget {
  const VendorUserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: const [
                UserImageModule(),
                Expanded(
                  child: UserDetailsModule(),
                ),
              ],
            ),

            const Positioned(
              bottom: 40,
                right: 40,
                child: ConfirmAppointmentButtonModule(),
            ),

            const Positioned(
              top: 20,
                left: 20,
                child: BackButtonModule(),
            ),
          ],
        ),
      ),
    );
  }
}
