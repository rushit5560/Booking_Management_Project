import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/common_ui/model/sign_out_model/sign_out_model.dart';
import 'package:booking_management/vendor_side/screens/vendor_index_screen/vendor_index_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/payment_keys.dart';

class VendorCardPaymentScreenController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  Map<String, dynamic>? paymentIntentData;
  var bookingPrice = Get.arguments[0];

  RxString paymentState = "initial".obs;

  CardFormEditController cardEditController = CardFormEditController();

  final SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<Map<String, dynamic>> createPaymentIntent(
    int amount,
    String currency,
  ) async {
    try {
      Map<String, dynamic> body = {
        "amount": calculateAmount(amount),
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
          });
      // log("payment intent res body: ${response.body}");
      //log("response.statusCode: ${response.statusCode}");
      return jsonDecode(response.body.toString());
    } catch (e) {
      log("Create Payment Intent error found ::: $e");
      print("error occured : ${e.toString()}");
      rethrow;
    }
  }

  checkoutSubscriptionSuccess() {
    Get.snackbar(
      "Success",
      "Subscription Purchased",
    );

    Get.to(() => VendorIndexScreen());
  }

  calculateAmount(int amount) {
    int price = amount * 100;
    return price.toString();
  }
}
