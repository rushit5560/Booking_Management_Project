import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_modules/field_validation.dart';
import '../../../controllers/vendor_resources_screen_controller/vendor_resources_screen_controller.dart';

class AddServiceFormModule extends StatelessWidget {
  AddServiceFormModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: vendorResourcesScreenController.serviceAddFormKey,
      child: Column(
        children: [],
      ),
    );
  }
}

class ServiceNameFieldModule extends StatelessWidget {
  ServiceNameFieldModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Name",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: vendorResourcesScreenController.serviceNameFieldController,
          keyboardType: TextInputType.text,
          validator: (value) => FieldValidator().validateServiceName(value!),
          decoration: vendorSignUpFormFieldDecoration(hintText: 'User Name', controller: screenController),
        )
      ],
    );
  }
}

