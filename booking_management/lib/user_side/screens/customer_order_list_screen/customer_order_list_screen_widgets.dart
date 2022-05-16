import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/customer_order_list_screen_controller/customer_order_list_screen_controller.dart';


class OrderListModule extends StatelessWidget {
  OrderListModule({Key? key}) : super(key: key);
  final screenController = Get.find<CustomerOrderListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5/*screenController.allOrderList.length*/,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return _orderListModule();
      },
    );
  }

  Widget _orderListModule() {
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
              children: const [
                Text(
                  "Date : 2022-05-05",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text(
                  "Paid By : 1234567890123456",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ),
          const Text(
            "\$300",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ).commonAllSidePadding(8),
    ).commonAllSidePadding(10);
  }

}
