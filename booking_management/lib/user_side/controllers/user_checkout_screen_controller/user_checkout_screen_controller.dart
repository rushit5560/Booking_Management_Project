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
  String bookingPrice = "";
  int bookingQty = 0;
  int bookingTotalAmount = 0;
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
            checkoutSummaryModel.workerList.booking.vendor.rating.toString());
        vendorAddress =
            "${checkoutSummaryModel.workerList.booking.vendor.state}, ${checkoutSummaryModel.workerList.booking.vendor.country}, "
            "${checkoutSummaryModel.workerList.booking.vendor.postcode}";

        isPriceDisplay =
            checkoutSummaryModel.workerList.booking.vendor.isPriceDisplay;
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
        bookingPrice = checkoutSummaryModel.workerList.price.toString();
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
      getStripeKeyFunction();
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
    log("Checkout Submit : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.headers.addAll(apiHeader.headers);

      if (UserDetails.isUserLoggedIn == true) {
        if (isDurationAvailable == true) {
          if (isEvent == true) {
            request.fields['BookingId'] = bookingId;
            request.fields['Duration'] = "$duration";
            request.fields['Email'] =
                emailFieldController.text.trim().toLowerCase();
            request.fields['FullName'] = fNameFieldController.text.trim();
            request.fields['IsPriceDisplay'] = "$isPriceDisplay";
            request.fields['Notes'] = notesFieldController.text.trim();
            request.fields['PhoneNo'] = phoneFieldController.text;
            request.fields['Quantity'] = "$quantityValue";
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
            request.fields['ResourceId'] = "$selectedResource";
            request.fields['UserId'] = UserDetails.uniqueId;
          }
        } else {
          if (isEvent == true) {
            request.fields['BookingId'] = bookingId;
            request.fields['Email'] =
                emailFieldController.text.trim().toLowerCase();
            request.fields['FullName'] = fNameFieldController.text.trim();
            request.fields['IsPriceDisplay'] = "$isPriceDisplay";
            request.fields['Notes'] = notesFieldController.text.trim();
            request.fields['PhoneNo'] = phoneFieldController.text;
            request.fields['Quantity'] = "$quantityValue";
            request.fields['ResourceId'] = "$selectedResource";
            request.fields['UserId'] = UserDetails.uniqueId;
          } else {
            request.fields['BookingId'] = bookingId;
            request.fields['Email'] =
                emailFieldController.text.trim().toLowerCase();
            request.fields['FullName'] = fNameFieldController.text.trim();
            request.fields['IsPriceDisplay'] = "$isPriceDisplay";
            request.fields['Notes'] = notesFieldController.text.trim();
            request.fields['PhoneNo'] = phoneFieldController.text;
            request.fields['ResourceId'] = "$selectedResource";
            request.fields['UserId'] = UserDetails.uniqueId;
          }
        }
      } else {
        if (isDurationAvailable == true) {
          if (isEvent == true) {
            request.fields['BookingId'] = bookingId;
            request.fields['Duration'] = "$duration";
            request.fields['Email'] =
                emailFieldController.text.trim().toLowerCase();
            request.fields['FullName'] = fNameFieldController.text.trim();
            request.fields['IsPriceDisplay'] = "$isPriceDisplay";
            request.fields['Notes'] = notesFieldController.text.trim();
            request.fields['PhoneNo'] = phoneFieldController.text;
            request.fields['Quantity'] = "$quantityValue";
            request.fields['ResourceId'] = "$selectedResource";
          } else {
            request.fields['BookingId'] = bookingId;
            request.fields['Duration'] = "$duration";
            request.fields['Email'] =
                emailFieldController.text.trim().toLowerCase();
            request.fields['FullName'] = fNameFieldController.text.trim();
            request.fields['IsPriceDisplay'] = "$isPriceDisplay";
            request.fields['Notes'] = notesFieldController.text.trim();
            request.fields['PhoneNo'] = phoneFieldController.text;
            request.fields['ResourceId'] = "$selectedResource";
          }
        } else {
          if (isEvent == true) {
            request.fields['BookingId'] = bookingId;
            request.fields['Email'] =
                emailFieldController.text.trim().toLowerCase();
            request.fields['FullName'] = fNameFieldController.text.trim();
            request.fields['IsPriceDisplay'] = "$isPriceDisplay";
            request.fields['Notes'] = notesFieldController.text.trim();
            request.fields['PhoneNo'] = phoneFieldController.text;
            request.fields['Quantity'] = "$quantityValue";
            request.fields['ResourceId'] = "$selectedResource";
          } else {
            request.fields['BookingId'] = bookingId;
            request.fields['Email'] =
                emailFieldController.text.trim().toLowerCase();
            request.fields['FullName'] = fNameFieldController.text.trim();
            request.fields['IsPriceDisplay'] = "$isPriceDisplay";
            request.fields['Notes'] = notesFieldController.text.trim();
            request.fields['PhoneNo'] = phoneFieldController.text;
            request.fields['ResourceId'] = "$selectedResource";
          }
        }
      }
      request.fields['UserName'] = fNameFieldController.text.trim();

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) async {
        log('value: $value');
        ConfirmCheckoutModel confirmCheckoutModel =
            ConfirmCheckoutModel.fromJson(json.decode(value));
        isSuccessStatus = confirmCheckoutModel.success.obs;

        if (isSuccessStatus.value) {
          returnId = confirmCheckoutModel.id;
          log("returnId : $returnId");
          Get.to(() => BookingSuccessScreen(), arguments: returnId);

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
    } catch (e) {
      log("checkOutSubmitFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// For Stripe
  Future<void> initPaymentSheet() async {
    try {
      // final url = Uri.parse("Stripe payment function URL");
      // final response = await http.get(
      //   url,
      //   headers: {
      //     "Content-Type":"application/json"
      //   },
      // );

      print(bookingPrice);
      var decimalList = bookingPrice.split(".")[0];
      var price = int.tryParse(decimalList);
      print(price.runtimeType);
      print(price);
      paymentIntentData = await createPaymentIntent(price!, "USD");

      log('paymentIntentData: $paymentIntentData');

      // Stripe.publishableKey = publishableKey;
      // await Stripe.instance.applySettings();

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Enable custom flow
          customFlow: true,

          //client_secret
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          // Customer keys
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
          // customerId: paymentIntentData!['customer'],

          applePay: true,
          googlePay: true,
          testEnv: true,
          style: ThemeMode.dark,
          merchantCountryCode: 'US',
          merchantDisplayName: UserDetails.userName,
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      //     .whenComplete(() async {
      //   if (paymentIntentData!['id'] == null) {
      //     log('Failed');
      //     log('id: ${paymentIntentData!['id']}');
      //     Get.snackbar(
      //       "Failed",
      //       "Failed payment Id",
      //       snackPosition: SnackPosition.BOTTOM,
      //     );
      //   } else {
      //     log('payment id: ${paymentIntentData!['id']}');

      //     // Get.snackbar(
      //     //     "Success", "Paid Successfully", snackPosition: SnackPosition.BOTTOM
      //     // );

      //     ///now finally display payment sheeet

      //     // await getPaymentIdFunction(
      //     //   paymentIntentData!['id'],
      //     //   paymentIntentData!['client_secret'],
      //     // );
      //   }
      // });
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
      log("Make Payment Error ::: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      int amount, String currency) async {
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
      log("Create Payment Intent ::: $e");
      print("error occured : ${e.toString()}");
      rethrow;
    }
  }

  calculateAmount(int amount) {
    int price = amount * 100;
    return price.toString();
  }

  Future<void> displayPaymentSheet() async {
    //isLoading(true);
    try {
      Stripe.instance.presentPaymentSheet();

      // .catchError(
      //   (error, stackTrace) {
      //     log("onerror block : ");
      //     Get.snackbar(
      //       "Failed to pay",
      //       "$error $stackTrace",
      //       colorText: AppColors.blackColor,
      //       backgroundColor: AppColors.whiteColor,
      //       snackPosition: SnackPosition.BOTTOM,
      //     );
      //     log('Exception/DISPLAYPAYMENTSHEET  ==> $error');

      //     throw error.toString();
      //   },
      // );

      // ScaffoldMessenger.of(Get.context!).showSnackBar(
      //   SnackBar(
      //     content: Text('Payment option selected'),
      //   ),
      // );
      // confirmPayment();
      // then(
      //   (value) async {
      //     log('paymentIntentData id : ${paymentIntentData!['id'].toString()}');
      //     log('Display paymentIntent clientsecret data: ${paymentIntentData!['client_secret'].toString()}');
      //     print(
      //         'payment intent amount + ${paymentIntentData!['amount'].toString()}');
      //     print('payment intent' + paymentIntentData.toString());

      // Get.snackbar(
      //   "Success",
      //   "Paid Successfully",
      //   snackPosition: SnackPosition.TOP,
      // );

      // isLoading(true);
      // await checkOutSubmitFunction();
      // paymentIntentData = null;
      // isLoading(false);

      // log('success');

      // await Stripe.instance.confirmPayment();
      //   },
      // ).

    } catch (e) {
      if (e is StripeException) {
        Get.snackbar(
          "Failed to pay",
          "Error from Stripe: ${e.error.localizedMessage}",
          colorText: AppColors.blackColor,
          backgroundColor: AppColors.whiteColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        throw e.toString();
      } else {
        log("StripeException Error occured ::: ${e.toString()}");
        Get.snackbar(
          "Failed to pay",
          "Unforeseen error: ${e}",
          colorText: AppColors.blackColor,
          backgroundColor: AppColors.whiteColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        throw e.toString();
      }

      // var errorMsg = e.error;
      // print(errorMsg.code);
      // print(errorMsg.declineCode);
      // print(errorMsg.localizedMessage);
      // print(errorMsg.message);
      // print(errorMsg.stripeErrorCode);

// switch (errorMsg == )

    }
  }

  Future<void> confirmPayment() async {
    try {
      // 4. Confirm the payment sheet.
      await Stripe.instance.confirmPaymentSheetPayment();
      // step.value = 0;

      // setState(() {
      // });

      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text('Payment succesfully completed'),
        ),
      );
    } on Exception catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text('Unforeseen error: ${e}'),
          ),
        );
      }
    }
  }

  getStripeKeyFunction() async {
    isLoading(true);
    String url = ApiUrl.getSecretKeyApi;
    log("Get Stripe Secret Key API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
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

    log("selectedResourceIsEvent : $selectedResourceIsEvent");

    super.onInit();
  }
}
