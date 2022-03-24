import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessDetailsScreenController extends GetxController{
  final TextEditingController reviewFieldController = TextEditingController();
  GlobalKey<FormState> reviewFormKey = GlobalKey<FormState>();
  RxBool isOverviewSelected = true.obs;
  RxBool isReviewSelected = false.obs;
  RxString service = 'Daily Checkup'.obs;
}