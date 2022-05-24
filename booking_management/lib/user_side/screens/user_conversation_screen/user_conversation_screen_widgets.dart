import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/field_decorations.dart';
import '../../controllers/user_conversation_screen_controller/user_conversation_screen_controller.dart';


class SingleMessageBubble extends StatelessWidget {
  final bool isSendByMe;
  final String message;

  const SingleMessageBubble(
      {Key? key, required this.isSendByMe, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.colorLightGrey,
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
                      message,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
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
        color: AppColors.colorLightGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          cursorColor: Colors.grey,
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
