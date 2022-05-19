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
    isLoading(true);
    String url = ApiUrl.vendorAppointmentList + "?UserId=${UserDetails.uniqueId}";
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
          if(allAppointmentList[i].status == "Pending") {
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

}