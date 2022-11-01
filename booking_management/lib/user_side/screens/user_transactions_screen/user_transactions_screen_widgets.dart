import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_transaction_screen_controller/user_transaction_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserTransactionListModule extends StatelessWidget {
  UserTransactionListModule({Key? key}) : super(key: key);

  final screenController = Get.find<UserTransactionScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.transactionList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return _transactionListTile(i);
      },
    ).commonAllSidePadding(10);
  }

  Widget _transactionListTile(i) {
    String finalDate = "";

    String d = screenController.transactionList[i].orderDate;
    String d1 = d.substring(0, d.length - 17);
    // finalDate = d1;
    List<String> dateFormat = d1.split('-');
    finalDate = "${dateFormat[2]}-${dateFormat[1]}-${dateFormat[0]}";

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Booking Id : ${screenController.transactionList[i].bookingId}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Paid by : ${screenController.transactionList[i].paidBy}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  finalDate,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Text(
                "Paid",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                "\$${screenController.transactionList[i].price.toString()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ).commonAllSidePadding(10),
    ).commonAllSidePadding(10);
  }
}
