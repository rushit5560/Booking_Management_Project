import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/payment_keys.dart';
import 'package:booking_management/user_side/model/get_payment_id_model/get_payment_id_model.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorCheckoutScreenController extends GetxController {
  RxString vendorPayment = 'Credit'.obs;
  double price = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  /// For Stripe
  Map<String, dynamic>? paymentIntentData;

  /// For Stripe
  /*Future<void> makePayment() async {
    isLoading(true);
    try {
       int price1 = price.toInt();
      //int price1 = int.parse(price.toString());
     // log('price1: $price1');
      paymentIntentData = await createPaymentIntent(price1, "USD");

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

      if(paymentIntentData!['id'] == null)
      {
        log('Failed');
        log('id: ${paymentIntentData!['id']}');
        Get.snackbar(
            "Failed", "Failed payment Id", snackPosition: SnackPosition.BOTTOM
        );
      } else{
        //log('Success');
        log('id: ${paymentIntentData!['id']}');
        // Get.snackbar(
        //     "Success", "Paid Successfully", snackPosition: SnackPosition.BOTTOM
        // );
        //getPaymentIdFunction(paymentIntentData!['id'], paymentIntentData!['client_secret']);
      }

      displayPaymentSheet();
      Get.back();
      //await checkOutSubmitFunction();

    } catch(e) {
      log("Make Payment Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  displayPaymentSheet() async {
    isLoading(true);
    try {
      Stripe.instance.presentPaymentSheet(
        parameters: PresentPaymentSheetParameters(
          clientSecret: paymentIntentData!['client_secret'],

          confirmPayment: true,
        ),
      ).then((value) {
        log('paymentIntentData id : ${paymentIntentData!['id']}');
        Get.snackbar("Success", "Paid Successfully", snackPosition: SnackPosition.TOP);
        log('paymentIntentData id : ${paymentIntentData!['id']}');
        log('Display paymentIntentData: $paymentIntentData');

        isLoading(true);
        paymentIntentData = null;
        isLoading(false);
        log('success');
      });



      //Get.snackbar("Success", "Paid Successfully", snackPosition: SnackPosition.TOP);
      //Get.back();
      //await getPaymentIdFunction(paymentIntentData!['id'], paymentIntentData!['client_secret']);
      // Get.snackbar(
      //     "Success", "Paid Successfully", snackPosition: SnackPosition.BOTTOM
      // );

      /// API Calling
      //checkOutSubmitFunction();


    } on StripeException catch(e) {
      log("StripeException Error ::: $e");
      // Get.snackbar(
      //     "Failed", "Failed to pay", snackPosition: SnackPosition.BOTTOM
      // );
    } catch(e) {
      log("Display Payment Sheet Error ::: $e");
      Get.snackbar(
          "Failed", "Failed to pay", snackPosition: SnackPosition.BOTTOM
      );
    } finally {
      isLoading(false);
      // log('paymentIntentData id : ${paymentIntentData!['id']}');
      // Get.snackbar("Success", "Paid Successfully", snackPosition: SnackPosition.TOP);
      //await checkOutSubmitFunction();
    }
  }*/

  calculateAmount(int amount) {
    int price1 = amount * 100;
    return price1.toString();
  }

  createPaymentIntent(int amount, String currency) async {
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
      //log("response.body: ${response.body}");
      //log("response.statusCode: ${response.statusCode}");
      return jsonDecode(response.body.toString());


    } catch(e) {
      log("Create Payment Intent ::: $e");
    }
  }

  /// Submit Button
  checkOutSubmitFunction() async {
    isLoading(true);
    String url = ApiUrl.checkoutSubmitApi;
    log("Checkout Submit : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.headers.addAll(apiHeader.headers);

      // request.fields['BookingId'] = bookingId;
      // request.fields['Email'] = emailFieldController.text.trim().toLowerCase();
      // request.fields['Notes'] = notesFieldController.text.trim();
      // request.fields['PhoneNo'] = phoneFieldController.text;
      // request.fields['UserId'] = UserDetails.uniqueId;
      // request.fields['UserName'] = fNameFieldController.text.trim();

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) async {
        log('value: $value');
       // ConfirmCheckoutModel confirmCheckoutModel = ConfirmCheckoutModel.fromJson(json.decode(value));
        //isSuccessStatus = confirmCheckoutModel.success.obs;

        if(isSuccessStatus.value) {
          //returnId = confirmCheckoutModel.id;
          //log("returnId : $returnId");
          //Get.to(()=> BookingSuccessScreen(), arguments: returnId);
          // if(returnId.isEmpty){
          //   Get.back();
          // } else{
          //   Get.to(()=> BookingSuccessScreen(), arguments: returnId);
          // }
          //Get.to(()=> BookingSuccessScreen(), arguments: returnId);
        } else {
          //Fluttertoast.showToast(msg: "Something went wrong!");
          log("checkOutSubmitFunction Else Else");
        }

      });

    } catch(e) {
      log("checkOutSubmitFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// get payment Id From payment
  /*getPaymentIdFunction(String id, String secretKey) async {
    isLoading(true);
    String url = ApiUrl.getPaymentIdApi;
    log("getPaymentId : $url");


    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.headers.addAll(apiHeader.headers);

      request.fields['BookingId'] = bookingId;
      request.fields['sessionId'] = secretKey;
      request.fields['paymentIntentld'] = id;

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      //log('getPaymentId response: ${response.statusCode}');

      response.stream.transform(utf8.decoder).listen((value) async {
        GetPaymentIdModel getPaymentIdModel = GetPaymentIdModel.fromJson(json.decode(value));
        isSuccessStatus = getPaymentIdModel.success.obs;
        log('isSuccessStatus: $isSuccessStatus');
        if(isSuccessStatus.value) {
          transactionId = getPaymentIdModel.workerList.id;
          log("transactionId : $transactionId");
        } else {
          //Fluttertoast.showToast(msg: "Something went wrong!");
          log("getPaymentId Else Else");
        }

      });

    } catch(e) {
      log("getPaymentId Error ::: $e");
    } finally {
      //isLoading(false);
      await displayPaymentSheet();
    }
  }*/

}