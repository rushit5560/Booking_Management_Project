import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:get/get.dart';

import '../../model/vendor_subscription_plan_screen_models/get_all_subscription_model.dart';

class VendorSubscriptionPlanScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<SubscriptionWorkerList> allSubscriptionList = [];


  getAllSubscriptionPlanFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorSubscriptionPlanApi;
    log("Get All Subscription Plan API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Subscription Plan Response : ${response.body}");

      GetAllSubscriptionModel getAllSubscriptionModel = GetAllSubscriptionModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllSubscriptionModel.success.obs;

      if(isSuccessStatus.value) {
        allSubscriptionList.clear();
        allSubscriptionList = getAllSubscriptionModel.workerList;
        log("allSubscriptionList :${allSubscriptionList.length}");

      } else {
        log("getAllSubscriptionPlanFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }


    } catch(e) {
      log("getAllSubscriptionPlanFunction Error ::: $e");
    }finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllSubscriptionPlanFunction();
    super.onInit();
  }

}