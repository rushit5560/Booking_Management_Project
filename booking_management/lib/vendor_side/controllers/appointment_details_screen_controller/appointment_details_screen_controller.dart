import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:get/get.dart';

import '../../model/appointment_details_screen_models/appointment_details_model.dart';

class AppointmentDetailsScreenController extends GetxController {
  /// "appointmentId" From Appointment List Screen
  int appointmentId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  AppointmentDetailsData appointmentDetailsData = AppointmentDetailsData();


  getAppointmentDetailsByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAppointmentDetailsApi + "?id=$appointmentId";
    log("Appointment Details API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Appointment Details Response : ${response.body}");

      AppointmentDetailsModel appointmentDetailsModel = AppointmentDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentDetailsModel.success.obs;

      if(isSuccessStatus.value) {
        appointmentDetailsData = appointmentDetailsModel.data;
        log("appointmentDetailsData :: $appointmentDetailsData");
      } else {
        log("getAppointmentDetailsByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }


    } catch(e) {
      log("getAppointmentDetailsByIdFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAppointmentDetailsByIdFunction();
    super.onInit();
  }

}