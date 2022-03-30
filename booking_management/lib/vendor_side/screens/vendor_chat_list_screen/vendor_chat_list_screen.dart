import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/vendor_chat_list_screen/vendor_chat_list_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorChatListScreen extends StatelessWidget {
  const VendorChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(
              title: 'Chat List',
              appBarOption: AppBarOption.singleBackButtonOption,
            ),
            Expanded(
              child: const VendorChatList().commonAllSidePadding(20),
            ),
          ],
        ),
      ),
    );
  }
}
