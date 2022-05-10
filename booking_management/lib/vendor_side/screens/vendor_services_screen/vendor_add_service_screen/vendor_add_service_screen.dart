import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_modules/constants/enums.dart';
import '../../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../../controllers/vendor_resources_screen_controller/vendor_resources_screen_controller.dart';
import 'vendor_add_service_screen_widgets.dart';



class VendorAddServiceScreen extends StatelessWidget {
  VendorAddServiceScreen({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: "Resources", appBarOption: AppBarOption.singleBackButtonOption),
            const SizedBox(height: 10),
            Expanded(
              child: AddServiceFormModule(),
            ),
          ],
        ),
      ),
    );
  }
}
