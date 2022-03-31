import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/user_side/model/user_business_details_model/user_business_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BusinessDetailsScreenController extends GetxController{
  final TextEditingController reviewFieldController = TextEditingController();
  GlobalKey<FormState> reviewFormKey = GlobalKey<FormState>();
  RxBool isOverviewSelected = true.obs;
  RxBool isReviewSelected = false.obs;
  RxString service = 'Daily Checkup'.obs;

  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;

  String businessName = '';
  int ratting = 0;
  String description = "";
  double price = 0.0;
  String mobileNo= "";
  String address= "";

  int vendorId = Get.arguments;
  //Data ? businessDetailsList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    businessDetails();
  }

  businessDetails()async {
    isLoading(true);
    String url = ApiUrl.userBusinessDetailsApi + "?VendorId=$vendorId";
    log('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Response : ${response.body}');

      UserBusinessDetailsModel userBusinessDetailsModel = UserBusinessDetailsModel.fromJson(json.decode(response.body));
      isStatus = userBusinessDetailsModel.statusCode.obs;
      log("status : $isStatus");

      if(isStatus.value == 200){
        log("success");
        businessName = userBusinessDetailsModel.data.vendorBooking.businessName;
        ratting = userBusinessDetailsModel.data.review.ratting;
        description = userBusinessDetailsModel.data.review.description;
        price = userBusinessDetailsModel.data.price;
        mobileNo = userBusinessDetailsModel.data.mobileNo;
        address = userBusinessDetailsModel.data.vendorBooking.address1;
        //log('allBusinessList : $pendingList');

      } else {
        log('Get All Business Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
      isLoading(false);
    }
  }
}