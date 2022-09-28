import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/vendor_card_payment_screen/input_formatters.dart';
import 'package:flutter/cupertino.dart';
// import 'package:credit_card_field/credit_card_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../../common_ui/commom_widgets/common_dialogs/alert_dialog.dart';
import '../../../user_side/model/vendor_details_screen_models/country_model.dart';
import '../../controllers/vendor_card_payment_sceen_controller/vendor_card_payment_sceen_controller.dart';
import '../../controllers/vendor_subscription_plan_screen_controller/vendor_subscription_plan_screen_controller.dart';

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
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return const CustomAlertDialog();
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        key: cardScreenController.scaffoldKey,
        body: Obx(
          () => SafeArea(
            child: cardScreenController.isLoading.value
                ? const CustomCircularLoaderModule()
                : SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customAppbar(),
                        const SizedBox(height: 20),
                        cardFormView(cardScreenController),
                        showPaymentSummaryWidget(context),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  customAppbar() {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          color: AppColors.accentColor
          //color: Colors.grey
          ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftSideButton(),
            Row(
              children: [
                Text(
                  "Checkout",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            rightSideButton(),
          ],
        ),
      ),
    );
  }

  Widget leftSideButton() {
    return GestureDetector(
      onTap: () => showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return const CustomAlertDialog();
        },
      ),
      child: SizedBox(
        height: 50,
        width: 50,
        child: Image.asset(AppImages.backArrowImg),
      ),
    );
  }

  Widget rightSideButton() {
    return const SizedBox(
      height: 50,
      width: 50,
    );
  }

  cardFormView(VendorCardPaymentScreenController controller) {
    var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      borderSide: BorderSide(
        color: AppColors.blackColor,
        width: 0.8,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Form(
        key: controller.cardFormKey,
        autovalidateMode: cardScreenController.autoValidateMode,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberInputFormatter(),
              ],
              controller: controller.creditCardController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                labelText: "Card Number",
                filled: true,
                icon: CardUtils.getCardIcon(
                    cardScreenController.paymentCard.type),
                hintText: 'What number is written on card?',
              ),
              // maxLength: 19,
              validator: CardUtils.validateCardNum,
              obscureText: false,
              onSaved: (String? value) {
                print('onSaved = $value');
                print(
                    'Num controller has = ${cardScreenController.creditCardController.text}');
                cardScreenController.paymentCard.number =
                    CardUtils.getCleanedNumber(value!);
              },
              onChanged: (String? val) {
                getCardTypeFrmNumber();
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
                CardMonthInputFormatter()
              ],
              controller: controller.expirationController,
              decoration: InputDecoration(
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                filled: true,
                icon: Image.asset(
                  'assets/cardinfo/calender.png',
                  width: 30.0,
                  color: Colors.grey[600],
                ),
                hintText: 'MM/YY',
                labelText: 'Expiry Date',
              ),
              validator: CardUtils.validateDate,
              keyboardType: TextInputType.number,
              onSaved: (value) {
                List<int> expiryDate = CardUtils.getExpiryDate(value!);
                cardScreenController.paymentCard.month = expiryDate[0];
                cardScreenController.paymentCard.year = expiryDate[1];
              },
              onChanged: (value) {
                setState(() {
                  value = value.replaceAll(RegExp(r"\D"), "");
                  switch (value.length) {
                    case 0:
                      controller.expirationController.text = "MM/YY";
                      controller.expirationController.selection =
                          const TextSelection.collapsed(offset: 0);
                      break;
                    case 1:
                      controller.expirationController.text = "${value}M/YY";
                      controller.expirationController.selection =
                          const TextSelection.collapsed(offset: 1);
                      break;
                    case 2:
                      controller.expirationController.text = "$value/YY";
                      controller.expirationController.selection =
                          const TextSelection.collapsed(offset: 2);
                      break;
                    case 3:
                      controller.expirationController.text =
                          "${value.substring(0, 2)}/${value.substring(2)}Y";
                      controller.expirationController.selection =
                          const TextSelection.collapsed(offset: 4);
                      break;
                    case 4:
                      controller.expirationController.text =
                          "${value.substring(0, 2)}/${value.substring(2, 4)}";
                      controller.expirationController.selection =
                          const TextSelection.collapsed(offset: 5);
                      break;
                  }
                  if (value.length > 4) {
                    controller.expirationController.text =
                        "${value.substring(0, 2)}/${value.substring(2, 4)}";
                    controller.expirationController.selection =
                        const TextSelection.collapsed(offset: 5);
                  }
                });
              },
              cursorWidth: 0.0,
              obscureText: false,
            ),
            const SizedBox(height: 12),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              decoration: InputDecoration(
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                filled: true,
                icon: Image.asset(
                  'assets/cardinfo/card_cvv.png',
                  width: 30.0,
                  color: Colors.grey[600],
                ),
                hintText: 'Number behind the card',
                labelText: 'CVV',
              ),
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: false,
              ),
              controller: controller.cvvController,
              validator: CardUtils.validateCVV,
              onSaved: (value) {
                cardScreenController.paymentCard.cvv = int.parse(value!);
              },
              obscureText: false,
            ),
          ],
        ),
      ),
    );
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
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "General Inspection",
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
        const SizedBox(height: 15),
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
        getPayButton(),
      ],
    ).commonSymmetricPadding(horizontal: 20, vertical: 10);
  }

  void getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(
        cardScreenController.creditCardController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      cardScreenController.paymentCard.type = cardType;
    });
  }

  Future<void> validateInputs() async {
    if (cardScreenController.cardFormKey.currentState!.validate()) {
      cardScreenController.cardFormKey.currentState!.save();
      // Encrypt and send send payment details to payment gateway
      // _showInSnackBar('Payment card is valid');
      await cardScreenController.proceedForVendorSubscription();
    } else {
      setState(() {
        cardScreenController.autoValidateMode =
            AutovalidateMode.always; // Start validating on every change.
      });
      _showInSnackBar('Please fix the errors in red before submitting.');
    }
  }

  Widget getPayButton() {
    if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: validateInputs,
        color: CupertinoColors.activeBlue,
        child: const Text(
          "Proceed to Pay",
          style: TextStyle(fontSize: 17.0),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: validateInputs,
        child: const Text("Proceed to Pay"),
        style: ElevatedButton.styleFrom(
          primary: AppColors.accentColor,
          fixedSize: Size(Get.size.width, 50),
          textStyle: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
  }

  void _showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
      duration: const Duration(seconds: 3),
    ));
  }
}

