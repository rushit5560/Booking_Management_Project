import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_logos.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_images.dart';
import '../../controllers/invoice_screen_controller/invoice_screen_controller.dart';
import '../index_screen/index_screen.dart';

class OrderInvoiceFormModule extends StatelessWidget {
  OrderInvoiceFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<InvoiceScreenController>();

  @override
  Widget build(BuildContext context) {
    String date = screenController.invoiceDetailsData.startDateTime
        .toString()
        .split('T')[0];
    // var date = screenController.invoiceDetailsData.startDateTime.toString();
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: Get.height * 0.05,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   image: NetworkImage(AppLogo.homeLogo),
                        //
                        // ),
                        ),
                    child: Image.network(
                      AppLogo.homeLogo,
                      errorBuilder: (context, st, ob) {
                        return Image.asset(AppImages.logoImg);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "issued : ",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            date,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        screenController.invoiceDetailsData.transactionDate!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Row(
              children: [
                /// Invoice From
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Invoice From",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        screenController.invoiceDetailsData.vendor!.userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.blackColor),
                      ),
                      Text(
                        screenController.invoiceDetailsData.vendor!.email,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        screenController.invoiceDetailsData.vendor!.phoneNo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),

                /// Invoice To
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Invoice To",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        // screenController.cstName.isEmpty
                        //     ? UserDetails.userName
                        //     :

                        screenController.cstName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        // screenController.cstEmail.isEmpty
                        //     ? UserDetails.email
                        //     :

                        screenController.cstEmail,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        // screenController.cstPhoneNo.isEmpty
                        //     ? UserDetails.phoneNo
                        //     :

                        screenController.cstPhoneNo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 15),
            const Divider(thickness: 1, height: 25),
            /*Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "payment Method",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Debit Card",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "XXXXXXXXXXXX-1234",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "HDFC Bank",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),*/

            // const Divider(thickness: 1, height: 25),

            /// Form Header
            Row(
              children: const [
                Expanded(
                  flex: 60,
                  child: Text(
                    "Description",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Text(
                    "Quantity",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                /*Expanded(
                  flex: 20,
                  child: Text(
                    "VAT",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),*/
                Expanded(
                  flex: 20,
                  child: Text(
                    "Total",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),

            Row(
              children: [
                Expanded(
                  flex: 60,
                  child: ListView.builder(
                    itemCount: screenController.descriptionList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Text(
                        screenController.descriptionList[i].toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Text(
                    "${screenController.invoiceDetailsData.bookingItems!.quantity}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Text(
                    "\$${(screenController.invoiceDetailsData.bookingItems!.price

                    // * screenController.invoiceDetailsData.bookingItems!.quantity
                    )}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            /*Row(
              children: [
                Expanded(flex: 40, child: Container()),
                const Expanded(
                  flex: 40,
                  child: Text(
                    "Subtotal :",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),

                const Expanded(
                  flex: 20,
                  child: Text(
                    "\$350",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),*/
            /*Row(
              children: [
                Expanded(flex: 40, child: Container()),
                const Expanded(
                  flex: 40,
                  child: Text(
                    "Discount :",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),

                const Expanded(
                  flex: 20,
                  child: Text(
                    "-10%",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),*/
            Row(
              children: [
                Expanded(flex: 40, child: Container()),
                const Expanded(
                  flex: 40,
                  child: Text(
                    "Total Amount :",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Text(
                    "\$${(screenController.invoiceDetailsData.bookingItems!.price

                    // * screenController.invoiceDetailsData.bookingItems!.quantity

                    )}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            //const Divider(thickness: 1, height: 25),
            /*Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Other information",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),

                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed dictum ligula, cursus blandit risus. Maecenas eget metus non tellus dignissim aliquam ut a ex. Maecenas sed vehicula dui, ac suscipit lacus. Sed finibus leo vitae lorem interdum, eu scelerisque tellus fermentum. Curabitur sit amet lacinia lorem. Nullam finibus pellentesque libero.",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.end,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )
              ],
            ),*/
          ],
        ).commonSymmetricPadding(horizontal: 12, vertical: 15),
      ).commonAllSidePadding(15),
    );
  }
}

class ContinueButtonModule extends StatelessWidget {
  const ContinueButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offAll(() => IndexScreen(), transition: Transition.zoom);
      },
      child: Container(
        alignment: Alignment.center,
        width: Get.width,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey.shade300,
                  blurStyle: BlurStyle.outer,
                ),
              ]),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Continue Booking',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
