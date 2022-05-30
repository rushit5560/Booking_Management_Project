import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../model/vendor_appointment_list_screen_models/appointment_list_model.dart';


class VendorHomeScreenController extends GetxController {
  TextEditingController searchAppointmentFieldController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isStatus = 0.obs;
  // List<Pending> pendingList = [];
  List<AppointmentListModule> allAppointmentList = [];
  List<AppointmentListModule> pendingAppointmentList = [];
  ApiHeader apiHeader = ApiHeader();


  /// Pending Appointments
  getAppointmentListFunction() async {

    String todayDateString = todayDate();
    isLoading(true);
    String url = ApiUrl.vendorAppointmentList +
        "?UserId=${UserDetails.uniqueId}" +
    "&Status=&dDate=$todayDateString";
    log("Appointment List APi ULR : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Appointment List Response : ${response.body}");

      AppointmentListModel appointmentListModel = AppointmentListModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentListModel.success.obs;

      if(isSuccessStatus.value) {
        allAppointmentList.clear();
        allAppointmentList = appointmentListModel.data;

        for(int i = 0; i < allAppointmentList.length; i++) {
          if(allAppointmentList[i].status == "Pending" || allAppointmentList[i].status == "Confirm") {
            pendingAppointmentList.add(allAppointmentList[i]);
          }
        }

        log("allAppointmentList : ${allAppointmentList.length}");
        log("pendingAppointmentList : ${pendingAppointmentList.length}");


      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getAppointmentListFunction Else Else");
      }


    } catch(e) {
      log("getAppointmentListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAppointmentListFunction();
    super.onInit();
  }

  String todayDate() {
    DateTime dateTime = DateTime.now();

    String month = '';
    if(dateTime.month == 1) {
      month = "january";
    } else if(dateTime.month == 2) {
      month = "february";
    } else if(dateTime.month == 3) {
      month = "March";
    } else if(dateTime.month == 4) {
      month = "April";
    } else if(dateTime.month == 5) {
      month = "May";
    } else if(dateTime.month == 6) {
      month = "June";
    } else if(dateTime.month == 7) {
      month = "July";
    } else if(dateTime.month == 8) {
      month = "August";
    } else if(dateTime.month == 9) {
      month = "September";
    } else if(dateTime.month == 10) {
      month = "October";
    } else if(dateTime.month == 11) {
      month = "November";
    } else if(dateTime.month == 12) {
      month = "December";
    }

    return "${dateTime.day}/$month/${dateTime.year}";

  }

}