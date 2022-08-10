import 'dart:async';
import 'dart:developer';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../../common_modules/field_validation.dart';
import '../../../common_modules/validation.dart';
import '../../../user_side/model/vendor_details_screen_models/country_model.dart';
import '../../controllers/vendor_card_payment_sceen_controller/vendor_card_payment_sceen_controller.dart';
import '../vendor_sign_up_screen/vendor_sign_up_screen_widgets.dart';

class VendorCardPaymentScreen extends StatefulWidget {
  const VendorCardPaymentScreen({Key? key}) : super(key: key);

  @override
  State<VendorCardPaymentScreen> createState() =>
      _VendorCardPaymentScreenState();
}

class _VendorCardPaymentScreenState extends State<VendorCardPaymentScreen> {
  final cardScreenController = Get.put(VendorCardPaymentScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: cardScreenController.isLoading.value == true
              ? const CustomCircularLoaderModule()
              : SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonAppBarModule(
                        title: "Payment Checkout",
                        appBarOption: AppBarOption.singleBackButtonOption,
                      ),
                      const SizedBox(height: 20),
                      cardScreenController.isLoading.value == true
                          ? const CustomCircularLoaderModule()
                          : showCheckoutUI(context),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  showPaymentSuccessWidget(BuildContext context) {
    return Container();
  }

  showPaymentSummaryWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Summary",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "General Inspection ",
              style: TextStyle(
                color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "\$ ${cardScreenController.bookingPrice}",
              style: TextStyle(
                color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        UserDetails.roleName == "Customer"
            ? Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Administrative Charges ",
                      style: TextStyle(
                        color: AppColors.colorGreyIconLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "₹ ${(int.parse(cardScreenController.bookingPrice) / 100) * 10}",
                      style: TextStyle(
                        color: AppColors.colorGreyIconLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total ",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "\$ ${cardScreenController.bookingPrice}",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        // CardFormField(
        //   controller: cardController,
        //   dangerouslyGetFullCardDetails: true,
        //   dangerouslyUpdateFullCardDetails: true,
        // ),
        // const SizedBox(height: 20),
        // paymentStepper(context),
        ElevatedButton(
          onPressed: () async {
            await initPaymentSheet(context);
          },
          child: const Text("Procedd to Pay"),
          style: ElevatedButton.styleFrom(
              primary: AppColors.accentColor,
              fixedSize: Size(Get.size.width, 50),
              textStyle: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 20, vertical: 10);
  }

  showPaymentFailureWidget(BuildContext context, cardScreenController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Failed",
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payment Failed Due to insufficient account balance or any other reasons. ",
              style: TextStyle(
                color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "₹ ${cardScreenController.bookingPrice}",
              style: TextStyle(
                color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "",
              style: TextStyle(
                color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "",
              style: TextStyle(
                color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " ",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              " ",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        // CardFormField(
        //   controller: cardController,
        //   dangerouslyGetFullCardDetails: true,
        //   dangerouslyUpdateFullCardDetails: true,
        // ),
        // const SizedBox(height: 20),
        // paymentStepper(context),
        // ElevatedButton(
        //   onPressed: () async {
        //     await initPaymentSheet(context);
        //     // (cardController.details.complete)
        //     //     ? context.read<PaymentBloc>().add(
        //     //           PaymentCreateIntent(
        //     //             billingDetails: BillingDetails(
        //     //               email: UserDetails.email,
        //     //             ),
        //     //             items: const [
        //     //               {"id": 0},
        //     //               {"id": 1},
        //     //             ],
        //     //           ),
        //     //         )
        //     //     : Get.snackbar(
        //     //         "fill details",
        //     //         "form is not complete.",
        //     //       );
        //   },
        //   child: const Text("Procedd to Pay"),
        //   style: ElevatedButton.styleFrom(
        //       primary: AppColors.accentColor,
        //       fixedSize: Size(Get.size.width, 50),
        //       textStyle: TextStyle(
        //         color: AppColors.whiteColor,
        //         fontSize: 15,
        //         fontWeight: FontWeight.w500,
        //       )),
        // ),
      ],
    ).commonSymmetricPadding(horizontal: 20, vertical: 10);
  }

  Future<void> initPaymentSheet(context) async {
    try {
      print(cardScreenController.bookingPrice);

      // var decimalList = cardScreenController.bookingPrice.split(".")[0];
      // var price = int.tryParse(decimalList);

      var price = cardScreenController.bookingPrice;

      print(price.runtimeType);
      print(price);

      cardScreenController.paymentIntentData =
          await cardScreenController.createPaymentIntent(price!, "USD");

      log('paymentIntentData: ${cardScreenController.paymentIntentData}');
      // var adminCharges =
      //     (int.parse(cardScreenController.bookingPrice) / 100) * 10;

      // Stripe
      var stripeAccId = Stripe.stripeAccountId;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          //client_secret
          paymentIntentClientSecret:
              cardScreenController.paymentIntentData!['client_secret'],
          merchantDisplayName: UserDetails.userName,
          // Customer keys
          // customerId: cardScreenController.paymentIntentData!['customer'],

          customerEphemeralKeySecret:
              cardScreenController.paymentIntentData!['ephemeralKey'],
          customFlow: true,

          style: ThemeMode.light,
          testEnv: true,

          merchantCountryCode: 'US',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      await cardScreenController.checkoutSubscriptionSuccess();

      // cardScreenController.paymentState.value = "success";
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Payment successfull: now you can do other boooking.'),
      //   ),
      // );

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

      // Get.snackbar(
      //     "Success", "Paid Successfully", snackPosition: SnackPosition.BOTTOM
      // );

      ///now finally display payment sheeet

      // await getPaymentIdFunction(
      //   paymentIntentData!['id'],
      //   paymentIntentData!['client_secret'],
      // );
      //   }
      // });
    } catch (e) {
      if (e is StripeException) {
        // cardScreenController.paymentState.value = "failure";
        Get.snackbar(
          "Payment Failure",
          "${e.error.message}",
          colorText: Colors.black,
        );
        log("Make Payment Error ::: ${e.error.localizedMessage}");
      } else {
        // cardScreenController.paymentState.value = "failure";
        Get.snackbar(
          "Payment Failure",
          "$e",
          colorText: Colors.black,
        );
        log("Error ::: $e");
        rethrow;
      }
    }
  }

  showCheckoutUI(BuildContext context) {
    return Form(
      key: cardScreenController.cardFormKey,
      child: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(4, 16, 0, 4),
                child: Text(
                  'Card Information',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: cardScreenController.cCardNumber,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (CreditNumberSubmitRegexValidator().isValid(value!)) {
                return null;
              }
              return 'Enter a valid card number';
            },
            inputFormatters: [
              MaskedTextInputFormatter(
                mask: cardScreenController.brand == CardBrand.amex
                    ? 'xxxx xxxxxxx xxxx'
                    : 'xxxx xxxx xxxx xxxx',
                separator: ' ',
              )
            ],
            decoration: InputDecoration(
              hintText: '1234 1234 1234 1234',
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              border: cardScreenController.border,
              focusedBorder: cardScreenController.focusedBorder,
              errorBorder: cardScreenController.errorBorder,
            ),
            onChanged: (input) {
              CardBrand newBrand =
                  CardTypeRegs.findBrand(input.replaceAll(' ', ''));
              if (cardScreenController.brand != newBrand) {
                setState(() {
                  cardScreenController.brand = newBrand;
                });
              }
            },
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: cardScreenController.cExpiry,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (CreditExpirySubmitRegexValidator().isValid(value!)) {
                      return null;
                    }
                    return "Invalid expiry date";
                  },
                  inputFormatters: [
                    MaskedTextInputFormatter(
                      mask: 'xx/xx',
                      separator: '/',
                    )
                  ],
                  decoration: InputDecoration(
                    hintText: 'MM / YY',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    border: cardScreenController.border,
                    focusedBorder: cardScreenController.focusedBorder,
                    errorBorder: cardScreenController.errorBorder,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: cardScreenController.cSecurity,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (CreditCvvSubmitRegexValidator().isValid(value!)) {
                      return null;
                    }
                    return "Invalid security code";
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    MaskedTextInputFormatter(
                      mask: cardScreenController.brand == CardBrand.amex
                          ? 'xxxx'
                          : 'xxx',
                      separator: '',
                    )
                  ],
                  decoration: InputDecoration(
                    hintText: 'CVC',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    border: cardScreenController.border,
                    focusedBorder: cardScreenController.focusedBorder,
                    errorBorder: cardScreenController.errorBorder,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(4, 16, 0, 4),
                child: Text(
                  'Name on card',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: cardScreenController.cName,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (input) {
              if (input!.isNotEmpty &&
                  CreditNameSubmitRegexValidator().isValid(input)) {
                return null;
              } else {
                return 'Enter a valid name';
              }
            },
            decoration: InputDecoration(
              hintText: 'Name',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              border: cardScreenController.border,
              focusedBorder: cardScreenController.focusedBorder,
              errorBorder: cardScreenController.errorBorder,
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(4, 16, 0, 4),
                child: Text(
                  'Country or region',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CountrySelectModule(),
          const SizedBox(height: 10),
          TextFormField(
            controller: cardScreenController.cZip,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (input) {
              if (AddressPostalSubmitRegexValidator().isValid(input!)) {
                return null;
              } else if (input.length < 4 || input.length > 10) {
                return 'Enter a valid zip code';
              }
              return null;
              // return 'Enter a valid zip code';
            },
            inputFormatters: [
              MaskedTextInputFormatter(
                mask: 'xxxxxxxxxx',
                separator: '',
              ),
            ],
            decoration: InputDecoration(
              hintText: 'ZIP',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              border: cardScreenController.border,
              focusedBorder: cardScreenController.focusedBorder,
              errorBorder: cardScreenController.errorBorder,
            ),
          ),
          const SizedBox(height: 35),
          // SizedBox(
          //   height: 50,
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     child: Text(
          //       "Proceed to pay \$${cardScreenController.bookingPrice}",
          //       style: TextStyle(
          //         color: AppColors.whiteColor,
          //         fontSize: 17,
          //       ),
          //     ),
          //     style: ElevatedButton.styleFrom(
          //       primary: AppColors.accentColor,
          //     ),
          //   ),
          // ),
          CardPayButton(
            priceText: cardScreenController.bookingPrice.toString(),
            initStatus: CardPayButtonStatus.ready,
            onPressed: () {
              bool result =
                  cardScreenController.cardFormKey.currentState!.validate();

              if (result) {
                cardScreenController.cardFormKey.currentState!.save();
                if (cardScreenController.selectedCountryCode.value == "SC") {
                  Get.snackbar(
                    "Required Field",
                    "Please select country or region",
                    snackPosition: SnackPosition.BOTTOM,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  );
                }
                // widget.onCardPay(
                //   CardFormResults(
                //       email: cEmail.text,
                //       cardNumber: cCardNumber.text.replaceAll(' ', ''),
                //       cardExpiry: cExpiry.text,
                //       cardSec: cSecurity.text,
                //       name: cName.text,
                //       country: cCountry.text,
                //       zip: cZip.text,
                //       phone: '+1${cPhone.text.replaceAll('-', '')}'),
                // );
              }
            },
          ),
        ],
      ),
    ).commonSymmetricPadding(horizontal: 15, vertical: 8);
  }
}

class CountrySelectModule extends StatelessWidget {
  CountrySelectModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorCardPaymentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<CountryData>(
                // Initial Value
                value: screenController.countryData,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                style: const TextStyle(color: Colors.black),
                isExpanded: true,
                // Array list of items
                items: screenController.countriesList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.country!),
                  );
                }).toList(),

                // change button value to selected value
                onChanged: (newValue) {
                  screenController.isLoading(true);
                  screenController.countryData = newValue!;
                  // log("countryData : ${screenController.countryData!.code}");
                  screenController.selectedCountryCode.value =
                      "${screenController.countryData!.code}";

                  screenController.isLoading(false);
                },
              ),
            ).commonSymmetricPadding(horizontal: 10),
          ),
        ),
      ],
    );
  }
}

