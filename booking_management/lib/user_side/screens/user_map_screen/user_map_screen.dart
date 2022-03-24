import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/user_side/screens/user_map_screen/user_map_screen_widgets.dart';
import 'package:flutter/material.dart';

class UserMapScreen extends StatelessWidget {
  const UserMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
             CommonAppBarModule(title: "Map", appBarOption: AppBarOption.singleBackButtonOption),

            Expanded(
              child: MapView(),
            ),

            GetDirectionButtonModule()
          ],
        ),
      ),
    );
  }
}
