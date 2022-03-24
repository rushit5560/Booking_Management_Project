import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreenController extends GetxController{

  RxString selectedDate = 'DOB'.obs;

  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final nameTextFieldController = TextEditingController(text: "abc");
  final emailTextFieldController = TextEditingController(text: "abc@gmail.com");
  final addressTextFieldController = TextEditingController(text: "1156, Lorem Soc.");
  final mobileTextFieldController = TextEditingController(text: "+1234567890");
  final cityTextFieldController = TextEditingController(text: "surat");
  final stateTextFieldController = TextEditingController(text: "Gujarat");
  final countryTextFieldController = TextEditingController(text: "India");
}