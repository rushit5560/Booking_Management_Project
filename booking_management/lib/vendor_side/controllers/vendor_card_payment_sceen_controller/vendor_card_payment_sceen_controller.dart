import 'dart:collection';
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
  var bookingInterval = Get.arguments[2];
  var bookingCurrency = Get.arguments[3];

  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  Map<String, dynamic>? paymentIntentData;

  calculateAmount(int amount) {
    int price = amount * 100;
    return price.toString();
  }

  Future<Map<String, dynamic>> createCustomer() async {
    String url = 'https://api.stripe.com/v1/customers';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${PaymentKeys.secretKey}',
        'Content-type': 'application/x-www-form-urlencoded'
      },
      body: {
        'description': UserDetails.userName,
      },
    );
    var resBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log("create customer response if ${resBody}");
      return json.decode(response.body);
    } else {
      log("create customer method else error ${resBody}");

      throw 'Failed to register as a customer.';
    }
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
        },
      );
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

  Future<Map<String, dynamic>> getProduct() async {
    try {
      // Map<String, dynamic> body = {
      //   'id': bookingSubId,
      // };

      var url = 'https://api.stripe.com/v1/products?id:$bookingSubId';

      log("get product details url : $url");

      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${PaymentKeys.secretKey}',
          'Content-type': 'application/x-www-form-urlencoded'
        },
      );
      log("\n\n response.statusCode: ${response.statusCode}");
      log("get product res body: ${response.body}");
      // log(response.body.toString());
      return jsonDecode(response.body.toString());
    } catch (e) {
      log("Create Payment Intent error found ::: $e");
      print("error occured : ${e.toString()}");
      rethrow;
    }
  }

  //create vendor stripe subscription
  Future<Map<String, dynamic>> createSubscriptionPlan(
    String customerId,
    String priceId,
  ) async {
    log("customer id Is : $customerId");

    // List<Map<String, dynamic>> items = [
    //   {
    //     "price": "price_1LZfm72eZvKYlo2CTSzfbawl",
    //   }
    // ];

    String url = 'https://api.stripe.com/v1/subscriptions';

    Map<String, dynamic> body = {
      "customer": customerId,
      'items[0][price]': priceId,
    };
    // Map<String, dynamic> body = {
    //   'customer': customerId,
    //   'items[0][price]': 'xxxxx_xxxxxxxxxxxxxxxxxx',
    // };

    log("before passing data map : ${jsonEncode(body)}");
    try {
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          'Authorization': 'Bearer ${PaymentKeys.secretKey}',
          'Content-type': 'application/x-www-form-urlencoded'
        },
      );

      var resBody = json.decode(response.body);
      log("\n\n create subscription plan response : $resBody");
      if (response.statusCode == 200) {
        log("\n\n create subscription plan response success");
        return json.decode(response.body);
      } else {
        log("\n\n subscription plan response error else : $resBody");

        throw 'Failed to register as a subscriber.';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> initPaymentSheet() async {
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

      log('paymentIntentData: $paymentIntentData');
      // var adminCharges =
      //     (int.parse(cardScreenController.bookingPrice) / 100) * 10;

      // Stripe
      // var stripeAccId = Stripe.stripeAccountId;
      final customer = await createCustomer();
      final paymentMethod = await createPaymentMethod(
        number: '4242424242424242',
        expMonth: '03',
        expYear: '23',
        cvc: '123',
      );
      await attachPaymentMethod(
        paymentMethodId: paymentMethod['id'],
        customerId: customer['id'],
      );
      final productBody = await getProduct();
      // await createSubscrptionPrice();
      // await createSubscriptionPlan(
      //   customer['id'],
      //   "price_1LU32KKo2grgSU3GamuFbz01",
      // );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          //http_secret
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          merchantDisplayName: UserDetails.userName,
          customerId: paymentIntentData!['customer'],

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
      //   paymentIntentData!['http_secret'],
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
        log("Error stripepay init ::: $e");
        rethrow;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<Map<String, dynamic>> attachPaymentMethod({
    required String paymentMethodId,
    required String customerId,
  }) async {
    final String url =
        'https://api.stripe.com/v1/payment_methods/$paymentMethodId/attach';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${PaymentKeys.secretKey}',
        'Content-type': 'application/x-www-form-urlencoded'
      },
      body: {
        'customer': customerId,
      },
    );
    var resBody = json.decode(response.body);
    if (response.statusCode == 200) {
      log("attachPaymentMethod rezponse : $resBody");
      return json.decode(response.body);
    } else {
      log("attachPaymentMethoderror else : $resBody");
      throw 'Failed to attach PaymentMethod.';
    }
  }

  Future<Map<String, dynamic>> updateCustomer(
      String paymentMethodId, String customerId) async {
    final String url = 'https://api.stripe.com/v1/customers/$customerId';

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${PaymentKeys.secretKey}',
        'Content-type': 'application/x-www-form-urlencoded'
      },
      body: {
        'invoice_settings[default_payment_method]': paymentMethodId,
      },
    );
    var resBody = json.decode(response.body);
    if (response.statusCode == 200) {
      log("updateCustomer method rezponse : $resBody");
      return json.decode(response.body);
    } else {
      log("updateCustomer method error else : $resBody");
      throw 'Failed to update Customer.';
    }
  }

  Future<Map<String, dynamic>> createPaymentMethod(
      {required String number,
      required String expMonth,
      required String expYear,
      required String cvc}) async {
    String url = 'https://api.stripe.com/v1/payment_methods';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${PaymentKeys.secretKey}',
        'Content-type': 'application/x-www-form-urlencoded'
      },
      body: {
        'type': 'card',
        'card[number]': number,
        'card[exp_month]': expMonth,
        'card[exp_year]': expYear,
        'card[cvc]': cvc,
      },
    );
    var resBody = json.decode(response.body);
    if (response.statusCode == 200) {
      log("create payment method rezponse : $resBody");
      return json.decode(response.body);
    } else {
      log("create payment method error else : $resBody");

      throw 'Failed to create PaymentMethod.';
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

  //create vendor stripe price
  Future<Map<String, dynamic>> createSubscrptionPrice() async {
    log("interval  Is : $bookingInterval");
    log("unitamount price Is : $bookingPrice");
    log("currency Is : $bookingCurrency");
    log("prodId Is : $bookingSubId");

    String url = 'https://api.stripe.com/v1/prices';

    Map<String, Object> recurring = {
      'currency': bookingCurrency,
      "interval": bookingInterval,
    };

    Map<String, Object> params = {
      // "unit_amount": bookingPrice,
      "recurring": recurring,
      "product": bookingSubId,
    };

    try {
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode(params),
        headers: {
          'Authorization': 'Bearer ${PaymentKeys.secretKey}',
          'Content-type': 'application/x-www-form-urlencoded'
        },
      );

      var resBody = json.decode(response.body);
      log("price response is : $resBody");
      if (response.statusCode == 200) {
        log("price api success");
        return json.decode(response.body);
      } else {
        log("price response error else : $resBody");

        throw 'Failed to create price as a subscriber.';
      }
    } catch (e) {
      log("create price error catched .../ ${e}");
      rethrow;
    }
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
