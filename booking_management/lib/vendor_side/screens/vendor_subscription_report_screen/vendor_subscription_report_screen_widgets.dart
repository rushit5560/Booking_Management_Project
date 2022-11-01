import 'dart:developer';

import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/vendor_subscription_report_screen_controller/vendor_subscription_report_screen_controller.dart';
import 'package:booking_management/vendor_side/model/vendor_subscription_report_screen_model/vendor_subscription_report_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionReportListModule extends StatelessWidget {
  SubscriptionReportListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSubscriptionReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.subscriptionReportList.isEmpty
        ? const Center(child: Text("No data available!"))
        : ListView.builder(
            itemCount: screenController.subscriptionReportList.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) {
              SubscriptionData singleItem =
                  screenController.subscriptionReportList[i];
              return _subscriptionListTile(singleItem);
            },
          ).commonAllSidePadding(10);
  }

  Widget _subscriptionListTile(SubscriptionData singleItem) {
    DateTime date = DateTime.parse(singleItem.transactionDate);
    log("Day : ${date.day}");
    log("Month : ${date.month}");
    log("Year : ${date.year}");

    return Container(
      margin: const EdgeInsets.only(bottom: 17, left: 5, right: 5, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                "Transaction For : ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  singleItem.transactionFor,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Text(
                "Transaction By :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  UserDetails.userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Text(
                "Transaction Date :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  "${date.day}-${date.month}-${date.year}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Text(
                "Price :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  singleItem.subscriptionUser.price,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 5),
          // Row(
          //   children: [
          //     const Text(
          //       "Payment Intent Id :",
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //     const SizedBox(width: 5),
          //     Expanded(
          //       child: Text(
          //         singleItem.paymentIntentId,
          //         maxLines: 1,
          //         overflow: TextOverflow.ellipsis,
          //         // style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 5),
          // Row(
          //   children: [
          //     const Text(
          //       "Transaction Code :",
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //     const SizedBox(width: 5),
          //     Expanded(
          //       child: Text(
          //         singleItem.transactionCode,
          //         maxLines: 1,
          //         overflow: TextOverflow.ellipsis,
          //         // style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ).commonAllSidePadding(10),
    );
  }
}
