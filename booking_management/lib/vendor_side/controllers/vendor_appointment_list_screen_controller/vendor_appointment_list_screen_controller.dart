import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_ui/model/sign_in_screen_model/sign_in_screen_model.dart';
import 'package:booking_management/vendor_side/model/done_appointment_list_model/done_appointment_list_model.dart';
import 'package:booking_management/vendor_side/model/get_all_appointment_list_model/get_all_appointment_list_model.dart';
import 'package:booking_management/vendor_side/model/get_confirm_appointment_list_model/get_confirm_appointment_list_model.dart';
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
  List<Confirm> confirmList = [];
  List<Done> doneList = [];
  SignInModel ? signInModel;
  //int vendorId = Get.arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllAppointmentList();
    getPendingAppointMentList();
    getConfirmAppointList();
    getDoneAppointList();
  }

  getAllAppointmentList()async {
    isLoading(true);
    String url = ApiUrl.vendorAllAppointmentApi + "?VendorId=${UserDetails.vendorId}";
    log('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      log('All Appointment Response : ${response.body}');

      AllAppointmentListModel allAppointmentModel = AllAppointmentListModel.fromJson(json.decode(response.body));
      isStatus = allAppointmentModel.statusCode.obs;
      log("status : $isStatus");

      if(isStatus.value == 200){
        allAppointmentList = allAppointmentModel.data;
        log('allAppointmentList : $allAppointmentList');
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
    String url = ApiUrl.vendorPendingAppointmentApi + "?VendorId=${UserDetails.vendorId}";
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

  getConfirmAppointList() async {
    isLoading(true);
    String url = ApiUrl.vendorConfirmAppointmentApi + "?VendorId=${UserDetails.vendorId}";
    log('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Response : ${response.body}');

      ConfirmAppointmentListModel confirmAppointmentModel = ConfirmAppointmentListModel.fromJson(json.decode(response.body));
      isStatus = confirmAppointmentModel.statusCode.obs;
      log("status : $isStatus");

      if(isStatus.value == 200){
        confirmList = confirmAppointmentModel.data;
        log('allConfirmList : $confirmList');
      } else {
        log('Get All Confirm Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
      isLoading(false);
    }
  }

  getDoneAppointList() async {
    isLoading(true);
    String url = ApiUrl.vendorDoneAppointmentApi + "?VendorId=${UserDetails.vendorId}";
    log('Vendor Id: ${UserDetails.vendorId}');
    log('Url : $url');
    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Response : ${response.body}');

      DoneAppointmentListModel doneAppointmentModel = DoneAppointmentListModel.fromJson(json.decode(response.body));
      isStatus = doneAppointmentModel.statusCode.obs;
      log("status : $isStatus");

      if(isStatus.value == 200){
        doneList = doneAppointmentModel.data;
        log('allDoneList : $doneList');
      } else {
        log('Get All Done Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
      isLoading(false);
    }
  }

}