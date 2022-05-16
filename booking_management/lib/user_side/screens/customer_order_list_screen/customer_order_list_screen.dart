import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/customer_order_list_screen_controller/customer_order_list_screen_controller.dart';
import 'customer_order_list_screen_widgets.dart';

class CustomerOrderListScreen extends StatelessWidget {
  CustomerOrderListScreen({Key? key}) : super(key: key);
  final customerOrderListScreenController = Get.put(CustomerOrderListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => customerOrderListScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Orders",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    Expanded(child: OrderListModule()),
                  ],
                ),
              ),
      ),
    );
  }
}