// ignore: constant_identifier_names
enum CardBrand { n_a, visa, masterCard, discover, amex, diners, jcb, union }

class CardTypeRegs {
  static final RegExp _visa = RegExp(r'^4[0-9]{0,}$');
  static final RegExp _master =
      RegExp(r'^(5[1-5]|222[1-9]|22[3-9]|2[3-6]|27[01]|2720)[0-9]{0,}$');
  static final RegExp _discover = RegExp(
      r'^(6011|65|64[4-9]|62212[6-9]|6221[3-9]|622[2-8]|6229[01]|62292[0-5])[0-9]{0,}$');
  static final RegExp _amex = RegExp(r'^3[47][0-9]{0,}$');
  static final RegExp _diners = RegExp(r'^3(?:0[0-59]{1}|[689])[0-9]{0,}$');
  static final RegExp _jcb = RegExp(r'^(?:2131|1800|35)[0-9]{0,}$');
  static final RegExp _union = RegExp(r'^(62|88)\d+$');

  static CardBrand findBrand(String cardNUmber) {
    if (_visa.matchAsPrefix(cardNUmber) != null) return CardBrand.visa;
    if (_master.matchAsPrefix(cardNUmber) != null) return CardBrand.masterCard;
    if (_discover.matchAsPrefix(cardNUmber) != null) return CardBrand.discover;
    if (_diners.matchAsPrefix(cardNUmber) != null) return CardBrand.diners;
    if (_amex.matchAsPrefix(cardNUmber) != null) return CardBrand.amex;
    if (_jcb.matchAsPrefix(cardNUmber) != null) return CardBrand.jcb;
    if (_union.matchAsPrefix(cardNUmber) != null) return CardBrand.union;
    return CardBrand.n_a;
  }
}

