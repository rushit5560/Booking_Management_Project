import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/vendor_side/model/vendor_subscription_report_screen_model/vendor_subscription_report_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

class VendorSubscriptionReportScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();


  List subscriptionReportList = [];


  getSubscriptionReportFunction() async {
    isLoading(true);
    String url = ApiUrl.subscriptionReportApi + "?id=${UserDetails.uniqueId}";
    log("Appointment Report Api Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url),  headers: apiHeader.headers);
      log("Appointment Report Response : ${response.body}");

      VendorSubscriptionReportModel vendorSubscriptionReportModel = VendorSubscriptionReportModel.fromJson(json.decode(response.body));
      isSuccessStatus = vendorSubscriptionReportModel.success.obs;
      log('isSuccessStatus: $isSuccessStatus');

      if(isSuccessStatus.value) {
        subscriptionReportList.clear();

        subscriptionReportList = vendorSubscriptionReportModel.workerList;
        log("subscriptionReportList : ${subscriptionReportList.length}");
      } else {
        log("getSubscriptionReportFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getSubscriptionReportFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }


  @override
  void onInit() {
    getSubscriptionReportFunction();
    super.onInit();
  }


}