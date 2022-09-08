import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/payment_keys.dart';
import 'package:booking_management/user_side/model/get_payment_id_model/get_payment_id_model.dart';
import 'package:booking_management/user_side/model/get_stripe_secret_key_model/get_stripe_secret_key_model.dart';
import 'package:booking_management/user_side/screens/booking_success_screen/booking_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

import '../../model/user_checkout_screen_model/checkout_model.dart';
import '../../model/user_checkout_screen_model/checkout_summary_model.dart';
import '../../model/user_checkout_screen_model/confirm_checkout_model.dart';

class UserCheckoutScreenController extends GetxController {
  String bookingId = Get.arguments[0];
  String userName = Get.arguments[1];
  String userEmail = Get.arguments[2];
  bool selectedResourceIsEvent = Get.arguments[3];
  int duration = Get.arguments[4];
  int selectedResource = Get.arguments[5];
  bool isDurationAvailable = Get.arguments[6];
  bool isEvent = Get.arguments[7];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  bool isPriceDisplay = false;
  String secretKey = "";
  String publishableKey = "";

  ApiHeader apiHeader = ApiHeader();

  /// For Stripe
  Map<String, dynamic>? paymentIntentData;

  /// Summary
  String vendorName = "";
  String vendorImg = "";
  double vendorRating = 0;
  String vendorAddress = "";
  String bookingDate = "";
  String bookingTime = "";
  String endBookingTime = "";
  String endBookingDate = "";
  RxDouble bookingPrice = 10.00.obs;
  int bookingQty = 0;
  int bookingTotalAmount = 0;
  String stripeID = "";
  String vendorAccountStripeId = "";
  int transactionId = 0;

  GlobalKey<FormState> checkOutFormKey = GlobalKey();
  TextEditingController fNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController notesFieldController = TextEditingController();

  String returnId = "";

  RxString payment = 'Credit'.obs;

  List<int> quantityList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  RxInt quantityValue = 1.obs;

  /// Checkout
  getCheckoutFunction() async {
    isLoading(true);
    log('bookingId: $bookingId');
    String url = ApiUrl.customerCheckoutApi +
        "?id=$bookingId&UserId=${UserDetails.uniqueId}";
    log("Get Checkout API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log("Checkout Response : ${response.body}");

      CheckoutModel checkoutModel =
          CheckoutModel.fromJson(json.decode(response.body));
      isSuccessStatus = checkoutModel.success.obs;

      if (isSuccessStatus.value) {
        // isPriceDisplay = checkoutModel.workerList.isPriceDisplay;

        log("worker email : ${checkoutModel.workerList.email}");
        // log("isPriceDisplay : $isPriceDisplay");
      } else {
        //Fluttertoast.showToast(msg: "Something went wrong!");
        log("getCheckoutFunction Else Else");
      }
    } catch (e) {
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
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log("Checkout Summary Response : ${response.body}");

      CheckoutSummaryModel checkoutSummaryModel =
          CheckoutSummaryModel.fromJson(json.decode(response.body));
      isSuccessStatus = checkoutSummaryModel.success.obs;

      if (isSuccessStatus.value) {
        vendorName =
            checkoutSummaryModel.workerList.booking.vendor.businessName;
        vendorImg = checkoutSummaryModel.workerList.booking.vendor.businessLogo;
        vendorRating = double.parse(
            checkoutSummaryModel.workerList.review.ratting.toString());
        vendorAddress =
            "${checkoutSummaryModel.workerList.booking.vendor.state}, ${checkoutSummaryModel.workerList.booking.vendor.country}, "
            "${checkoutSummaryModel.workerList.booking.vendor.postcode}";
        isPriceDisplay =
            checkoutSummaryModel.workerList.booking.vendor.isPriceDisplay;
        stripeID = checkoutSummaryModel.workerList.booking.vendor.stripeId;
        vendorAccountStripeId = checkoutSummaryModel
            .workerList.booking.vendor.vendorStripeAccountId;
        log("isprice display is : ${checkoutSummaryModel.workerList.booking.vendor.isPriceDisplay}");

        String startBookDate =
            checkoutSummaryModel.workerList.booking.startDateTime;
        String bDate1 = startBookDate.substring(0, startBookDate.length - 9);
        bookingDate = bDate1;
        String bTime1 = startBookDate.substring(11, startBookDate.length - 3);
        bookingTime = bTime1;

        String endBookDate =
            checkoutSummaryModel.workerList.booking.endDateTime;
        // String endDate1 = endBookDate.substring(0, endBookDate.length - 23);
        // endBookingDate = endDate1;
        String endTime1 = endBookDate.substring(11, endBookDate.length - 3);
        endBookingTime = endTime1;
        //
        bookingPrice.value = checkoutSummaryModel.workerList.price;
        bookingQty = checkoutSummaryModel.workerList.quantity;

        // bookingTotalAmount = bookingPrice * bookingQty;
        //
        log("vendorName : $vendorName");
        log("vendorImg : $vendorImg");
        log("vendorRating : $vendorRating");
        log("vendorAddress : $vendorAddress");
        log("bookingDate : $bookingDate");
        log("bookingTime : $bookingTime");
        //log("endBookingDate: $endBookingDate");
        log("endBookingTime : $endBookingTime");
        // log("bookingPrice : $bookingPrice");
        // log("bookingQty : $bookingQty");
        // log("bookingTotalAmount : $bookingTotalAmount");
        log("stripeID : $stripeID");
        log("vendorAccountStripeId : $vendorAccountStripeId");
      } else {
        //Fluttertoast.showToast(msg: "Something went wrong!");
        log("getCheckoutSummaryFunction Else Else");
      }
    } catch (e) {
      log("getCheckoutSummaryFunction Error ::: $e");
    } finally {
      isLoading(false);
      // if(isPriceDisplay == true) {
      //   //call api
      //   await getPaymentIdFunction();
      // } else {
      //   isLoading(false);
      // }
      // getStripeKeyFunction();
    }
  }

