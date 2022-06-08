import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../controllers/customer_report_screen_controller/customer_report_screen_controller.dart';
import 'customer_report_screen_widgets.dart';

class CustomerReportScreen extends StatelessWidget {
  CustomerReportScreen({Key? key}) : super(key: key);
  final customerReportScreenController = Get.put(CustomerReportScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> customerReportScreenController.isLoading.value
        ? const CustomCircularLoaderModule()
        : SafeArea(
          child: Column(
            children: [
              const CommonAppBarModule(
                title: "Customer Report",
                appBarOption: AppBarOption.singleBackButtonOption,
              ),
              StatusDropDownModule(),

              const SizedBox(height: 15),

              Expanded(child: CustomerReportListModule()),
            ],
          ),
        ),
      ),
    );
  }
}