/// Status of the pay button based ont he transaction in progess.
/// The icon and text will update based on the status provided
enum CardPayButtonStatus {
  // ignore: constant_identifier_names
  not_ready,
  ready,
  processing,
  success,
  fail,
}

class CardPayButton extends StatefulWidget {
  /// Button representing the option to submit the credit card info and start
  /// the process of a payment.
  const CardPayButton({
    Key? key,
    required this.onPressed,
    this.initStatus,
    this.priceText,
  }) : super(key: key);
  final CardPayButtonStatus? initStatus;
  final Function() onPressed;
  final String? priceText;

  @override
  CardPayButtonState createState() => CardPayButtonState();
}

class CardPayButtonState extends State<CardPayButton> {
  CardPayButtonStatus status = CardPayButtonStatus.not_ready;

  updateStatus(CardPayButtonStatus newStatus) {
    setState(() {
      status = newStatus;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.initStatus != null) {
      status = widget.initStatus!;
    }
  }

  bool get shouldBeGreen => !shouldBeGrey && !shouldBeGreen;
  bool get shouldBeGrey => status == CardPayButtonStatus.not_ready;
  bool get shouldBeRed => status == CardPayButtonStatus.fail;

  Color get color => shouldBeGrey
      ? AppColors.colorGreyIconDark
      : (shouldBeRed ? Colors.red : AppColors.accentColor);

  Widget get displayedWidget {
    Widget w = Text('Pay  \$${widget.priceText}',
        style: TextStyle(color: Colors.grey.shade200, fontSize: 20.0));

    switch (status) {
      case CardPayButtonStatus.ready:
        break;
      case CardPayButtonStatus.processing:
        w = SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.green.shade50,
            strokeWidth: 2.0,
          ),
        );
        break;
      case CardPayButtonStatus.success:
        w = Icon(
          Icons.check_circle,
          color: Colors.green.shade100,
        );
        break;
      case CardPayButtonStatus.fail:
        w = Icon(
          Icons.highlight_remove_rounded,
          color: Colors.red.shade900,
        );
        break;
      default:
        break;
    }
    return w;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: (status == CardPayButtonStatus.ready)
          ? () => widget.onPressed()
          : () => {},
      child: displayedWidget,
    );
  }
}

/// Class that houses all expected form data from the checkout ui
class CardFormResults {
  /// Class that houses all expected form data from the checkout ui
  const CardFormResults({
    required this.email,
    required this.cardNumber,
    required this.cardExpiry,
    required this.cardSec,
    required this.name,
    required this.country,
    required this.zip,
    required this.phone,
  });

  /// email string
  final String email;

  /// 15 to 16 digit credit card number. numeric characters only and no spaces
  final String cardNumber;

  /// full expiration date string MM/YY format
  final String cardExpiry;

  /// cvv string. numeric characters only and no spaces
  final String cardSec;

  /// string representing buyer's name
  final String name;

  /// string representing billing country
  final String country;

  /// 5 digit zip / postal code. numeric characters only and no spaces
  final String zip;

  /// 10 digit phone number. numeric characters only and no spaces
  final String phone;

  /// getter to retrive the year from expiration string
  int get expYear => int.parse(cardExpiry.split('/')[1]) + 2000;

  /// getter to retrieve the expiration month from the expiration string
  int get expMonth => int.parse(cardExpiry.split('/')[0]);

  @override
  String toString() {
    return 'CardFormResults [$email , $cardNumber, $cardExpiry, $cardSec, $name, $country, $zip , $phone]';
  }
}
