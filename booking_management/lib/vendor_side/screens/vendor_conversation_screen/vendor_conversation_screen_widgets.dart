import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/field_decorations.dart';
import 'package:booking_management/vendor_side/controllers/vendor_conversation_screen_controller/vendor_conversation_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

VendorConversationScreenController screenController = Get.find<VendorConversationScreenController>();

class VendorSingleMessageBubble extends StatelessWidget {
  final bool isSendByMe;
  final String message;

  const VendorSingleMessageBubble(
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

class VendorMessageWriteTextFieldModule extends StatelessWidget {
  const VendorMessageWriteTextFieldModule({Key? key}) : super(key: key);

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
          decoration: InputDecoration(
            hintText: 'Type a message',
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.colorLightGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.colorLightGrey),
            ),
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            suffixIcon: GestureDetector(
              onTap: () {
                screenController.messageFieldController.clear();
              },
              child: Image.asset(AppImages.sendImg, scale: 0.75),
            ),
            prefixIcon: GestureDetector(
              onTap: () {},
              child: Image.asset(AppImages.emojiImg, scale: 0.75),
            ),
          )
        ),
      ),
    );
  }
}