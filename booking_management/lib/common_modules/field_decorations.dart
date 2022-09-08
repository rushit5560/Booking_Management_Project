import 'package:booking_management/user_side/controllers/user_change_password_screen_controller/user_change_password_screen_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_ui/common_controller/forgot_password_screen_controller/forgot_password_screen_controller.dart';
import '../common_ui/common_controller/sign_in_screen_controller/sign_in_screen_controller.dart';
import '../user_side/controllers/user_conversation_screen_controller/user_conversation_screen_controller.dart';
import '../user_side/controllers/user_sign_up_screen_controller/user_sign_up_screen_controller.dart';
import '../user_side/model/user_conversation_screen_model/send_message_model.dart';
import '../vendor_side/controllers/vendor_sign_up_screen_controller/vendor_sign_up_screen_controller.dart';
import '../vendor_side/controllers/vendor_wallet_screen_controller/vendor_wallet_screen_controller.dart';
import 'constants/app_colors.dart';
import 'constants/app_images.dart';

InputDecoration signInFormFieldDecoration(
    {required String hintText,
    int index = 0,
    required SignInScreenController controller}) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
      errorBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      suffixIcon: index == 1
          ? Obx(
              () => GestureDetector(
                onTap: () {
                  controller.isPasswordVisible.value =
                      !controller.isPasswordVisible.value;
                },
                child: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 20,
                    color: Colors.grey),
              ),
            )
          : null);
}

InputDecoration signUpFormFieldDecoration({
  required String hintText,
  int index = 0,
  required UserSignUpScreenController controller,
  required BuildContext context,
}) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      counterText: "",
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
      errorBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      suffixIcon: index == 1
          ? Obx(
              () => GestureDetector(
                onTap: () {
                  controller.isPasswordVisible.value =
                      !controller.isPasswordVisible.value;
                },
                child: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 20,
                    color: Colors.grey),
              ),
            )
          : index == 3
              ? Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isRePasswordVisible.value =
                          !controller.isRePasswordVisible.value;
                    },
                    child: Icon(
                        controller.isRePasswordVisible.value
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        size: 20,
                        color: Colors.grey),
                  ),
                )
              : index == 2
                  ? GestureDetector(
                      onTap: () {
                        controller.selectDate(context);
                      },
                      child: const Icon(Icons.calendar_today_rounded,
                          size: 20, color: Colors.grey),
                    )
                  : null);
}

InputDecoration forgotPasswordFormFieldDecoration(
    {required String hintText,
    int index = 0,
    required ForgotPasswordScreenController controller}) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
      errorBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      suffixIcon: index == 1
          ? Obx(
              () => GestureDetector(
                onTap: () {
                  controller.isPasswordVisible.value =
                      !controller.isPasswordVisible.value;
                },
                child: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 20,
                    color: Colors.grey),
              ),
            )
          : null);
}

InputDecoration changePasswordFormFieldDecoration(
    {required String hintText,
    int index = 0,
    required UserChangePasswordScreenController controller,
    required BuildContext context}) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
      errorBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      suffixIcon: index == 1
          ? Obx(
              () => GestureDetector(
                onTap: () {
                  controller.isPasswordVisible.value =
                      !controller.isPasswordVisible.value;
                },
                child: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 20,
                    color: Colors.grey),
              ),
            )
          : index == 2
              ? Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isNewPasswordVisible.value =
                          !controller.isNewPasswordVisible.value;
                    },
                    child: Icon(
                        controller.isNewPasswordVisible.value
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        size: 20,
                        color: Colors.grey),
                  ),
                )
              : index == 3
                  ? Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.isConfirmPasswordVisible.value =
                              !controller.isConfirmPasswordVisible.value;
                        },
                        child: Icon(
                            controller.isConfirmPasswordVisible.value
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            size: 20,
                            color: Colors.grey),
                      ),
                    )
                  : null);
}

InputDecoration vendorSignUpFormFieldDecoration(
    {required String hintText,
    int index = 0,
    required VendorSignUpScreenController controller}) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
      errorBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      suffixIcon: index == 1
          ? Obx(
              () => GestureDetector(
                onTap: () {
                  controller.isPasswordVisible.value =
                      !controller.isPasswordVisible.value;
                },
                child: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 20,
                    color: Colors.grey),
              ),
            )
          : index == 3
              ? Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isCPasswordVisible.value =
                          !controller.isCPasswordVisible.value;
                    },
                    child: Icon(
                        controller.isCPasswordVisible.value
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        size: 20,
                        color: Colors.grey),
                  ),
                )
              : index == 2
                  ? GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.calendar_today_rounded,
                          size: 20, color: Colors.grey),
                    )
                  : null);
}

InputDecoration conversationScreenFieldDecoration(
    {required String hintText,
    required UserConversationScreenController controller,
    required String roomId,
    required String senderEmail,
    required String receiverEmail}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: AppColors.accentColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: AppColors.accentColor),
    ),
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    suffixIcon: IconButton(
      onPressed: () async {
        if (controller.messageFieldController.text.isNotEmpty) {
          /// Create Message Model Wise
          SendMessageModel sendMsg = SendMessageModel(
              roomId: roomId,
              senderId: senderEmail,
              receiverId: receiverEmail,
              message: controller.messageFieldController.text,
              createdAt: Timestamp.now(),
              seen: false);

          /// Insert this Msg in Current List
          // controller.userChatList.insert(0, sendMsg);

          /// Msg Store in Firebase
          await controller.sendMessageFunction(sendMsg);
        }
      },
      icon: Icon(
        Icons.send_rounded,
        size: 24,
        color: AppColors.colorGreyIconDark,
      ),
    ),

    // GestureDetector(
    //   onTap: () async {
    //     // controller.messageFieldController.clear();
    //     if (controller.messageFieldController.text.isNotEmpty) {
    //       /// Create Message Model Wise
    //       SendMessageModel sendMsg = SendMessageModel(
    //           roomId: roomId,
    //           senderId: senderEmail,
    //           receiverId: receiverEmail,
    //           message: controller.messageFieldController.text,
    //           createdAt: Timestamp.now(),
    //           seen: false);

    //       /// Insert this Msg in Current List
    //       // controller.userChatList.insert(0, sendMsg);

    //       /// Msg Store in Firebase
    //       await controller.sendMessageFunction(sendMsg);
    //     }
    //   },
    //   child:

    //   Image.asset(
    //     AppImages.sendImg,
    //     scale: 0.85,
    //     color: AppColors.blackColor,
    //   ),
    // ),
    /*prefixIcon: GestureDetector(
      onTap: () {},
      child: Image.asset(AppImages.emojiImg, scale: 0.75),
    ),*/
  );
}

InputDecoration vendorBankFormFieldDecoration(
    {required String hintText,
    int index = 0,
    required VendorWalletScreenController controller}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    enabledBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    focusedBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    errorBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    focusedErrorBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  );
}

InputDecoration checkoutFormFieldDecoration({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    counterText: "",
    hintStyle: const TextStyle(color: Colors.grey),
    enabledBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    focusedBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    errorBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    focusedErrorBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  );
}

InputDecoration serviceFormFieldDecoration({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    border: InputBorder.none,
    counterText: "",
    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
    // enabledBorder: const UnderlineInputBorder(
    //     borderSide: BorderSide(color: Colors.black)),
    // focusedBorder: const UnderlineInputBorder(
    //     borderSide: BorderSide(color: Colors.black)),
    // errorBorder:
    // const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    // focusedErrorBorder:
    // const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  );
}

InputDecoration bankInfoFieldDecoration({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    enabledBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    focusedBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    errorBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    focusedErrorBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  );
}
