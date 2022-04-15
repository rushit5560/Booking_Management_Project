import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/user_side/model/get_user_review_model/get_user_review_model.dart';
import 'package:booking_management/user_side/model/user_add_review_model/user_add_review_model.dart';
import 'package:booking_management/user_side/model/user_business_details_model/user_business_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BusinessDetailsScreenController extends GetxController{
  final TextEditingController reviewFieldController = TextEditingController();
  GlobalKey<FormState> reviewFormKey = GlobalKey<FormState>();
  RxBool isOverviewSelected = true.obs;
  RxBool isReviewSelected = false.obs;
  RxString service= 'Daily Checkup'.obs;

  RxBool isLoading = false.obs;
  RxBool isStatusSuccess = false.obs;

  String businessName = '';
  int ratting = 0;
  String description = "";
  double price = 0.0;
  String mobileNo= "";
  String address= "";

  int vendorId = Get.arguments;
  List<Datum> reviewList = [];
  //Data ? businessDetailsList;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    businessDetails();
    getUserReview();
  }

  businessDetails()async {
    isLoading(true);
    String url = ApiUrl.userBusinessDetailsApi + "?VendorId=$vendorId";
    log('Url : $url');
    log("VendorId=$vendorId");

    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Business Details Response : ${response.body}');

      UserBusinessDetailsModel userBusinessDetailsModel = UserBusinessDetailsModel.fromJson(json.decode(response.body));
      isStatusSuccess = userBusinessDetailsModel.success.obs;
      log("status : $isStatusSuccess");

      if(isStatusSuccess.value){
        log("success");
        businessName = userBusinessDetailsModel.data.vendorBooking.businessName;
        ratting = userBusinessDetailsModel.data.review.ratting;
        description = userBusinessDetailsModel.data.review.description;
        price = userBusinessDetailsModel.data.price;
        mobileNo = userBusinessDetailsModel.data.mobileNo;
        address = userBusinessDetailsModel.data.vendorBooking.address;
        log('mobile: $mobileNo');
        log('address: $address');
        log('businessName: $businessName');
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

  getUserReview()async{
    isLoading(true);
    String url = ApiUrl.getReviewApi + "?VendorId=$vendorId";
    log('vendor Id: $vendorId');
    log('Url : $url');
    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Response : ${response.body}');

      GetUserReviewModel getReviewModel = GetUserReviewModel.fromJson(json.decode(response.body));
      isStatusSuccess = getReviewModel.success.obs;
      log("status : $isStatusSuccess");

      if(isStatusSuccess.value){
        reviewList = getReviewModel.data;
        log('allReviewList : $reviewList');
      } else {
        log('Get All Review Else Else');
      }
    } catch(e) {
      log('Review Error : $e');
    } finally {
      isLoading(false);
    }
  }

  addReview()async{
    isLoading(true);

    String url = ApiUrl.userAddReviewApi;
    log('Url : $url');

    try{
      Map data = {
        "VendorId": "1",
        "CustomerId": "2",
        "Description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        "Ratting": "4",
        "Id" : "8"
      };

      log('data : $data');
      String body = json.encode(data);

      http.Response response = await http.post(Uri.parse(url), body: data);
      log('Response : ${response.body}');

      UserAddReviewModel addReviewModel = UserAddReviewModel.fromJson(json.decode(response.body));
      isStatusSuccess = addReviewModel.success.obs;

      log("status: $isStatusSuccess");

      if(isStatusSuccess.value) {
        //String userToken = signInModel.token;
        //print('userToken : $userToken');
        // await sharedPreferenceData.setUserLoginDetailsInPrefs(userToken: "$userToken");
        // await createUserWallet();
        String message = addReviewModel.message;
        //String role = signInModel.role.name;
        Get.snackbar(message, '');
      } else {
        log('Add Review False False');
      }

    } catch(e) {
      log('Review Error : $e');
    } finally {
      isLoading(false);
    }
  }
}