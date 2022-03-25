import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorAppointmentListScreenController extends GetxController {
  RxInt selectedTabIndex = 1.obs;
  TextEditingController searchAppointmentFieldController = TextEditingController();
  var selectDatePageController = PageController(initialPage: 0, viewportFraction: 0.16);

}