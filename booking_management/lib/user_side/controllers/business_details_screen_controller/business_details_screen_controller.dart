import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_header.dart';
import '../../model/user_business_details_model/add_customer_review_model.dart';
import '../../model/user_business_details_model/get_business_hours_model.dart';
import '../../model/user_business_details_model/get_vendor_reviews_model.dart';
import '../../model/vendor_details_screen_models/vendor_details_model.dart';



class BusinessDetailsScreenController extends GetxController {
  int vendorId = Get.arguments;
  final TextEditingController reviewFieldController = TextEditingController();
  GlobalKey<FormState> reviewFormKey = GlobalKey<FormState>();
  RxBool isOverviewSelected = true.obs;
  RxBool isReviewSelected = false.obs;
  RxString service= 'Daily Checkup'.obs;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  String businessName = '';
  int ratting = 0;
  String description = "";
  double price = 0.0;
  String mobileNo= "";
  String address= "";

  RxDouble selectRating = 1.0.obs;

  List<ReviewDatum> reviewList = [];
  List<BusinessHoursDatum> businessHoursList = [];
  //Data ? businessDetailsList;


  VendorDetailsData? vendorDetailsData;

  ApiHeader apiHeader = ApiHeader();


  /// Get Vendor Details By Id
  getVendorDetailsByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorDetailsApi + "?id=$vendorId";
    log("Vendor Details API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Vendor Details Response : ${response.body}");

      VendorDetailsModel vendorDetailsModel = VendorDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = vendorDetailsModel.success.obs;

      if(isSuccessStatus.value) {
        vendorDetailsData = vendorDetailsModel.data;
        log("vendorDetailsData : $vendorDetailsData");
      } else {
        log("getVendorDetailsByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getVendorDetailsByIdFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      // isLoading(false);
      await getVendorReviewFunction();
    }
  }

  // businessDetails()async {
  //   isLoading(true);
  //   String url = ApiUrl.userBusinessDetailsApi + "?VendorId=$vendorId";
  //   log('Url : $url');
  //   log("VendorId=$vendorId");
  //
  //   try{
  //     http.Response response = await http.get(Uri.parse(url));
  //
  //     log('Business Details Response : ${response.body}');
  //
  //     UserBusinessDetailsModel userBusinessDetailsModel = UserBusinessDetailsModel.fromJson(json.decode(response.body));
  //     isStatusSuccess = userBusinessDetailsModel.success.obs;
  //     log("status : $isStatusSuccess");
  //
  //     if(isStatusSuccess.value){
  //       log("success");
  //       businessName = userBusinessDetailsModel.data.vendorBooking.businessName;
  //       ratting = userBusinessDetailsModel.data.review.ratting;
  //       description = userBusinessDetailsModel.data.review.description;
  //       price = userBusinessDetailsModel.data.price;
  //       mobileNo = userBusinessDetailsModel.data.mobileNo;
  //       address = userBusinessDetailsModel.data.vendorBooking.address;
  //       log('mobile: $mobileNo');
  //       log('address: $address');
  //       log('businessName: $businessName');
  //       //log('allBusinessList : $pendingList');
  //
  //     } else {
  //       log('Get All Business Else Else');
  //     }
  //   } catch(e) {
  //     log('Error : $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  /// Get Vendor Review
  getVendorReviewFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorReviewApi + "?id=$vendorId";
    log("Vendor Review API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("vendor Review API Response : ${response.body}");

      GetVendorReviewsModel getVendorReviewsModel = GetVendorReviewsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getVendorReviewsModel.success.obs;

      if(isSuccessStatus.value) {
        reviewList.clear();

        reviewList = getVendorReviewsModel.data;
        log("reviewList : ${reviewList.length}");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getVendorReviewFunction Else Else");
      }

    } catch(e) {
      log("getVendorReviewFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await getBusinessHoursFunction();
    }

  }

