import 'dart:developer';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/user_side/model/user_conversation_screen_model/receive_message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/field_decorations.dart';
import '../../controllers/user_conversation_screen_controller/user_conversation_screen_controller.dart';
import '../../model/user_conversation_screen_model/send_message_model.dart';

class SingleMessageBubble extends StatelessWidget {
  final ReceiveMessageModel singleMsg;

  SingleMessageBubble({Key? key, required this.singleMsg}) : super(key: key);

  final screenController = Get.find<UserConversationScreenController>();

  @override
  Widget build(BuildContext context) {
    bool isSendByMe;

    var msgSentDay = DateTime.fromMicrosecondsSinceEpoch(
            singleMsg.createdAt.microsecondsSinceEpoch)
        .toString()
        .split(" ")[0];
    var msgSentHourTime = DateTime.fromMicrosecondsSinceEpoch(
            singleMsg.createdAt.microsecondsSinceEpoch)
        .hour;
    var msgSentMinTime = DateTime.fromMicrosecondsSinceEpoch(
            singleMsg.createdAt.microsecondsSinceEpoch)
        .minute;

    singleMsg.senderId == UserDetails.email
        ? isSendByMe = true
        : isSendByMe = false;

    return Container(
      margin: const EdgeInsets.all(5),
      padding: isSendByMe
          ? const EdgeInsets.only(left: 40)
          : const EdgeInsets.only(right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment:
                isSendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment:
                isSendByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  if (isSendByMe == true) {
                    log("singleMsg.id : ${singleMsg.docId}");
                    showAlertDialog(context, singleMsg.docId);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: isSendByMe
                        ? AppColors.accentColor
                        : AppColors.colorLightGrey2,
                    borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(15),
                      topLeft: const Radius.circular(15),
                      bottomRight: Radius.circular(isSendByMe ? 0 : 15),
                      bottomLeft: Radius.circular(isSendByMe ? 15 : 0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: isSendByMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        singleMsg.message,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "$msgSentDay at $msgSentHourTime:$msgSentMinTime",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context, String docId) {
    Widget okButton = TextButton(
      onPressed: () {
        screenController.deleteSingleMessage(docId);
      },
      child: const Text("Ok"),
    );

    Widget cancelButton = TextButton(
      onPressed: () {
        Get.back();
      },
      child: const Text("Cancel"),
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      //title: Text("Simple Alert"),
      content: const Text("Delete Message?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class MessageWriteTextFieldModule extends StatelessWidget {
  MessageWriteTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserConversationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: AppColors.accentColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
          cursorColor: Colors.grey,
          textInputAction: TextInputAction.done,
          controller: screenController.messageFieldController,
          decoration: conversationScreenFieldDecoration(
            hintText: 'Type a message',
            controller: screenController,
            roomId: screenController.roomId,
            senderEmail: UserDetails.email,
            receiverEmail: screenController.receiverEmail,
          ),
        ),
      ),
    );
  }
}
