import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/vendor_conversation_screen_controller/vendor_conversation_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/vendor_conversation_screen/vendor_conversation_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorConversationScreen extends StatelessWidget {
  VendorConversationScreen({Key? key}) : super(key: key);

  final vendorConversationScreenController = Get.put(VendorConversationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: 'Dr. John Doe', appBarOption: AppBarOption.userConversationScreen),
            Expanded(
              child: ListView.builder(
                itemCount: vendorConversationScreenController.userChatList.length,
                itemBuilder: (context, i) {
                  return VendorSingleMessageBubble(
                    isSendByMe: vendorConversationScreenController.userChatList[i].isSendByMe,
                    message: vendorConversationScreenController.userChatList[i].message,
                  );
                },
              ).commonAllSidePadding(20),
            ),
            const VendorMessageWriteTextFieldModule(),
          ],
        ),
      ),
    );
  }
}
