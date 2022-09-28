import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_header.dart';
import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../model/customer_report_screen_model/customer_report_model.dart';

class CustomerReportScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  List<CustomerReportData> customerReportList = [];

  /// For Filter
  RxString startDate = "Select Start Date".obs;
  RxString endDate = "Select End Date".obs;
  RxBool isStartDateCalenderShow = false.obs;
  RxBool isEndDateCalenderShow = false.obs;

  /// DD List
  List<String> statusList = ["AllCustomer", "Guest"];
  RxString selectedStatusValue = "AllCustomer".obs;

  /// Customer Report All List
  getCustomerReportFunction() async {
    isLoading(true);
    String url = ApiUrl.customerReportApi + "?vendorId=${UserDetails.uniqueId}";
    log("Customer Report Api Url : $url");

    try {



      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Customer Report Response : ${response.body}");

      CustomerReportModel customerReportModel =
          CustomerReportModel.fromJson(json.decode(response.body));
      isSuccessStatus = customerReportModel.success.obs;

      if (isSuccessStatus.value) {
        customerReportList.clear();

        customerReportList = customerReportModel.data;
        log("Customer report list : ${customerReportList.length}");
      } else {
        log("Customer report Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("Customer report Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  /// Filter Customer Report List
  getFilterCustomerReportFunction({required String status}) async {
    isLoading(true);
    String url = ApiUrl.customerReportApi +
        "?vendorid=${UserDetails.uniqueId}" +
        "&Status=$status";

    log("Customer Report Api Url : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Customer Report Response : ${response.body}");

      CustomerReportModel customerReportModel =
          CustomerReportModel.fromJson(json.decode(response.body));
      isSuccessStatus = customerReportModel.success.obs;

      if (isSuccessStatus.value) {
        customerReportList.clear();

        customerReportList = customerReportModel.data;
        log("customerReportList : ${customerReportList.length}");
      } else {
        log("getFilterCustomerReportFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getFilterCustomerReportFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getCustomerReportFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
