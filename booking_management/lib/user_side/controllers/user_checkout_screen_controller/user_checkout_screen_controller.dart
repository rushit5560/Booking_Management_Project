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
import 'package:intl/intl.dart';

import '../../model/user_checkout_screen_model/checkout_model.dart';
import '../../model/user_checkout_screen_model/checkout_summary_model.dart';
import '../../model/user_checkout_screen_model/confirm_checkout_model.dart';
import '../../model/user_checkout_screen_model/criterialist_get_model.dart';

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
  String resourceName = "";
  String endBookingTime = "";
  String endBookingDate = "";
  String priceCurrencySymbol = "";
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

  List<CriteriaCountList> criteriasCountList = [];

  List<String> critSubList = [];
  List<List<String>> attendeeCritDetailsList = [];

  List<TextEditingController> attendeeNameControllerList = [];
  RxInt numberOfDropdown = 0.obs;
  List<Map<String, dynamic>> selectedValuesPassList = [];

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
        phoneFieldController.text = checkoutModel.workerList.phoneNo;

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
    log("res id is  : ${selectedResource}");

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

        priceCurrencySymbol =
            checkoutSummaryModel.workerList.booking.vendor.country == "AU"
                ? "\$"
                : "₹";
        vendorAccountStripeId = checkoutSummaryModel
            .workerList.booking.vendor.vendorStripeAccountId;
        resourceName = checkoutSummaryModel.workerList.booking.resourceName;
        log("isprice display is : ${checkoutSummaryModel.workerList.booking.vendor.isPriceDisplay}");

        String startBookDate =
            checkoutSummaryModel.workerList.booking.startDateTime;
        String bDate1 = DateFormat("dd/MM/yyyy")
            .format(DateTime.parse(startBookDate))
            .split("T")[0];
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
      getResourceCriteria();
      // isLoading(false);
      // if(isPriceDisplay == true) {
      //   //call api
      //   await getPaymentIdFunction();
      // } else {
      //   isLoading(false);
      // }
      // getStripeKeyFunction();
    }
  }

  /// getResourceCriteria Summary
  getResourceCriteria() async {
    // isLoading(true);
    String url = ApiUrl.getResourceCriteriasListApi +
        "?resourceId=$selectedResource&no=1";
    log("getResourceCriteria URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log("getResourceCriteria Response body: ${response.body}");

      CriteriaListGetModel criteriaListGetModel =
          CriteriaListGetModel.fromJson(json.decode(response.body));
      isSuccessStatus = criteriaListGetModel.success.obs;

      if (isSuccessStatus.value) {
        if (criteriaListGetModel.data[0].criteriaList != []) {
          criteriasCountList = criteriaListGetModel.data[0].criteriaList;

          numberOfDropdown.value = criteriasCountList.length;
          attendeeNameControllerList.clear();

          attendeeNameControllerList.add(TextEditingController());
          for (int i = 0; i < numberOfDropdown.value; i++) {
            critSubList.add(criteriasCountList[i].criteriasList[0].value);
            // for (int j = 0;
            //     j < criteriasCountList[i].criteriasList.length;
            //     j++) {
            // }

            // attendeeCritDetailsList.add(critSubList);
            // critSubList.clear();
          }

          log("critSubList display is : ${critSubList.toString()}");
          // log("attendeeCritDetailsList display is : ${attendeeCritDetailsList.toString()}");
        }

        String selectedValue = "";

        // var criteriaList =
        //     checkoutSummaryModel.workerList.booking.vendor.businessName;
        // vendorImg = checkoutSummaryModel.workerList.booking.vendor.businessLogo;
        // vendorRating = double.parse(
        //     checkoutSummaryModel.workerList.review.ratting.toString());

        // bookingTotalAmount = bookingPrice * bookingQty;
        //

      } else {
        //Fluttertoast.showToast(msg: "Something went wrong!");
        log("getResourceCriteria Else Else");
      }
    } catch (e) {
      log("getResourceCriteria Error ::: $e");
      rethrow;
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

  // /// get payment Id From payment
  // Future<void> getPaymentIdFunction(String id, String secretKey) async {
  //   // isLoading(true);
  //   String url = ApiUrl.getPaymentIdApi;
  //   log("getPaymentId : $url");

  //   try {
  //     var request = http.MultipartRequest('POST', Uri.parse(url));
  //     request.headers.addAll(apiHeader.headers);

  //     request.fields['BookingId'] = bookingId;
  //     request.fields['sessionId'] = secretKey;
  //     request.fields['paymentIntentld'] = id;

  //     log("Fields : ${request.fields}");
  //     log('request.headers: ${request.headers}');

  //     var response = await request.send();
  //     // log('getPaymentId response: ${response.}');

  //     response.stream.transform(utf8.decoder).listen((value) async {
  //       GetPaymentIdModel getPaymentIdModel =
  //           GetPaymentIdModel.fromJson(json.decode(value));
  //       isSuccessStatus = getPaymentIdModel.success.obs;

  //       log('isSuccessStatus: $isSuccessStatus');
  //       if (isSuccessStatus.value) {
  //         transactionId = getPaymentIdModel.workerList.id;
  //         log("transactionId : $transactionId");
  //       } else {
  //         //Fluttertoast.showToast(msg: "Something went wrong!");
  //         log("getPaymentId Else Else");
  //       }
  //     });
  //     // finally display payment sheet
  //   } catch (e) {
  //     log("getPaymentId Error ::: $e");
  //   } finally {
  //     //isLoading(false);

  //   }
  // }

  /// Submit Button
  checkOutSubmitFunction() async {
    isLoading(true);
    String url = ApiUrl.checkoutSubmitApi;
    log("Checkout Submit func after purchase : $url");
    int quantityVar = 1;

    if (isEvent == true) {
      quantityVar = quantityValue.value;
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
        request.fields['Quantity'] = "$quantityVar";
        request.fields['ResourceId'] = "$selectedResource";
        request.fields['UserId'] = UserDetails.uniqueId;
        request.fields['Attendees'] = jsonEncode(selectedValuesPassList);
      } else {
        request.fields['BookingId'] = bookingId;
        request.fields['Duration'] = "$duration";
        request.fields['Email'] =
            emailFieldController.text.trim().toLowerCase();
        request.fields['FullName'] = fNameFieldController.text.trim();
        request.fields['IsPriceDisplay'] = "$isPriceDisplay";
        request.fields['Notes'] = notesFieldController.text.trim();
        request.fields['PhoneNo'] = phoneFieldController.text;
        request.fields['Quantity'] = "$quantityVar";
        request.fields['ResourceId'] = "$selectedResource";
        request.fields['Attendees'] = jsonEncode(selectedValuesPassList);
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
          makeTransactionInDb(
            bookingSuccessId: returnId,
            quantityValue: quantityVar.toString(),
            userBookingNotes: notesFieldController.text.trim(),
          ).then(
            (value) {
              Get.to(
                () => BookingSuccessScreen(),
                arguments: returnId,
              );
            },
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

  Future<void> makeTransactionInDb({
    required String bookingSuccessId,
    required String quantityValue,
    required String userBookingNotes,
  }) async {
    isLoading(true);

    final checkoutController = Get.find<UserCheckoutScreenController>();

    log('book Success Id: $bookingSuccessId');
    log('booking quantity value is : $quantityValue');
    log('booking notes text is : $userBookingNotes');
    String url = ApiUrl.transactionApi;
    log("makeTransactionInDb url : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      if (UserDetails.isUserLoggedIn) {
        request.fields['bookingId'] = bookingSuccessId;
        request.fields['FullName'] = UserDetails.userName;
        request.fields['Email'] = UserDetails.email;

        request.fields['PhoneNo'] = UserDetails.phoneNo;
        request.fields['Notes'] = userBookingNotes;
        request.fields['Quantity'] = quantityValue;
        request.fields['UserId'] = UserDetails.uniqueId;
      } else {
        request.fields['bookingId'] = bookingSuccessId;
        request.fields['FullName'] =
            checkoutController.fNameFieldController.text;
        request.fields['Email'] = checkoutController.emailFieldController.text;

        request.fields['PhoneNo'] =
            checkoutController.phoneFieldController.text;
        request.fields['Notes'] = checkoutController.notesFieldController.text;
        request.fields['Quantity'] = quantityValue;
        // request.fields['UserId'] =
        //     UserDetails.isUserLoggedIn ? UserDetails.uniqueId : "";
      }

      // request.fields['sessionId'] = secretKey;
      // request.fields['paymentIntentld'] = id;

      log("makeTransactionInDb Fields : ${request.fields}");
      log('makeTransactionInDb headers: ${request.headers}');

      var response = await request.send();

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        log('makeTransactionInDb response body: $value');
        GetPaymentIdModel getPaymentIdModel =
            GetPaymentIdModel.fromJson(json.decode(value));
        isSuccessStatus = getPaymentIdModel.success.obs;

        log('isSuccessStatus: $isSuccessStatus');
        if (isSuccessStatus.value) {
          var transactionId = getPaymentIdModel.workerList.id;
          var bookingIdGet = getPaymentIdModel.workerList.bookingId;
          log("transactionId : $transactionId");
          log("bookingIdGet : $bookingIdGet");
        } else {
          // Fluttertoast.showToast(msg: "Something went wrong!");
          log("makeTransactionInDb Else Else");
        }
      });
    } catch (e) {
      log("makeTransactionInDb Error ::: $e");
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
