import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_colors.dart';
import '../../controllers/vendor_invoice_list_screen_controller/vendor_invoice_list_screen_controller.dart';
import '../../model/vendor_invoice_list_screen_models/get_all_invoice_model.dart';
import 'vendor_order_details_screen/vendor_invoice_details_screen.dart';

class OrderListModule extends StatelessWidget {
  OrderListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorInvoiceListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.allInvoiceList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        OrdersDatum singleItem = screenController.allInvoiceList[i];
        return _orderListTile(singleItem);
      },
    );
  }

  Widget _orderListTile(OrdersDatum singleItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.colorLightGrey1),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  singleItem.applicationUsercustomer.userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 3),
                Text(
                  "Date : ${singleItem.transactionDate}",
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 3),
                Text(
                  singleItem.transactionStatus,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                  await screenController.getOrderDetailsByIdFunction(id: singleItem.id);
                  Get.to(
                    () => VendorInvoiceDetailsScreen(),
                    transition: Transition.zoom,
                  );
                },
                child: Text(
                  "View",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.grey.shade700,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Print",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.grey.shade700,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ],
      ).commonAllSidePadding(20),
    );
  }
}
