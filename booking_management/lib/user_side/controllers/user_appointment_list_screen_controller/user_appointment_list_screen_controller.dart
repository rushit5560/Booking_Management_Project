import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/user_appointment_list_model/user_appointment_list_model.dart';

class UserAppointmentScreenController extends GetxController{
  TextEditingController searchAppointmentFieldController = TextEditingController();

  RxInt selectedTabIndex = 1.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Datum> userAppointmentList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserAppointment();
  }

  getUserAppointment()async{
    isLoading(true);
    String url = ApiUrl.userAppointmentListApi + "?CustomerId=${UserDetails.customerId}";
    log('customer Id: ${UserDetails.customerId}');
    log('Url : $url');
    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Response : ${response.body}');

      UserAppointmentModel userAppointmentModel = UserAppointmentModel.fromJson(json.decode(response.body));
      isSuccessStatus = userAppointmentModel.success.obs;
      log("status : $isSuccessStatus");

      if(isSuccessStatus.value){
        userAppointmentList = userAppointmentModel.data;
        log('userAppointmentList : $userAppointmentList');
      } else {
        log('Get All Appointment Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
      isLoading(false);
    }
  }
}