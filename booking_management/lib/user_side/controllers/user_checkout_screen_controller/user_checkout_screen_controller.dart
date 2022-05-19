import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/user_side/screens/booking_success_screen/booking_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

import '../../model/user_checkout_screen_model/checkout_model.dart';
import '../../model/user_checkout_screen_model/checkout_summary_model.dart';
import '../../model/user_checkout_screen_model/confirm_checkout_model.dart';

class UserCheckoutScreenController extends GetxController{
  String bookingId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  bool isPriceDisplay = false;

  ApiHeader apiHeader = ApiHeader();

  /// Summary
  String vendorName = "";
  String vendorImg = "";
  double vendorRating = 0;
  String vendorAddress = "";
  String bookingDate = "";
  String bookingTime = "";
  double bookingPrice = 0.0;
  int bookingQty = 0;
  double bookingTotalAmount = 0.0;

  GlobalKey<FormState> checkOutFormKey = GlobalKey();
  TextEditingController fNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController notesFieldController = TextEditingController();

  String returnId = "";

  RxString payment = 'Credit'.obs;



  getCheckoutFunction() async {
    isLoading(true);
    String url = ApiUrl.customerCheckoutApi + "?id=$bookingId&UserId=${UserDetails.uniqueId}";
    log("Get Checkout API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Checkout Response : ${response.body}");

      CheckoutModel checkoutModel = CheckoutModel.fromJson(json.decode(response.body));
      isSuccessStatus = checkoutModel.success.obs;

      if(isSuccessStatus.value) {
        isPriceDisplay = checkoutModel.workerList.isPriceDisplay;
        log("isPriceDisplay : $isPriceDisplay");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getCheckoutFunction Else Else");
      }

    } catch(e) {
      log("getCheckoutFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await getCheckoutSummaryFunction();
    }
  }

  /// Checkout Summary
  getCheckoutSummaryFunction() async {
    isLoading(true);
    String url = ApiUrl.customerCheckoutSummaryApi + "?id=$bookingId";
    log("Checkout Summary API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Checkout Summary Response : ${response.body}");

      CheckoutSummaryModel checkoutSummaryModel = CheckoutSummaryModel.fromJson(json.decode(response.body));
      isSuccessStatus = checkoutSummaryModel.success.obs;

      if(isSuccessStatus.value) {
        vendorName = checkoutSummaryModel.workerList.booking.vendor.businessName;
        vendorImg = checkoutSummaryModel.workerList.booking.vendor.businessLogo;
        vendorRating = double.parse(checkoutSummaryModel.workerList.booking.vendor.rating.toString());
        vendorAddress = "${checkoutSummaryModel.workerList.booking.vendor.state}, ${checkoutSummaryModel.workerList.booking.vendor.country}, "
            "${checkoutSummaryModel.workerList.booking.vendor.postcode}";
        String bookDate = checkoutSummaryModel.workerList.booking.startDateTime;
        String bDate1 = bookDate.substring(0, bookDate.length-9);
        bookingDate = bDate1;
        String bTime1 = bookDate.substring(11, bookDate.length-3);
        bookingTime = bTime1;
        bookingPrice = checkoutSummaryModel.workerList.price;
        bookingQty = checkoutSummaryModel.workerList.quantity;
        bookingTotalAmount = bookingPrice * bookingQty;

        log("vendorName : $vendorName");
        log("vendorImg : $vendorImg");
        log("vendorRating : $vendorRating");
        log("vendorAddress : $vendorAddress");
        log("bookingDate : $bookingDate");
        log("bookingTime : $bookingTime");
        log("bookingPrice : $bookingPrice");
        log("bookingQty : $bookingQty");
        log("bookingTotalAmount : $bookingTotalAmount");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getCheckoutSummaryFunction Else Else");
      }

    } catch(e) {
      log("getCheckoutSummaryFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }


  /// Submit Button
  checkOutSubmitFunction() async {
    isLoading(true);
    String url = ApiUrl.checkoutSubmitApi;
    log("Checkout Submit : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['BookingId'] = bookingId;
      request.fields['Email'] = emailFieldController.text.trim().toLowerCase();
      request.fields['Notes'] = notesFieldController.text.trim();
      request.fields['PhoneNo'] = phoneFieldController.text;
      request.fields['UserId'] = UserDetails.uniqueId;
      request.fields['UserName'] = fNameFieldController.text.trim();

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream.transform(utf8.decoder).listen((value) async {
        ConfirmCheckoutModel confirmCheckoutModel = ConfirmCheckoutModel.fromJson(json.decode(value));
        isSuccessStatus = confirmCheckoutModel.success.obs;

        if(isSuccessStatus.value) {
          returnId = confirmCheckoutModel.id;
          log("returnId : $returnId");
          Get.to(()=> BookingSuccessScreen(),
          arguments: returnId);
        } else {
          Fluttertoast.showToast(msg: "Something went wrong!");
          log("checkOutSubmitFunction Else Else");
        }

      });

    } catch(e) {
      log("checkOutSubmitFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }


  @override
  void onInit() {
    getCheckoutFunction();
    super.onInit();
  }

}
