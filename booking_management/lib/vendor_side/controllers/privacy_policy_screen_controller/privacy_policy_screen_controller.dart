import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/vendor_side/model/privacy_policy_model/privacy_policy_screen_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PrivacyPolicyScreenController extends GetxController{

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  String pageTitle = "";
  String pageDescription = "";

  getPrivacyPolicyFunction()async{
    isLoading(true);
    String url = ApiUrl.getPrivacyPolicyApi + "?pageName=Policy";
    log("Privacy Policy API URL : $url");
    log('apiHeader.headers: ${apiHeader.headers}');

    try {
      http.Response response = await http.get(Uri.parse(url) /*headers: apiHeader.headers*/);
      log("Privacy Policy Response Body : ${response.body}");

      GetPrivacyPolicyModel getPrivacyPolicyModel = GetPrivacyPolicyModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPrivacyPolicyModel.success.obs;
      log('isSuccessStatus: $isSuccessStatus');
      if(isSuccessStatus.value) {
        // orderDetailsData = getInvoiceDetailsModel.workerList;
        // log("orderDetailsData : $orderDetailsData");

        pageTitle = getPrivacyPolicyModel.data.pageTitle;
        pageDescription = getPrivacyPolicyModel.data.description;
        log('pageTitle: $pageTitle');

      } else {
        log("getOrderDetailsByIdFunction Else Else");
      }

    } catch(e) {
      log("getOrderDetailsByIdFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPrivacyPolicyFunction();
  }
}