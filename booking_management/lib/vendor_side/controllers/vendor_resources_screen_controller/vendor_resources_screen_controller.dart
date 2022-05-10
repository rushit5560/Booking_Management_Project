import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorResourcesScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;


  GlobalKey<FormState> serviceAddFormKey = GlobalKey();
  TextEditingController serviceNameFieldController = TextEditingController();
  TextEditingController serviceTimeDurationFieldController = TextEditingController();
  TextEditingController servicePriceFieldController = TextEditingController();
  TextEditingController serviceShortDesFieldController = TextEditingController();
  TextEditingController serviceLongDesFieldController = TextEditingController();

}