import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_ui/common_controller/forgot_password_screen_controller/forgot_password_screen_controller.dart';
import '../common_ui/common_controller/sign_in_screen_controller/sign_in_screen_controller.dart';
import '../user_side/controllers/user_sign_up_screen_controller/user_sign_up_screen_controller.dart';
import '../vendor_side/controllers/vendor_sign_up_screen_controller/vendor_sign_up_screen_controller.dart';

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
          : index == 2
              ? GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.calendar_today_rounded,
                      size: 20, color: Colors.grey),
                )
              : null);
}
