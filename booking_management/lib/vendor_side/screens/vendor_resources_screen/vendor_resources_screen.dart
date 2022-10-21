import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/vendor_resources_screen_controller/vendor_add_resources_screen_controller.dart';
import '../../controllers/vendor_resources_screen_controller/vendor_resources_screen_controller.dart';
import 'vendor_resources_screen_widgets.dart';

class VendorResourcesScreen extends StatelessWidget {
  VendorResourcesScreen({Key? key}) : super(key: key);
  final vendorResourcesScreenController =
      Get.put(VendorResourcesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(
                title: "Resources",
                appBarOption: AppBarOption.singleBackButtonOption),
            Expanded(
                child: Obx(
              () => vendorResourcesScreenController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        const AddResourcesButton(),
                        const SizedBox(height: 15),
                        Expanded(child: VendorResourcesListModule()),
                      ],
                    ).commonSymmetricPadding(horizontal: 15, vertical: 15),
            )),
          ],
        ),
      ),
    );
  }
}
