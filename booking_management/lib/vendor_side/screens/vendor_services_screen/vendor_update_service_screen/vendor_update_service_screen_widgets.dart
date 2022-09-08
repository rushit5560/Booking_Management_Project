import 'dart:developer';

import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_modules/constants/app_colors.dart';
import '../../../../common_modules/field_decorations.dart';
import '../../../../common_modules/field_validation.dart';
import '../../../controllers/vendor_services_screen_controller/vendor_services_screen_controller.dart';

class VendorUpdateServiceFormModule extends StatelessWidget {
  VendorUpdateServiceFormModule({Key? key}) : super(key: key);
  final vendorServicesScreenController =
      Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: vendorServicesScreenController.serviceUpdateFormKey,
        child: Column(
          children: [
            UpdateServiceNameFieldModule(),
            const SizedBox(height: 20),
            UpdateServiceTimeDurationModule(),
            const SizedBox(height: 20),
            UpdateServicePriceFieldModule(),
            const SizedBox(height: 20),
            UpdateServiceShortDesFieldModule(),
            const SizedBox(height: 20),
            UpdateServiceLongDesFieldModule(),
            const SizedBox(height: 30),
            UpdateServiceButton(),
            const SizedBox(height: 10),
          ],
        ),
      ).commonAllSidePadding(10),
    );
  }
}

/// Update Name
class UpdateServiceNameFieldModule extends StatelessWidget {
  UpdateServiceNameFieldModule({Key? key}) : super(key: key);
  final vendorServicesScreenController =
      Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Name",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).commonSymmetricPadding(horizontal: 5),
        const SizedBox(height: 5),
        Stack(
          children: [
            Container(
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: vendorServicesScreenController
                  .updateServiceNameFieldController,
              keyboardType: TextInputType.text,
              validator: (value) =>
                  FieldValidator().validateServiceName(value!),
              decoration: serviceFormFieldDecoration(hintText: 'Service Name'),
            ),
          ],
        )
      ],
    );
  }
}

/// Update Price
class UpdateServicePriceFieldModule extends StatelessWidget {
  UpdateServicePriceFieldModule({Key? key}) : super(key: key);
  final vendorServicesScreenController =
      Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Price",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).commonSymmetricPadding(horizontal: 5),
        const SizedBox(height: 5),
        Stack(
          children: [
            Container(
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 5,
                    //spreadRadius: 5,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: vendorServicesScreenController
                  .updateServicePriceFieldController,
              keyboardType: TextInputType.number,
              validator: (value) => FieldValidator().validatePrice(value!),
              decoration: serviceFormFieldDecoration(hintText: 'Service Price'),
            ),
          ],
        )
      ],
    );
  }
}

/// Update Short Description
class UpdateServiceShortDesFieldModule extends StatelessWidget {
  UpdateServiceShortDesFieldModule({Key? key}) : super(key: key);
  final vendorServicesScreenController =
      Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Short Description",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).commonSymmetricPadding(horizontal: 5),
        const SizedBox(height: 5),
        Stack(
          children: [
            Container(
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: vendorServicesScreenController
                  .updateServiceShortDesFieldController,
              keyboardType: TextInputType.text,
              validator: (value) =>
                  FieldValidator().validateShortDescription(value!),
              decoration:
                  serviceFormFieldDecoration(hintText: 'Short Description'),
            ),
          ],
        )
      ],
    );
  }
}

/// Update Long Description
class UpdateServiceLongDesFieldModule extends StatelessWidget {
  UpdateServiceLongDesFieldModule({Key? key}) : super(key: key);
  final vendorServicesScreenController =
      Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Long Description",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).commonSymmetricPadding(horizontal: 5),
        const SizedBox(height: 5),
        Stack(
          children: [
            Container(
              // height: 46,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: TextFormField(
                maxLines: null,
                controller: vendorServicesScreenController
                    .updateServiceLongDesFieldController,
                keyboardType: TextInputType.multiline,
                validator: (value) =>
                    FieldValidator().validateLongDescription(value!),
                decoration:
                    serviceFormFieldDecoration(hintText: 'Long Description'),
              ),
            ),
          ],
        )
      ],
    );
  }
}

/// Service Time Duration
class UpdateServiceTimeDurationModule extends StatelessWidget {
  UpdateServiceTimeDurationModule({Key? key}) : super(key: key);
  final vendorServicesScreenController =
      Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Time Duration",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 46,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.colorLightGrey,
                      blurRadius: 5,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
              ),
              Obx(
                () => DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value:
                        vendorServicesScreenController.updateTimeDuration.value,
                    items: vendorServicesScreenController.timeDurationList
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(
                          value == 1 ? "$value Hour" : "$value Minutes",
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      vendorServicesScreenController.updateTimeDuration.value =
                          newValue!;
                      log("selectTimeDuration : ${vendorServicesScreenController.updateTimeDuration}");
                      // vendorServicesScreenController.loadUI();
                    },
                  ),
                ).commonSymmetricPadding(horizontal: 5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Update Button
class UpdateServiceButton extends StatelessWidget {
  UpdateServiceButton({Key? key}) : super(key: key);
  final vendorServicesScreenController =
      Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (vendorServicesScreenController.serviceUpdateFormKey.currentState!
            .validate()) {
          await vendorServicesScreenController.updateVendorServiceFunction();
        }
      },
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ]),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Text(
            'Update',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
