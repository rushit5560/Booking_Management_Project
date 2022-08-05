import 'dart:developer';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/model/user_conversation_screen_model/receive_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                    CommonAppBarModule(
                      title: userConversationScreenController.headerName,
                      appBarOption: AppBarOption.userConversationScreen,
                    ),
                    Expanded(
                      child: StreamBuilder<List<ReceiveMessageModel>>(
                        stream: userConversationScreenController
                            .fetchChatFromFirebase(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                                "Something went wrong! ${snapshot.error}");
                          } else if (snapshot.hasData) {
                            final chatList = snapshot.data;

                            return ListView.builder(
                              itemCount: chatList!.length,
                              reverse: true,
                              itemBuilder: (context, i) {
                                ReceiveMessageModel singleMsg = chatList[i];
                                // DocumentReference docRef= FirebaseFirestore.instance!.collection("Chats")!.get()!!;

                                return SingleMessageBubble(
                                    singleMsg: singleMsg);
                              },
                            ).commonAllSidePadding(20);
                          } else {
                            return const CustomCircularLoaderModule();
                          }
                        },
                      ),
                    ),
                    MessageWriteTextFieldModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
