import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_ui/model/sign_in_screen_model/sign_in_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../user_side/model/user_conversation_screen_model/get_fcm_token_model.dart';
import '../../model/vendor_appointment_list_screen_models/appointment_list_model.dart';
import '../../model/vendor_appointment_list_screen_models/appointment_status_change_model.dart';

class VendorAppointmentListScreenController extends GetxController {
  RxInt selectedTabIndex = 1.obs;
  TextEditingController searchAppointmentFieldController =
      TextEditingController();

  var selectDatePageController =
      PageController(initialPage: 0, viewportFraction: 0.16);

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isStatus = 0.obs;
  ApiHeader apiHeader = ApiHeader();
  SignInModel? signInModel;
  RxString selectedDate = "".obs;
  RxString selectedDisplayDate = "".obs;
  RxBool isAppointmentListCalenderShow = false.obs;

  String message = "";

  /// All Filter List
  List<AppointmentListModule> allAppointmentList = [];
  List<AppointmentListModule> pendingAppointmentList = [];
  List<AppointmentListModule> confirmAppointmentList = [];
  List<AppointmentListModule> doneAppointmentList = [];
  List<AppointmentListModule> cancelAppointmentList = [];
  // List<AppointmentListModule> processingAppointmentList = [];
  // List<AppointmentListModule> scheduledAppointmentList = [];

  /// Get All Appointment List
  getAppointmentListFunction() async {
    isLoading(true);
    String url = selectedDate.value == ""
        ? ApiUrl.vendorAppointmentList + "?UserId=${UserDetails.uniqueId}"
        : ApiUrl.vendorAppointmentList +
            "?UserId=${UserDetails.uniqueId}&Status=&dDate=$selectedDate";

    log("Appointment List APi ULR : $url");
    log("user id: ${UserDetails.uniqueId}");
    log('header: ${apiHeader.headers}');
    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Appointment List Response : ${response.body}");

      AppointmentListModel appointmentListModel = AppointmentListModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentListModel.success.obs;

      if (isSuccessStatus.value) {
        allAppointmentList.clear();
        pendingAppointmentList.clear();
        confirmAppointmentList.clear();
        doneAppointmentList.clear();
        cancelAppointmentList.clear();
        // processingAppointmentList.clear();
        // scheduledAppointmentList.clear();

        allAppointmentList = appointmentListModel.data;

        for (int i = 0; i < allAppointmentList.length; i++) {
          if (allAppointmentList[i].status == "Pending") {
            pendingAppointmentList.add(allAppointmentList[i]);
          }
          if (allAppointmentList[i].status == "Confirm") {
            confirmAppointmentList.add(allAppointmentList[i]);
          }
          if (allAppointmentList[i].status == "Done") {
            doneAppointmentList.add(allAppointmentList[i]);
          }
          if (allAppointmentList[i].status == "Cancel") {
            cancelAppointmentList.add(allAppointmentList[i]);
          }
          // if(allAppointmentList[i].status == "Processing") {
          //   processingAppointmentList.add(allAppointmentList[i]);
          // }
          // if(allAppointmentList[i].status == "Scheduled") {
          //   scheduledAppointmentList.add(allAppointmentList[i]);
          // }
        }

        log("allAppointmentList : ${allAppointmentList.length}");
        log("pendingAppointmentList : ${pendingAppointmentList.length}");
        log("confirmAppointmentList : ${confirmAppointmentList.length}");
        log("doneAppointmentList : ${doneAppointmentList.length}");
        log("cancelAppointmentList : ${cancelAppointmentList.length}");
        // log("processingAppointmentList : ${processingAppointmentList.length}");
        // log("scheduledAppointmentList : ${scheduledAppointmentList.length}");

      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getAppointmentListFunction Else Else");
      }
    } catch (e) {
      log("getAppointmentListFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  /// Appointment for Confirm
  confirmAppointmentByIdFunction({required int appointmentId}) async {
    isLoading(true);
    String url = ApiUrl.vendorAppointmentStatusChangeApi +
        "?status=Confirm&id=$appointmentId";
    log("Appointment Status Change API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Appointment Details API Response : ${response.body}");

      AppointmentStatusChangeModel appointmentStatusChangeModel =
          AppointmentStatusChangeModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentStatusChangeModel.success.obs;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "Appointment Confirmed!");
        Get.back();
      } else {
        log("confirmAppointmentByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("confirmAppointmentByIdFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAppointmentListFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
