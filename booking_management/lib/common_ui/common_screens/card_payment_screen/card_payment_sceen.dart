import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_ui/common_controller/card_payment_sceen_controller/card_payment_sceen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../common_modules/common_widgets.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';

class CardPaymentScreen extends StatelessWidget {
  CardPaymentScreen({Key? key}) : super(key: key);

  final cardScreenController = Get.put(CardPaymentScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => cardScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonAppBarModule(
                        title: "Payment Confirmation",
                        appBarOption: AppBarOption.singleBackButtonOption,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Card Form",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          CardFormField(
                            controller: cardScreenController.cardEditController,
                          ),
                          const SizedBox(height: 20),
                          // paymentStepper(context),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Pay"),
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.accentColor,
                                textStyle: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ],
                      ).commonAllSidePadding(20),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  // Widget paymentStepper(context) {
  //   var stepList = [
  //     "initial",
  //     "waiting",
  //     "success",
  //     "confirm",
  //   ];
  //   return Container(
  //     height: cardScreenController.size.height * 0.5,
  //     width: cardScreenController.size.width,
  //     child: StatusChange.tileBuilder(
  //       theme: StatusChangeThemeData(
  //         direction: Axis.horizontal,
  //         connectorTheme: ConnectorThemeData(
  //           space: 1.0,
  //           thickness: 1.0,
  //         ),
  //       ),
  //       builder: StatusChangeTileBuilder.connected(
  //         itemWidth: (_) => MediaQuery.of(context).size.width / stepList.length,

  //         //  _processes.length,

  //         contentWidgetBuilder: (context, index) {
  //           return Padding(
  //             padding: const EdgeInsets.all(15.0),
  //             child: Text(
  //               'add content here',
  //               style: TextStyle(
  //                 color: Colors
  //                     .blue, // change color with dynamic color --> can find it with example section
  //               ),
  //             ),
  //           );
  //         },
  //         nameWidgetBuilder: (context, index) {
  //           return Padding(
  //             padding: const EdgeInsets.all(20),
  //             child: Text(
  //               'your text ',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: AppColors.accentColor,
  //               ),
  //             ),
  //           );
  //         },
  //         indicatorWidgetBuilder: (_, index) {
  //           if (index <= stepList.length) {
  //             return DotIndicator(
  //               size: 35.0,
  //               border: Border.all(color: Colors.green, width: 1),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(6.0),
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color: Colors.green,
  //                   ),
  //                 ),
  //               ),
  //             );
  //           } else {
  //             return OutlinedDotIndicator(
  //               size: 30,
  //               borderWidth: 1.0,
  //               color: AppColors.accentColor,
  //             );
  //           }
  //         },
  //         lineWidgetBuilder: (index) {
  //           if (index > 0) {
  //             if (index == stepList.length) {
  //               final prevColor = AppColors.accentColor;
  //               final color = AppColors.blackColor;
  //               var gradientColors;
  //               gradientColors = [prevColor, Color.lerp(prevColor, color, 0.5)];
  //               return DecoratedLineConnector(
  //                 decoration: BoxDecoration(
  //                   gradient: LinearGradient(
  //                     colors: gradientColors,
  //                   ),
  //                 ),
  //               );
  //             } else {
  //               return SolidLineConnector(
  //                 color: Colors.grey,
  //               );
  //             }
  //           } else {
  //             return null;
  //           }
  //         },
  //         itemCount: stepList.length,
  //       ),
  //     ),
  //   );
  // }
}
