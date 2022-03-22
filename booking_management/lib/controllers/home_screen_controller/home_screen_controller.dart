import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final TextEditingController categoryFieldController = TextEditingController();
  final TextEditingController locationFieldController = TextEditingController();
}