import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/user_side/model/home_screen_models/get_appointment_details_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class UserAppointmentDetailsScreenController extends GetxController {
  String bookingId = Get.arguments[0];
  String resourceName = Get.arguments[1];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  AppointDetailsData? appointDetailsData;
  List<String> serviceList = [];

  /// Get Upcoming Appointment Details
  Future<void> getUpcomingAppointmentDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.upcomingAppointmentDetailsApi + "?id=$bookingId";
    log("Appointment Details API URL : $url");

    try {
      http.Response response =
      await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Appointment Details Response : ${response.body}");

      GetAppointmentDetailsModel getAppointmentDetailsModel =
      GetAppointmentDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAppointmentDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        appointDetailsData = getAppointmentDetailsModel.data;
        serviceList = getAppointmentDetailsModel.list;
        log("appointmentDetails : $appointDetailsData");
      } else {
        log("getUpcomingAppointmentDetailsFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      log("getUpcomingAppointmentDetailsFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
    // isLoading(false);
  }


  @override
  void onInit() {
    getUpcomingAppointmentDetailsFunction();
    super.onInit();
  }


}