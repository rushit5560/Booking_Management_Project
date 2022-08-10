import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/vendor_side/controllers/vendor_subscription_plan_screen_controller/vendor_subscription_plan_screen_controller.dart';
import 'package:booking_management/vendor_side/screens/vendor_index_screen/vendor_index_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/payment_keys.dart';
import '../../../user_side/model/vendor_details_screen_models/country_model.dart';
import '../../screens/vendor_card_payment_screen/vendor_card_payment_sceen.dart';

class VendorCardPaymentScreenController extends GetxController {
  var bookingPrice = Get.arguments[0];
  var bookingSubId = Get.arguments[1];
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> cardFormKey = GlobalKey<FormState>();

  Map<String, dynamic>? paymentIntentData;

  RxString paymentState = "initial".obs;

  CardFormEditController cardEditController = CardFormEditController();

  final SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  TextEditingController cCardNumber = TextEditingController();
  TextEditingController cExpiry = TextEditingController();
  TextEditingController cSecurity = TextEditingController();
  TextEditingController cName = TextEditingController();
  TextEditingController cCountry = TextEditingController();
  TextEditingController cZip = TextEditingController();

  CardBrand brand = CardBrand.n_a;

  List<CountryData> countriesList = [
    CountryData(),
  ];
  CountryData? countryData;

  RxString selectedCountryCode = "SC".obs;

  RxInt selectedCountryIndex = 0.obs;

  dynamic border = OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: AppColors.accentColor,
    ),
  );

  dynamic focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: AppColors.accentColor,
    ),
  );

  dynamic errorBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: Colors.red,
    ),
  );

  Future<void> getAllCountries() async {
    isLoading(true);
    String url = ApiUrl.getAllCountriesApi;
    log("get all countries Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Response : ${response.body}");

      CountryModel countriesModel =
          CountryModel.fromJson(json.decode(response.body));
      isSuccessStatus = countriesModel.success.obs;

      if (isSuccessStatus.value == true) {
        countriesList.clear();

        countriesList
            .add(CountryData(id: 0, code: "SC", country: "Select Country"));
        countriesList.addAll(countriesModel.workerList);
        countryData = countriesList[0];
        log("countryData :${countryData!.country}");
      } else {
        log("countries get false Else");
      }
    } catch (e) {
      log("countries get Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllCountries();
  }

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
