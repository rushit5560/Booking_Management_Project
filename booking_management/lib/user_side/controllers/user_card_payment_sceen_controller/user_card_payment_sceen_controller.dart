import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/user_side/controllers/user_checkout_screen_controller/user_checkout_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/payment_keys.dart';


class UserCardPaymentScreenController extends GetxController {
  String bookingPrice = Get.arguments[0];
  String bookingSubId = Get.arguments[1];
  String vendorStripeAccId = Get.arguments[2];
  String payCurrencySymbol = Get.arguments[3];
  String orderQuantity = Get.arguments[4];
  String bookingUserName = Get.arguments[5];
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool isProceedToPayButton = true.obs;

  ApiHeader apiHeader = ApiHeader();

  Map<String, dynamic>? paymentIntentData;

  calculateAmount(int amount) {
    int price = amount * 100;
    return price;
  }

  calculateAdminCharges(int amount) {
    // int price = amount * 100;
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

      log("vendor acc id is ::: $vendorStripeAccId");

      Map<String, dynamic> body = {
        'amount': userPayingAmount.toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
        "transfer_data[amount]": adminFeesAmount.toString(),
        "transfer_data[destination]": vendorStripeAccId,
      };
      log('body: $body');

      //    Subscription subscription =
      // Subscription.create(params);

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer ${PaymentKeys.secretKey}',
            'Content-type': 'application/x-www-form-urlencoded'
          });

      var resBody = jsonDecode(response.body);

      var resCode = response.statusCode;
      log("response.statusCode: $resCode");
      log("payment intent res body: $resBody");

      if (resCode != 200) {
        var errorMsg = resBody["error"]["code"];
        Get.snackbar("Payment Failed", "Vendor Account has $errorMsg");
        isLoading(false);
      } else {
        isLoading(true);
      }

      // log(response.body.toString());
      return jsonDecode(response.body.toString());
    } catch (e) {
      log("Create Payment Intent error found ::: $e");
      print("error occured : ${e.toString()}");
      rethrow;
    }
  }

  Future<void> initPaymentSheet(
      {
        context,
        userPayingAmount,
        adminFeesAmount,
      }) async {
    try {
      isLoading(true);
      log(bookingPrice);

      final checkoutController = Get.find<UserCheckoutScreenController>();
      var price = double.parse(bookingPrice);

      log("booking UserName is : $bookingUserName");
      log("price passing is : $price");
      log("price symbol is : $payCurrencySymbol");

      paymentIntentData = await createPaymentIntent(
        userPayingAmount: userPayingAmount,
        adminFeesAmount: adminFeesAmount,
        currency: payCurrencySymbol == "\$" ? "aud" : "inr",
      );

      log('paymentIntentData: $paymentIntentData');
      // var adminCharges =
      //     (int.parse(cardScreenController.bookingPrice) / 100) * 10;

      // Stripe
      // var stripeAccId = Stripe.stripeAccountId;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          //client_secret
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          merchantDisplayName: UserDetails.userName == ''
              ? bookingUserName
              : UserDetails.userName,
          customerId: paymentIntentData!['customer'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
          customFlow: true,
          style: ThemeMode.light,
          testEnv: true,
          applePay: false,
          googlePay: false,
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
      log('responseFinal1234');
      await checkoutController.checkOutSubmitFunction();

      // await getPaymentIdFunction(
      //   paymentIntentData!['id'],
      //   paymentIntentData!['client_secret'],
      // );

      // isLoading(false);//todo - Remove isLoading
      isProceedToPayButton(true);
    } catch (e) {
      isProceedToPayButton(true);
      isLoading(false);
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
        isProceedToPayButton(true);
        log("Error ::: $e");
        rethrow;
      }
    } finally {
      // isLoading(false); //todo -> Remove this loading to loading continue in card check out screen
      isProceedToPayButton(true);
    }
  }




  /*Future<Map<String, dynamic>> createStripePaymentSession({
    required String transactionPriceId,

  }) async {
    try {
      Stripe.merchantIdentifier;

      log("stripe key is ::: $vendorStripeAccId");

      Map<String, dynamic> body = {
        // 'api_key': PaymentKeys.secretKey,
        'success_url': "https://example.com/success",
        'cancel_url': "https://example.com/cancel",
        'payment_method_types[]': 'card',
        "line_items": [
          {
            "price": transactionPriceId,
            "quantity": 1,
          }
        ],
        "mode": "payment",
      };
      log('body: $body');

      //    Subscription subscription =
      // Subscription.create(params);

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/checkout/sessions'),
          body: body,
          headers: {
            'Authorization': 'Bearer ${PaymentKeys.secretKey}',
            'Content-type': 'application/x-www-form-urlencoded'
          });

      log("response.body is :: ${response.body}");

      var resBody = jsonDecode(response.body);

      // var resCode = response.statusCode;
      // log("response.statusCode: $resCode");
      // log("payment intent res body: $resBody");
      //
      // if (resCode != 200) {
      //   var errorMsg = resBody["error"]["code"];
      //   Get.snackbar("Payment Failed", "Vendor Account has $errorMsg");
      //   isLoading(false);
      // } else {
      //   isLoading(true);
      // }

      // log(response.body.toString());
      return jsonDecode(response.body.toString());
    } catch (e) {
      log("createStripePaymentSession error found ::: $e");
      print("createStripePaymentSession error occured : ${e.toString()}");
      rethrow;
    }
  }*/

  /*checkoutSubscriptionSuccess() async {
    // final userCheckoutController = Get.find<UserCheckoutScreenController>();
    // await vendorSubscriptionPlanScreenController
    //     .purchaseSubscriptionPlanFunction(
    //   productId: bookingSubId,
    // );

    // await userCheckoutController.checkOutSubmitFunction();
    Get.snackbar(
      "Success",
      "Appointment Booked Successfully",
    );

    // Purchase plan api call
    // log("booked sub id success == $bookingSubId");
    // log("booked sub id success == $bookingSubId");

    // log("booked amount price  == $bookingPrice");
    // log("booked amount price  == $bookingPrice");
    // isLoading(false);
    // Timer(
    //   const Duration(seconds: 2),
    //   () {
    //     Get.offAll(() => BookingSuccessScreen());
    //   },
    // );
    // isLoading(false);
  }*/

  @override
  void dispose() {
    super.dispose();
    bookingPrice = "";
    bookingSubId = "";
  }
}
