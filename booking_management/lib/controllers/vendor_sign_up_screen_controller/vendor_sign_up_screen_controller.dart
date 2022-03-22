import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorSignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isCPasswordVisible = true.obs;

  GlobalKey<FormState> vendorSignUpFormKey = GlobalKey<FormState>();
  final TextEditingController businessNameFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController emailFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController mobileFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController businessAddressFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController businessIdFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController passwordFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController cPasswordFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
}