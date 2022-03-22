import 'package:booking_management/controllers/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red)),

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
