import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/app_logos.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/vendor_invoice_details_screen_controller/vendor_invoice_details_screen_controller.dart';
import 'package:booking_management/vendor_side/controllers/vendor_invoice_list_screen_controller/vendor_invoice_list_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailFormModule extends StatelessWidget {
  OrderDetailFormModule({Key? key}) : super(key: key);
  final vendorInvoiceDetailsScreenController =
      Get.find<VendorInvoiceDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    var d = vendorInvoiceDetailsScreenController.bookedDate;
    var date = d.split("T")[0];
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
                    height: Get.height * 0.06,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(AppLogo.homeLogo),
                        // scale: ,
                      ),
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
                      // const SizedBox(height: 5),
                      // Text(
                      //   vendorInvoiceDetailsScreenController.orderDetailsData!.transactionDate,
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      //   style: const TextStyle(
                      //     fontSize: 13,
                      //   ),
                      // ),
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
                      const SizedBox(height: 10),
                      Text(
                        vendorInvoiceDetailsScreenController.customerUserName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        vendorInvoiceDetailsScreenController.customerEmail,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        vendorInvoiceDetailsScreenController
                            .customerPhoneNumber,
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
                      const SizedBox(height: 10),
                      Text(
                        vendorInvoiceDetailsScreenController.vendorUserName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        vendorInvoiceDetailsScreenController.vendorEmail,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        vendorInvoiceDetailsScreenController.vendorPhoneNumber,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 15),
            const Divider(thickness: 1, height: 30),
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
            ),

            const Divider(thickness: 1, height: 25),*/

            Row(
              children: const [
                Expanded(
                  flex: 40,
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
                // Expanded(
                //   flex: 20,
                //   child: Text(
                //     "VAT",
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),
                //   ),
                // ),
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
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  flex: 60,
                  child: ListView.builder(
                    itemCount: vendorInvoiceDetailsScreenController
                        .descriptionList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Text(
                        vendorInvoiceDetailsScreenController.descriptionList[i]
                            .toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Text(
                    "${vendorInvoiceDetailsScreenController.orderList.bookingItems!.quantity}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Text(
                    "\$${vendorInvoiceDetailsScreenController.orderList.bookingItems!.price}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   children: const [
            //     Expanded(
            //       flex: 40,
            //       child: Text(
            //         "Video Call Booking",
            //         maxLines: 2,
            //         overflow: TextOverflow.ellipsis,
            //         style: TextStyle(
            //           // fontWeight: FontWeight.bold,
            //           fontSize: 13,
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       flex: 20,
            //       child: Text(
            //         "1",
            //         maxLines: 1,
            //         overflow: TextOverflow.ellipsis,
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           // fontWeight: FontWeight.bold,
            //           fontSize: 13,
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       flex: 20,
            //       child: Text(
            //         "\$0",
            //         maxLines: 1,
            //         overflow: TextOverflow.ellipsis,
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           // fontWeight: FontWeight.bold,
            //           fontSize: 13,
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       flex: 20,
            //       child: Text(
            //         "\$250",
            //         maxLines: 1,
            //         overflow: TextOverflow.ellipsis,
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           // fontWeight: FontWeight.bold,
            //           fontSize: 13,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            const SizedBox(height: 25),

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
            ),
            Row(
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
                    "\$${vendorInvoiceDetailsScreenController.orderList.bookingItems!.price}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            /*const Divider(thickness: 1, height: 25),
            Column(
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
        ).commonAllSidePadding(8),
      ).commonAllSidePadding(10),
    );
  }
}
