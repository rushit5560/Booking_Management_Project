import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/vendor_side/controllers/vendor_subscription_plan_screen_controller/vendor_subscription_plan_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/vendor_index_screen/vendor_index_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/payment_keys.dart';
import '../../../user_side/model/vendor_details_screen_models/country_model.dart';

class VendorCardPaymentScreenController extends GetxController {
  var bookingPrice = Get.arguments[0];
  var bookingSubId = Get.arguments[1];
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  Map<String, dynamic>? paymentIntentData;

  calculateAmount(int amount) {
    int price = amount * 100;
    return price.toString();
  }

  Future<Map<String, dynamic>> createPaymentIntent(
    int amount,
    String currency,
  ) async {
    try {
      Stripe.merchantIdentifier;

      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
        // "transfer_data[amount]": "200",
        // "transfer_data[destination]": "acct_1LUVm2QPJWRM3XBj",
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

  Future<void> initPaymentSheet(context) async {
    try {
      // isLoading(true);
      print(bookingPrice);

      // var decimalList = cardScreenController.bookingPrice.split(".")[0];
      // var price = int.tryParse(decimalList);

      var price = bookingPrice;

      print(price.runtimeType);
      print(price);

      paymentIntentData = await createPaymentIntent(price!, "aud");

      // final data = await createTestPaymentSheet();

      log('paymentIntentData: ${paymentIntentData}');
      // var adminCharges =
      //     (int.parse(cardScreenController.bookingPrice) / 100) * 10;

      // Stripe
      var stripeAccId = Stripe.stripeAccountId;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          //client_secret
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          merchantDisplayName: UserDetails.userName,
          customerId: paymentIntentData!['customer'],
          // Customer keys
          // customerId: cardScreenController.paymentIntentData!['customer'],

          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
          customFlow: true,

          style: ThemeMode.light,
          testEnv: true,
          applePay: false,
          googlePay: false,

          // merchantCountryCode: 'US',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();

      await checkoutSubscriptionSuccess();

      // await getPaymentIdFunction(
      //   paymentIntentData!['id'],
      //   paymentIntentData!['client_secret'],
      // );

    } catch (e) {
      if (e is StripeException) {
        Get.snackbar(
          "Payment Failure",
          "${e.error.message}",
          colorText: Colors.black,
        );
        log("Make Payment Error ::: ${e.error.localizedMessage}");
      } else {
        Get.snackbar(
          "Payment Failure",
          "$e",
          colorText: Colors.black,
        );
        log("Error ::: $e");
        rethrow;
      }
    } finally {
      isLoading(false);
    }
  }

  checkoutSubscriptionSuccess() async {
    await sendEmailVendorSubConfirm().whenComplete(() {
      Get.snackbar(
        "Success",
        "Subscription Purchased",
      );
      Get.to(() => VendorIndexScreen());
    });

    // Purchase plan api call
    log("booked sub id success == $bookingSubId");
    log("booked sub id success == $bookingSubId");

    log("booked amount price  == $bookingPrice");
    log("booked amount price  == $bookingPrice");
  }

  Future<void> sendEmailVendorSubConfirm() async {
    // isLoading(true);
    log("Get user id is  : ${UserDetails.uniqueId}");
    String url = ApiUrl.vendorSendEmailApi + "?userId=${UserDetails.uniqueId}";
    log("Get Send Email Url  : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        /*headers: apiHeader.headers*/
      );
      log("Get Send Email response : ${response.body}");

      var resData = jsonDecode(response.body);

      // GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel =
      //     GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      var statCode = resData["statusCode"];
      var resMsg = resData["message"];
      var successStat = resData["success"];
      log("status code is : $statCode");
      log("res message  is : $resMsg");

      if (successStat == true) {
        log("Time List : $resMsg");
      } else {
        log("Get Send Email false Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("Get Send Email Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      // isLoading(true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    bookingPrice = null;
    bookingSubId = null;
  }
}
