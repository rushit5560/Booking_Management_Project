import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/vendor_side/controllers/vendor_subscription_plan_screen_controller/vendor_subscription_plan_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/vendor_index_screen/vendor_index_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/payment_keys.dart';

class VendorCardPaymentScreenController extends GetxController {
  var bookingPrice = Get.arguments[0];
  var bookingSubId = Get.arguments[1];
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  Map<String, dynamic>? paymentIntentData;

  RxString paymentState = "initial".obs;

  CardFormEditController cardEditController = CardFormEditController();

  final SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  Future<Map<String, dynamic>> createPaymentIntent(
    int amount,
    String currency,
  ) async {
    try {

      Map<String, dynamic> tData = {
        "amount": "10",
        "destination": PaymentKeys.secretKey,
      };

      Map<String, dynamic> body = {
        // 'stripeAccount': UserDetails.stripeId,
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
        "transfer_data[amount]": "10",
        "transfer_data[destination]": "acct_1LPhP1B0iBNxAxS8",

      };
      log('body: $body');

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer ${PaymentKeys.secretKey}',

            'Content-type': 'application/x-www-form-urlencoded'
          });
      log("response.statusCode: ${response.statusCode}");
      log("payment intent res body: ${response.body}");
      // log(response.body.toString());
      return jsonDecode(response.body.toString());
    } catch (e) {
      log("Create Payment Intent error found ::: $e");
      print("error occured : ${e.toString()}");
      rethrow;
    }
  }

  checkoutSubscriptionSuccess() async {
    final vendorSubscriptionPlanScreenController =
        Get.find<VendorSubscriptionPlanScreenController>();
    Get.snackbar(
      "Success",
      "Subscription Purchased",
    );

    // Purchase plan api call
    await vendorSubscriptionPlanScreenController
        .purchaseSubscriptionPlanFunction(
      productId: bookingSubId,
    );
    log("booked sub id success == $bookingSubId");
    log("booked sub id success == $bookingSubId");

    log("booked amount price  == $bookingPrice");
    log("booked amount price  == $bookingPrice");

    Get.to(() => VendorIndexScreen());
  }

  calculateAmount(int amount) {
    int price = amount * 100;
    return price.toString();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bookingPrice = null;
    bookingSubId = null;
  }
}
