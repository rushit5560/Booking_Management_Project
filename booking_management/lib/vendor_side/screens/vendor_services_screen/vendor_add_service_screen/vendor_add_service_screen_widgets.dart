import 'dart:developer';

import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../common_modules/constants/app_colors.dart';
import '../../../../common_modules/field_decorations.dart';
import '../../../../common_modules/field_validation.dart';
import '../../../controllers/vendor_services_screen_controller/vendor_services_screen_controller.dart';

class AddServiceFormModule extends StatelessWidget {
  AddServiceFormModule({Key? key}) : super(key: key);
  final vendorServicesScreenController =
      Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: vendorServicesScreenController.serviceAddFormKey,
        child: Column(
          children: [
            ServiceNameFieldModule(),
            const SizedBox(height: 20),
            ServiceTimeDurationModule(),
            const SizedBox(height: 20),
            ServicePriceFieldModule(),
            const SizedBox(height: 20),
            ServiceShortDesFieldModule(),
            const SizedBox(height: 20),
            ServiceLongDesFieldModule(),
            const SizedBox(height: 30),
            ServiceCreateButton(),
            const SizedBox(height: 10),
          ],
        ),
      ).commonAllSidePadding(10),
    );
  }
}

/// Service Name
class ServiceNameFieldModule extends StatelessWidget {
  ServiceNameFieldModule({Key? key}) : super(key: key);
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
                //color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                //border: Border.all(color: AppColors.colorLightGrey),
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
              controller:
                  vendorServicesScreenController.serviceNameFieldController,
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

/// Service Price
class ServicePriceFieldModule extends StatelessWidget {
  ServicePriceFieldModule({Key? key}) : super(key: key);
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
                //color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                //border: Border.all(color: AppColors.colorLightGrey),
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
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
              ],
              controller:
                  vendorServicesScreenController.servicePriceFieldController,
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

/// Service Short Description
class ServiceShortDesFieldModule extends StatelessWidget {
  ServiceShortDesFieldModule({Key? key}) : super(key: key);
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
                //color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                //border: Border.all(color: AppColors.colorLightGrey),
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
              controller:
                  vendorServicesScreenController.serviceShortDesFieldController,
              keyboardType: TextInputType.text,
              maxLength: 50,
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

/// Service Long Description
class ServiceLongDesFieldModule extends StatelessWidget {
  ServiceLongDesFieldModule({Key? key}) : super(key: key);
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
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                //border: Border.all(color: AppColors.colorLightGrey),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 5,
                    //spreadRadius: 5,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: TextFormField(
                maxLines: null,
                controller: vendorServicesScreenController
                    .serviceLongDesFieldController,
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
class ServiceTimeDurationModule extends StatelessWidget {
  ServiceTimeDurationModule({Key? key}) : super(key: key);
  final vendorServicesScreenController =
      Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Time Duration",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 46,
                width: Get.width,
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  //border: Border.all(color: AppColors.colorLightGrey),
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
              Obx(
                () => DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    isExpanded: true,
                    value:
                        vendorServicesScreenController.selectTimeDuration.value,
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
                      vendorServicesScreenController.selectTimeDuration.value =
                          newValue!;
                      log("selectTimeDuration : ${vendorServicesScreenController.selectTimeDuration}");
                      // vendorServicesScreenController.loadUI();
                    },
                  ),
                ).commonSymmetricPadding(horizontal: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Service Create Button
class ServiceCreateButton extends StatelessWidget {
  ServiceCreateButton({Key? key}) : super(key: key);
  final vendorServicesScreenController =
      Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (vendorServicesScreenController.serviceAddFormKey.currentState!
            .validate()) {
          await vendorServicesScreenController.addVendorServiceFunction();
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
            'Create',
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
