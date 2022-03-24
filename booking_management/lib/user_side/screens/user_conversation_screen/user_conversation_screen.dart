import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_conversation_screen_controller/user_conversation_screen_controller.dart';
import 'user_conversation_screen_widgets.dart';

class UserConversationScreen extends StatelessWidget {
  UserConversationScreen({Key? key}) : super(key: key);
  final userConversationScreenController = Get.put(UserConversationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: 'Dr. John Doe', appBarOption: AppBarOption.userConversationScreen),
            Expanded(
              child: ListView.builder(
                itemCount: userConversationScreenController.userChatList.length,
                itemBuilder: (context, i) {
                  return SingleMessageBubble(
                    isSendByMe: userConversationScreenController.userChatList[i].isSendByMe,
                    message: userConversationScreenController.userChatList[i].message,
                  );
                },
              ).commonAllSidePadding(20),
            ),
            const MessageWriteTextFieldModule(),
          ],
        ),
      ),
    );
  }
}