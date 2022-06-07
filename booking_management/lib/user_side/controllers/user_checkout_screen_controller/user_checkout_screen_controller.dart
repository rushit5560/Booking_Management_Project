import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/payment_keys.dart';
import 'package:booking_management/user_side/screens/booking_success_screen/booking_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
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

  /// For Stripe
  Map<String, dynamic>? paymentIntentData;

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



  /// Checkout
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

  /// For Stripe
  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent(bookingPrice, "USD");

      log('paymentIntentData: $paymentIntentData');

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            applePay: true,
            googlePay: true,
            // style: ThemeMode.dark,
            merchantCountryCode: 'US',
            merchantDisplayName: 'SetDayTime'
          )
      );

      await displayPaymentSheet();

    } catch(e) {
      log("Make Payment Error ::: $e");
    }
  }

  createPaymentIntent(double amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        "amount" : calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      log('body: $body');

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
          headers: {
            'Authorization': 'Bearer ${PaymentKeys.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded'
          }
      );
      log("response.body: ${response.body}");
      log("response.statusCode: ${response.statusCode}");
      return jsonDecode(response.body.toString());


    } catch(e) {
      log("Create Payment Intent ::: $e");
    }
  }

  calculateAmount(double amount) {
    double price = amount * 100;
    return price.toString();
  }

  displayPaymentSheet() async {
    try {
      Stripe.instance.presentPaymentSheet(
        parameters: PresentPaymentSheetParameters(
            clientSecret: paymentIntentData!['client_secret'],
          confirmPayment: true,
        )
      );

      isLoading(true);
      paymentIntentData = null;
      isLoading(false);


      Get.snackbar(
        "Success", "Paid Successfully", snackPosition: SnackPosition.BOTTOM
      );

      /// API Calling
      await checkOutSubmitFunction();


    } on StripeException catch(e) {
      log("StripeException Error ::: $e");
      Get.snackbar(
          "Failed", "Failed to pay", snackPosition: SnackPosition.BOTTOM
      );
    } catch(e) {
      log("Display Payment Sheet Error ::: $e");
      Get.snackbar(
          "Failed", "Failed to pay", snackPosition: SnackPosition.BOTTOM
      );
    }
  }



  @override
  void onInit() {
    fNameFieldController.text = UserDetails.userName.isEmpty ? "" : UserDetails.userName;
    emailFieldController.text = UserDetails.email.isEmpty ? "" : UserDetails.email;
    phoneFieldController.text = UserDetails.phoneNo.isEmpty ? "" : UserDetails.phoneNo;
    getCheckoutFunction();
    super.onInit();
  }



}
