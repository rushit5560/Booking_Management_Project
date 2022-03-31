import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/vendor_side/model/get_all_appointment_list_model/get_all_appointment_list_model.dart';
import 'package:booking_management/vendor_side/model/pending_appointment_list_model/pending_appointment_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorAppointmentListScreenController extends GetxController {
  RxInt selectedTabIndex = 1.obs;
  TextEditingController searchAppointmentFieldController = TextEditingController();
  var selectDatePageController = PageController(initialPage: 0, viewportFraction: 0.16);

  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  List<Datum> allAppointmentList = [];
  List<Pending> pendingList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllAppointmentList();
    getPendingAppointMentList();
  }

  getAllAppointmentList()async {
    isLoading(true);
    String url = ApiUrl.vendorAllAppointmentApi + "?VendorId=3";
    log('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Response : ${response.body}');

      AllAppointmentListModel allAppointmentModel = AllAppointmentListModel.fromJson(json.decode(response.body));
      isStatus = allAppointmentModel.statusCode.obs;
      log("status : $isStatus");

      if(isStatus.value == 200){
        allAppointmentList = allAppointmentModel.data;
        log('allBusinessList : $allAppointmentList');
      } else {
        log('Get All Business Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
      isLoading(false);
    }
  }

  getPendingAppointMentList() async {
    isLoading(true);
    String url = ApiUrl.vendorPendingAppointmentApi + "?VendorId=3";
    log('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Response : ${response.body}');

      PendingAppointmentListModel pendingAppointmentModel = PendingAppointmentListModel.fromJson(json.decode(response.body));
      isStatus = pendingAppointmentModel.statusCode.obs;
      log("status : $isStatus");

      if(isStatus.value == 200){
        pendingList = pendingAppointmentModel.data;
        log('allPendingList : $pendingList');
      } else {
        log('Get All Pending Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
      isLoading(false);
    }
  }

}