class PaymentCard {
  CardType? type;
  String? number;
  String? name;
  int? month;
  int? year;
  int? cvv;

  PaymentCard(
      {this.type, this.number, this.name, this.month, this.year, this.cvv});

  @override
  String toString() {
    return '[Type: $type, Number: $number, Name: $name, Month: $month, Year: $year, CVV: $cvv]';
  }
}

enum CardType {
  Master,
  Visa,
  Verve,
  Discover,
  AmericanExpress,
  DinersClub,
  Jcb,
  Others,
  Invalid
}

class CardUtils {
  static const String fieldReq = 'This field is required';
  static const String numberIsInvalid = 'Card is invalid';
  static const String pay = 'Validate';

  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return fieldReq;
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return fieldReq;
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CardType.Master:
        img = 'mastercard_card.svg';
        break;
      case CardType.Visa:
        img = 'visa_card.svg';
        break;
      case CardType.Verve:
        img = 'verve_card.svg';
        break;
      case CardType.AmericanExpress:
        img = 'american_express_card.svg';
        break;
      case CardType.Discover:
        img = 'discover_card.svg';
        break;
      case CardType.DinersClub:
        img = 'dinners_club_card.svg';
        break;
      case CardType.Jcb:
        img = 'jcb_card.svg';
        break;
      case CardType.Others:
        icon = Icon(
          Icons.credit_card,
          size: 30.0,
          color: Colors.grey[600],
        );
        break;
      default:
        icon = Icon(
          Icons.warning,
          size: 30.0,
          color: Colors.grey[600],
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = SvgPicture.asset(
        'assets/svgs/$img',
        width: 30.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  /// With the card number with Luhn Algorithm
  /// https://en.wikipedia.org/wiki/Luhn_algorithm
  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return fieldReq;
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      return numberIsInvalid;
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return numberIsInvalid;
  }

  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.Master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.Visa;
    } else if (input.startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = CardType.Verve;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = CardType.AmericanExpress;
    } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
      cardType = CardType.Discover;
    } else if (input.startsWith(RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = CardType.DinersClub;
    } else if (input.startsWith(RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = CardType.Jcb;
    } else if (input.length <= 8) {
      cardType = CardType.Others;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }
}