  /// Add Customer Review
  addCustomerReviewFunction() async {
    DateTime date = DateTime.now();
    String fDate = "${date.day}/${date.month}/${date.year}";

    isLoading(true);
    String url = ApiUrl.customerGiveReviewApi + "?id=$vendorId";
    log("Add Review API URL : $url");

    try {
      Map<String, dynamic> data = {
        "VendorId" : "$vendorId",
        "CustomerId" : "${UserDetails.tableWiseId}",
        "Description" : reviewFieldController.text.trim(),
        "Ratting" : "${selectRating.value}",
        "Date" : fDate
      };
      log("Data : $data");

      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.headers, body: jsonEncode(data));
      log("Add Review Response : ${response.statusCode}");
      log("Add Review Response : ${response.body}");

      AddCustomerReviewsModel addCustomerReviewsModel = AddCustomerReviewsModel.fromJson(json.decode(response.body));
      isSuccessStatus = addCustomerReviewsModel.success.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: addCustomerReviewsModel.data);
        await getVendorReviewFunction();
      } else {
        log("addCustomerReviewFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("addCustomerReviewFunction Error ::: $e");
    } finally{
      isLoading(false);
    }
  }

  /// Get Business Hours
  getBusinessHoursFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorBusinessHoursApi + "?vendorid=$vendorId";
    log("Get Business Hours API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Business Hours API URL : ${response.body}");

      GetBusinessHoursModel getBusinessHoursModel = GetBusinessHoursModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = getBusinessHoursModel.success;

      if(isSuccessStatus.value) {
        businessHoursList = getBusinessHoursModel.data;
        log("businessHoursList : ${businessHoursList.length}");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getBusinessHoursFunction Else Else");
      }


    } catch(e) {
      log("getBusinessHoursFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  // getUserReview()async{
  //   isLoading(true);
  //   String url = ApiUrl.getReviewApi + "?VendorId=$vendorId";
  //   log('vendor Id: $vendorId');
  //   log('Url : $url');
  //   try{
  //     http.Response response = await http.get(Uri.parse(url));
  //
  //     log('Response : ${response.body}');
  //
  //     GetVendorReviewsModel getVendorReviewsModel = GetVendorReviewsModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = getVendorReviewsModel.success.obs;
  //     log("status : $isSuccessStatus");
  //
  //     if(isSuccessStatus.value){
  //       reviewList = getVendorReviewsModel.data;
  //       log('allReviewList : $reviewList');
  //     } else {
  //       log('Get All Review Else Else');
  //     }
  //   } catch(e) {
  //     log('Review Error : $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // addReview()async{
  //   isLoading(true);
  //
  //   String url = ApiUrl.userAddReviewApi;
  //   log('Url : $url');
  //
  //   try{
  //     Map data = {
  //       "VendorId": "1",
  //       "CustomerId": "2",
  //       "Description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
  //       "Ratting": "4",
  //       "Id" : "8"
  //     };
  //
  //     log('data : $data');
  //     String body = json.encode(data);
  //
  //     http.Response response = await http.post(Uri.parse(url), body: data);
  //     log('Response : ${response.body}');
  //
  //     UserAddReviewModel addReviewModel = UserAddReviewModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = addReviewModel.success.obs;
  //
  //     log("status: $isSuccessStatus");
  //
  //     if(isSuccessStatus.value) {
  //       //String userToken = signInModel.token;
  //       //print('userToken : $userToken');
  //       // await sharedPreferenceData.setUserLoginDetailsInPrefs(userToken: "$userToken");
  //       // await createUserWallet();
  //       String message = addReviewModel.message;
  //       //String role = signInModel.role.name;
  //       Get.snackbar(message, '');
  //     } else {
  //       log('Add Review False False');
  //     }
  //
  //   } catch(e) {
  //     log('Review Error : $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }


  @override
  void onInit() {
    super.onInit();
    getVendorDetailsByIdFunction();
    // getUserReview();
  }

}