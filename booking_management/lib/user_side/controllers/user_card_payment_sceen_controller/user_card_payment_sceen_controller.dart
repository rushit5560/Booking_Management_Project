import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/common_ui/model/sign_out_model/sign_out_model.dart';
import 'package:booking_management/user_side/controllers/user_checkout_screen_controller/user_checkout_screen_controller.dart';
import 'package:booking_management/user_side/screens/booking_success_screen/booking_success_screen.dart';
import 'package:booking_management/vendor_side/screens/invoice_report_screen/invoice_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/payment_keys.dart';

class UserCardPaymentScreenController extends GetxController {
  String bookingPrice = Get.arguments[0];
  String bookingSubId = Get.arguments[1];
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  Map<String, dynamic>? paymentIntentData;

  calculateAmount(int amount) {
    int price = amount * 100;
    return price;
  }

  calculateAdminCharges(int amount) {
    int price = amount * 100;
    int calPrice = (amount * 0.10).toInt();
    return calPrice;
  }

  Future<Map<String, dynamic>> createPaymentIntent({
    required int userPayingAmount,
    required int adminFeesAmount,
    required String currency,
  }) async {
    try {
      Stripe.merchantIdentifier;

      Map<String, dynamic> body = {
        'amount': userPayingAmount.toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
        "transfer_data[amount]": adminFeesAmount.toString(),
        "transfer_data[destination]": "acct_1LUVm2QPJWRM3XBj",
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

  Future<void> initPaymentSheet(
      {context, userPayingAmount, adminFeesAmount}) async {
    try {
      print(bookingPrice);

      var price = double.parse(bookingPrice);

      log("price passing is : $price");

      paymentIntentData = await createPaymentIntent(
        userPayingAmount: userPayingAmount,
        adminFeesAmount: adminFeesAmount,
        currency: "aud",
      );

      log('paymentIntentData: $paymentIntentData');
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
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
          customFlow: true,
          style: ThemeMode.light,
          testEnv: true,
          applePay: false,
          googlePay: false,
          merchantCountryCode: 'AUS',
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
    final userCheckoutController = Get.find<UserCheckoutScreenController>();
    // await vendorSubscriptionPlanScreenController
    //     .purchaseSubscriptionPlanFunction(
    //   productId: bookingSubId,
    // );

    await userCheckoutController.checkOutSubmitFunction();
    Get.snackbar(
      "Success",
      "Appointment Successfully Booked",
    );

    // Purchase plan api call
    log("booked sub id success == $bookingSubId");
    log("booked sub id success == $bookingSubId");

    log("booked amount price  == $bookingPrice");
    log("booked amount price  == $bookingPrice");

    Get.to(() => InvoiceReportScreen());
  }

  @override
  void dispose() {
    super.dispose();
    bookingPrice = "";
    bookingSubId = "";
  }
}