  /// get payment Id From payment
  Future<void> getPaymentIdFunction(String id, String secretKey) async {
    // isLoading(true);
    String url = ApiUrl.getPaymentIdApi;
    log("getPaymentId : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['BookingId'] = bookingId;
      request.fields['sessionId'] = secretKey;
      request.fields['paymentIntentld'] = id;

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      // log('getPaymentId response: ${response.}');

      response.stream.transform(utf8.decoder).listen((value) async {
        GetPaymentIdModel getPaymentIdModel =
            GetPaymentIdModel.fromJson(json.decode(value));
        isSuccessStatus = getPaymentIdModel.success.obs;

        log('isSuccessStatus: $isSuccessStatus');
        if (isSuccessStatus.value) {
          transactionId = getPaymentIdModel.workerList.id;
          log("transactionId : $transactionId");
        } else {
          //Fluttertoast.showToast(msg: "Something went wrong!");
          log("getPaymentId Else Else");
        }
      });
      // finally display payment sheet
    } catch (e) {
      log("getPaymentId Error ::: $e");
    } finally {
      //isLoading(false);

    }
  }

  /// Submit Button
  checkOutSubmitFunction() async {
    isLoading(true);
    String url = ApiUrl.checkoutSubmitApi;
    log("Checkout Submit func after purchase : $url");
    int durationVar = 0;

    if (isEvent == true) {
      durationVar = quantityValue.value;
    }

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      if (UserDetails.isUserLoggedIn == true) {
        request.fields['BookingId'] = bookingId;
        request.fields['Duration'] = "$duration";
        request.fields['Email'] =
            emailFieldController.text.trim().toLowerCase();
        request.fields['FullName'] = fNameFieldController.text.trim();
        request.fields['IsPriceDisplay'] = "$isPriceDisplay";
        request.fields['Notes'] = notesFieldController.text.trim();
        request.fields['PhoneNo'] = phoneFieldController.text;
        request.fields['Quantity'] = "$durationVar";
        request.fields['ResourceId'] = "$selectedResource";
        request.fields['UserId'] = UserDetails.uniqueId;
      } else {
        request.fields['BookingId'] = bookingId;
        request.fields['Duration'] = "$duration";
        request.fields['Email'] =
            emailFieldController.text.trim().toLowerCase();
        request.fields['FullName'] = fNameFieldController.text.trim();
        request.fields['IsPriceDisplay'] = "$isPriceDisplay";
        request.fields['Notes'] = notesFieldController.text.trim();
        request.fields['PhoneNo'] = phoneFieldController.text;
        request.fields['Quantity'] = "$durationVar";
        request.fields['ResourceId'] = "$selectedResource";
      }
      // request.fields['UserName'] = fNameFieldController.text.trim();

      log("Checkout Submit func Fields : ${request.fields}");
      log('Checkout Submit func request.headers: ${request.headers}');

      var response = await request.send();

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        log('Checkout Submit func res body : $value');
        ConfirmCheckoutModel confirmCheckoutModel =
            ConfirmCheckoutModel.fromJson(json.decode(value));
        isSuccessStatus = confirmCheckoutModel.success.obs;

        if (isSuccessStatus.value) {
          returnId = confirmCheckoutModel.id;
          log("returnId : $returnId");
          Get.to(
            () => BookingSuccessScreen(),
            arguments: returnId,
          );
        } else {
          //Fluttertoast.showToast(msg: "Something went wrong!");
          log("checkOutSubmitFunction Else Else");
        }
      });
    } catch (e) {
      log("checkOutSubmitFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  getStripeKeyFunction() async {
    isLoading(true);
    String url = ApiUrl.getSecretKeyApi;
    log("Get Stripe Secret Key API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      log("Stripe Secret Key Response : ${response.body}");

      GetStripeSecretKeyModel getStripeSecretKeyModel =
          GetStripeSecretKeyModel.fromJson(json.decode(response.body));
      isSuccessStatus = getStripeSecretKeyModel.success.obs;

      if (isSuccessStatus.value) {
        secretKey = getStripeSecretKeyModel.workerList.secretKey;
        publishableKey = getStripeSecretKeyModel.workerList.publishableKey;
        log("secretKey : $secretKey");
        log("publishableKey : $publishableKey");
      } else {
        //Fluttertoast.showToast(msg: "Something went wrong!");
        log("getStripeKeyFunction Else Else");
      }
    } catch (e) {
      log("getStripeKeyFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    if (UserDetails.isUserLoggedIn == true) {
      fNameFieldController.text =
          UserDetails.userName.isEmpty ? "" : UserDetails.userName;
      emailFieldController.text =
          UserDetails.email.isEmpty ? "" : UserDetails.email;
      phoneFieldController.text =
          UserDetails.phoneNo.isEmpty ? "" : UserDetails.phoneNo;
    } else {
      fNameFieldController.text = userName;
      emailFieldController.text = userEmail;
    }

    getCheckoutFunction();

    // log("selectedResourceIsEvent : $selectedResourceIsEvent");

    super.onInit();
  }
}
