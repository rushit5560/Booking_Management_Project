import 'dart:developer';

import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_modules/constants/app_colors.dart';
import '../../../../common_modules/field_decorations.dart';
import '../../../../common_modules/field_validation.dart';
import '../../../controllers/vendor_additional_slot_screen_controller/vendor_additional_slot_screen_controller.dart';

class UpdateAdditionalFormModule extends StatelessWidget {
  UpdateAdditionalFormModule({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController =
      Get.put(VendorAdditionalSlotScreenController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: vendorAdditionalSlotScreenController.additionalSlotUpdateFormKey,
        child: Column(
          children: [
            // UpdateAdditionalSlotNameFieldModule(),
            const SizedBox(height: 20),
            UpdateAdditionalSlotTimeDurationModule(),
            const SizedBox(height: 20),
            UpdateAdditionalSlotPriceFieldModule(),
            const SizedBox(height: 20),
            UpdateAdditionalSlotShortDesFieldModule(),
            const SizedBox(height: 20),
            UpdateAdditionalSlotLongDesFieldModule(),
            const SizedBox(height: 45),

            UpdateAdditionalSlotButton(),
            const SizedBox(height: 10),
          ],
        ),
      ).commonSymmetricPadding(vertical: 20, horizontal: 15),
    );
  }
}

/// Update Name
class UpdateAdditionalSlotNameFieldModule extends StatelessWidget {
  UpdateAdditionalSlotNameFieldModule({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController =
      Get.put(VendorAdditionalSlotScreenController());

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
              controller: vendorAdditionalSlotScreenController
                  .updateAdditionalNameFieldController,
              keyboardType: TextInputType.text,
              validator: (value) =>
                  FieldValidator().validateServiceName(value!),
              decoration:
                  serviceFormFieldDecoration(hintText: 'Additional Slot Name'),
            ),
          ],
        )
      ],
    );
  }
}

/// Update Price
class UpdateAdditionalSlotPriceFieldModule extends StatelessWidget {
  UpdateAdditionalSlotPriceFieldModule({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController =
      Get.put(VendorAdditionalSlotScreenController());

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
              controller: vendorAdditionalSlotScreenController
                  .updateAdditionalPriceFieldController,
              keyboardType: TextInputType.number,
              validator: (value) => FieldValidator().validatePrice(value!),
              decoration:
                  serviceFormFieldDecoration(hintText: 'Additional Slot Price'),
            ),
          ],
        )
      ],
    );
  }
}

/// Update Short Description
class UpdateAdditionalSlotShortDesFieldModule extends StatelessWidget {
  UpdateAdditionalSlotShortDesFieldModule({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController =
      Get.put(VendorAdditionalSlotScreenController());

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
              controller: vendorAdditionalSlotScreenController
                  .updateAdditionalShortDescriptionFieldController,
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
class UpdateAdditionalSlotLongDesFieldModule extends StatelessWidget {
  UpdateAdditionalSlotLongDesFieldModule({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController =
      Get.put(VendorAdditionalSlotScreenController());

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
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              // height: 46,
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                controller: vendorAdditionalSlotScreenController
                    .updateAdditionalLongDescriptionFieldController,
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
class UpdateAdditionalSlotTimeDurationModule extends StatelessWidget {
  UpdateAdditionalSlotTimeDurationModule({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController =
      Get.put(VendorAdditionalSlotScreenController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Time Duration",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
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
                child: Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton<double>(
                      value: vendorAdditionalSlotScreenController
                          .updateAdditionalTimeDuration.value,
                      items: vendorAdditionalSlotScreenController
                          .timeDurationList
                          .map<DropdownMenuItem<double>>((double value) {
                        return DropdownMenuItem<double>(
                          value: value,
                          child: Text(
                            "$value",
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        vendorAdditionalSlotScreenController
                            .updateAdditionalTimeDuration.value = newValue!;
                        log("selectTimeDuration : ${vendorAdditionalSlotScreenController.updateAdditionalTimeDuration}");
                        // vendorServicesScreenController.loadUI();
                      },
                    ),
                  ).commonSymmetricPadding(horizontal: 5),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          "In Hour",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/// Update Button
class UpdateAdditionalSlotButton extends StatelessWidget {
  UpdateAdditionalSlotButton({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController =
      Get.put(VendorAdditionalSlotScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (vendorAdditionalSlotScreenController
            .additionalSlotUpdateFormKey.currentState!
            .validate()) {
          await vendorAdditionalSlotScreenController
              .updateVendorAdditionalSlotFunction();
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
