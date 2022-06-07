import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

import '../../model/appointment_report_screen_model/appointment_report_model.dart';

class AppointmentReportScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  List<AppointmentItem> appointmentReportList = [];

  /// For Filter
  RxString startDate = "Select Start Date".obs;
  RxString endDate = "Select End Date".obs;
  RxBool isStartDateCalenderShow = false.obs;
  RxBool isEndDateCalenderShow = false.obs;
  /// DD List
  List<String> statusList = ["Select Status", "Confirm", "Done", "Pending", "Cancel"];
  RxString selectedDDValue = "Select Status".obs;


  
  getAppointmentReportFunction() async {
    isLoading(true);
    String url = ApiUrl.appointmentReportApi + "?vendorId=${UserDetails.uniqueId}";
    log("Appointment Report Api Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url),  headers: apiHeader.headers);
      log("Appointment Report Response : ${response.body}");

      AppointmentReportModel appointmentReportModel = AppointmentReportModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentReportModel.success.obs;

      if(isSuccessStatus.value) {
        appointmentReportList.clear();

        appointmentReportList = appointmentReportModel.workerList;
        log("appointmentReportList : ${appointmentReportList.length}");
      } else {
        log("getAppointmentReportFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }


    } catch(e) {
      log("getAppointmentReportFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getAppointmentReportFunction();
    super.onInit();
  }

}