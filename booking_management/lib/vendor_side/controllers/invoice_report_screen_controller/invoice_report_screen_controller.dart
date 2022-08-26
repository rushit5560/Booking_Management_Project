import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_header.dart';
import '../../../common_modules/constants/api_url.dart';
import '../../model/invoice_report_screen_model/invoice_report_model.dart';

class InvoiceReportScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  List<InvoiceReportData> invoiceReportList = [];

  /// For Filter
  RxString startDate = "Select Start Date".obs;
  RxString endDate = "Select End Date".obs;
  RxBool isStartDateCalenderShow = false.obs;
  RxBool isEndDateCalenderShow = false.obs;

  DateTime selectedStartDate = DateTime.now();

  /// Invoice Report All List
  getInvoiceReportFunction() async {
    isLoading(true);
    String url =
        ApiUrl.invoiceReportApi + "?vendorid=${UserDetails.tableWiseId}";
    log("Invoice Report Api Url : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("InvoiceReport Response : ${response.body}");

      InvoiceReportModel invoiceReportModel =
          InvoiceReportModel.fromJson(json.decode(response.body));
      isSuccessStatus = invoiceReportModel.success.obs;

      if (isSuccessStatus.value) {
        invoiceReportList.clear();

        invoiceReportList = invoiceReportModel.data;
        log("InvoiceReportList : ${invoiceReportList.length}");
      } else {
        log("InvoiceReport Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("InvoiceReport Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  /// Filter Invoice Report List
  /*getFilterInvoiceReportFunction() async {
    isLoading(true);
    String url = ApiUrl.invoiceReportApi + "?fromDate=$startDate" + "&toDate=$endDate" + "&vendorId=${UserDetails.uniqueId}";

    log("Appointment Report Api Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url),  headers: apiHeader.headers);
      log("Appointment Report Response : ${response.body}");

      InvoiceReportModel invoiceReportModel = InvoiceReportModel.fromJson(json.decode(response.body));
      isSuccessStatus = invoiceReportModel.success.obs;

      if(isSuccessStatus.value) {
        invoiceReportList.clear();

        invoiceReportList = invoiceReportModel.workerList;
        log("appointmentReportList : ${invoiceReportList.length}");
      } else {
        log("getAppointmentReportFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getAppointmentReportFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }*/

  @override
  void onInit() {
    getInvoiceReportFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
