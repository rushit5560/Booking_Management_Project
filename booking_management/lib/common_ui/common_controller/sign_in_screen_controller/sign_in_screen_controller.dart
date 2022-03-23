import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isPasswordVisible = true.obs;

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController emailFieldController = TextEditingController(text: "demo@gmail.com");
  final TextEditingController passwordFieldController = TextEditingController(text: "12345678");
}