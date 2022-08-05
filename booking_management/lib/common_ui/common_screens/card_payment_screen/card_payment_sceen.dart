import 'dart:developer';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_ui/common_controller/card_payment_sceen_controller/card_payment_sceen_controller.dart';
import 'package:booking_management/user_side/controllers/user_checkout_screen_controller/user_checkout_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../common_modules/common_widgets.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';

class CardPaymentScreen extends StatefulWidget {
  const CardPaymentScreen({Key? key}) : super(key: key);

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  final cardScreenController = Get.put(CardPaymentScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonAppBarModule(
                title: "Payment Details",
                appBarOption: AppBarOption.singleBackButtonOption,
              ),
              const SizedBox(
                height: 20,
              ),
              showPaymentSummaryWidget(context),
              // cardScreenController.paymentState.value == "initial"
              //     ? showPaymentSummaryWidget(context)
              //     : cardScreenController.paymentState.value ==
              //             "failure"
              //         ? showPaymentFailureWidget(context)
              //         : cardScreenController.paymentState.value ==
              //                 "success"
              //             ? showPaymentSuccessWidget(context)
              //             : showPaymentSummaryWidget(context)
            ],
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
        SizedBox(height: 15),
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
        const SizedBox(height: 10),
        Row(
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
              "\$ ${(double.parse(cardScreenController.bookingPrice) / 100) * 10}",
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

  Future<void> initPaymentSheet(
    context,
  ) async {
    try {
      print(cardScreenController.bookingPrice);
      var decimalList = cardScreenController.bookingPrice.split(".")[0];
      var price = int.tryParse(decimalList);

      print(price.runtimeType);
      print(price);

      cardScreenController.paymentIntentData =
          await cardScreenController.createPaymentIntent(price!, "USD");

      log('paymentIntentData: ${cardScreenController.paymentIntentData}');
      // var adminCharges =
      //     (int.parse(cardScreenController.bookingPrice) / 100) * 10;

      // Stripe.instance.createPaymentMethod(
      //   const PaymentMethodParams.card(
      //     billingDetails: BillingDetails(),
      //   ),
      //   {
      //     "ApplicationFeeAmount": "$adminCharges",
      //   },
      // );

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
      await cardScreenController.checkOutSubmitFunction();

      // whenComplete(
      //   () async {
      //   },
      // ).

      // catchError((error, stackTrace) {
      //   log("Stripe error occured : ${error} ");

      //   if (error is StripeException) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text('Payment error : ${error.error.localizedMessage}'),
      //       ),
      //     );
      //     throw error;
      //   } else {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text('Error : $error'),
      //       ),
      //     );
      //     log("Error ::: $error");
      //     throw error;
      //   }
      // });

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
}

// bloc pattern code
// if (state.status == PaymentStatus.success) {
//   return Column(
//     children: [
//       const Text("The payment is successfull."),
//       SizedBox(height: 50),
//       ElevatedButton(
//         onPressed: () {
//           context.read<PaymentBloc>().add(PaymentStart());
//         },
//         child: Text("back to home"),
//       ),
//     ],
//   );
// }
// if (state.status == PaymentStatus.failure) {
//   return Column(
//     children: [
//       Text("The payment is successfull."),
//       SizedBox(height: 50),
//       ElevatedButton(
//         onPressed: () {
//           context.read<PaymentBloc>().add(PaymentStart());
//         },
//         child: Text("try again"),
//       ),
//     ],
//   );
// } else {
//   return const Center(child: CustomCircularLoaderModule());
// }
