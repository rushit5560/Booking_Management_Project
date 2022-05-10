import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/vendor_side/model/pending_appointment_list_model/pending_appointment_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorHomeScreenController extends GetxController {
  TextEditingController searchAppointmentFieldController = TextEditingController();
  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  List<Pending> pendingList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // pendingAppointMentList();
  }

  pendingAppointMentList() async {
    isLoading(true);
    String url = ApiUrl.vendorPendingAppointmentApi + "?VendorId=${UserDetails.vendorId}";
    log('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      // log('Response : ${response.body}');

      PendingAppointmentListModel pendingAppointmentModel = PendingAppointmentListModel.fromJson(json.decode(response.body));
      isStatus = pendingAppointmentModel.statusCode.obs;
      log("status : $isStatus");

      if(isStatus.value == 200){
        pendingList = pendingAppointmentModel.data;
        log('allBusinessList : $pendingList');
      } else {
        log('Get All Business Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
      isLoading(false);
    }
  }
}