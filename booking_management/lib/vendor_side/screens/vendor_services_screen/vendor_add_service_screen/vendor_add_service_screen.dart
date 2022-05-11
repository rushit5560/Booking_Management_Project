import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_modules/constants/enums.dart';
import '../../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../../controllers/vendor_services_screen_controller/vendor_services_screen_controller.dart';
import 'vendor_add_service_screen_widgets.dart';



class VendorAddServiceScreen extends StatelessWidget {
  VendorAddServiceScreen({Key? key}) : super(key: key);
  final vendorServicesScreenController = Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          ()=> vendorServicesScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
          : Column(
            children: [
              const CommonAppBarModule(title: "Add Service", appBarOption: AppBarOption.singleBackButtonOption),
              const SizedBox(height: 10),
              Expanded(child: AddServiceFormModule()),
            ],
          ),
        ),
      ),
    );
  }
}
