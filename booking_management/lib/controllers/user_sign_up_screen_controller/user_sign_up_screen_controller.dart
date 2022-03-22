import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserSignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isPasswordVisible = true.obs;
  RxString selectedDate = ''.obs;

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController nameFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController emailFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController mobileFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController addressFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController passwordFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  TextEditingController dobFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  TextEditingController countryFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  TextEditingController stateFieldController = TextEditingController(/*text: "demo@gmail.com"*/);
  TextEditingController cityFieldController = TextEditingController(/*text: "demo@gmail.com"*/);

  Future<void> selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );
    if (d != null) {
      // selectedDate.value = DateFormat.yMMMMd("en_US").format(d);
      selectedDate.value = DateFormat.yMd("en_US").format(d);
      dobFieldController.text = selectedDate.value;
      log('selectedDate : ${selectedDate.value}');

    }
  }
}