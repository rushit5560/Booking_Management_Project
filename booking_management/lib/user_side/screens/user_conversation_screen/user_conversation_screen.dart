import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_conversation_screen_controller/user_conversation_screen_controller.dart';
import '../../model/user_conversation_screen_model/send_message_model.dart';
import 'user_conversation_screen_widgets.dart';

class UserConversationScreen extends StatelessWidget {
  UserConversationScreen({Key? key}) : super(key: key);
  final userConversationScreenController =
      Get.put(UserConversationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => userConversationScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: 'Dr. John Doe',
                      appBarOption: AppBarOption.userConversationScreen,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: userConversationScreenController.userChatList.length,
                        itemBuilder: (context, i) {

                          SendMessageModel singleMsg = userConversationScreenController.userChatList[i];


                          return SingleMessageBubble(singleMsg: singleMsg);
                        },
                      ).commonAllSidePadding(20),
                    ),
                    MessageWriteTextFieldModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
