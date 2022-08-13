import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/user_side/model/home_screen_models/get_appointment_details_model.dart';
import 'package:booking_management/user_side/model/user_booking_history_model/user_booking_history_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserBookingHistoryScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isStatus = 0.obs;
  ApiHeader apiHeader = ApiHeader();

  List<Datum> historyList = [];
  AppointDetailsData? appointDetailsData;
  List<String> serviceList = [];

  userBookingHistoryFunction() async {
    isLoading(true);
    String url =
        ApiUrl.userBookingHistoryApi + "?cutomerid=${UserDetails.uniqueId}";
    log('customer token is : ${UserDetails.apiToken}');
    log('customer Id: ${UserDetails.uniqueId}');
    log('Url : $url');
    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);

      log('Response : ${response.body}');

      UserBookingHistoryModel bookingHistoryModel =
          UserBookingHistoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = bookingHistoryModel.success.obs;
      isStatus = bookingHistoryModel.statusCode.obs;
      log("status : $isStatus");

      if (isSuccessStatus.value) {
        historyList.clear();
        historyList = bookingHistoryModel.data;
        log('allHistoryList : $historyList');
      } else {
        log('Get All History Else Else');
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log('userBookingHistoryFunction Error ::: $e');
    } finally {
      isLoading(false);
    }
  }

  /// Get Upcoming Appointment Details
  getUpcomingAppointmentDetailsFunction({required String id}) async {
    isLoading(true);
    String url = ApiUrl.upcomingAppointmentDetailsApi + "?id=$id";
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
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getUpcomingAppointmentDetailsFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    userBookingHistoryFunction();
  }
}
