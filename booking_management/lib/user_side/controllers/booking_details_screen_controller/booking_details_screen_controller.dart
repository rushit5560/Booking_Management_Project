import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_header.dart';
import '../../../common_modules/constants/api_url.dart';
import '../../../vendor_side/model/appointment_details_screen_models/appointment_details_model.dart';
import '../../model/home_screen_models/get_appointment_details_model.dart';

class BookingDetailsScreenController extends GetxController {
  String bookingId = Get.arguments;
  // String status = Get.arguments[1];
  // int appointmentId = Get.arguments[2];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  AppointDetailsData? appointDetailsData;
  List<String> serviceList = [];

  /// Get Appointment Details
  getUpcomingAppointmentDetailsFunction() async {
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
        log("appointmentDetails : ${appointDetailsData!.vendor.userName}");
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
    getUpcomingAppointmentDetailsFunction();
    super.onInit();
  }
}
