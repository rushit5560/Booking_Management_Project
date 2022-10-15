import 'dart:developer';

import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../common_modules/constants/app_colors.dart';
import '../../../../common_modules/field_decorations.dart';
import '../../../../common_modules/field_validation.dart';
import '../../../controllers/vendor_additional_slot_screen_controller/vendor_additional_slot_screen_controller.dart';

class AddAdditionalSlotFormModule extends StatelessWidget {
  AddAdditionalSlotFormModule({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController =
      Get.put(VendorAdditionalSlotScreenController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: vendorAdditionalSlotScreenController.additionalSlotAddFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              // AdditionalSlotNameFieldModule(),
              const SizedBox(height: 20),
              AdditionalSlotTimeDurationModule(),
              const SizedBox(height: 20),
              AdditionalSlotPriceFieldModule(),
              const SizedBox(height: 20),
              AdditionalSlotShortDesFieldModule(),
              const SizedBox(height: 20),
              AdditionalSlotLongDesFieldModule(),
              const SizedBox(height: 30),
              AdditionalSlotCreateButton(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ).commonAllSidePadding(10),
    );
  }
}

/// Additional Slot Name
class AdditionalSlotNameFieldModule extends StatelessWidget {
  AdditionalSlotNameFieldModule({Key? key}) : super(key: key);
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
        ).commonSymmetricPadding(horizontal: 5, vertical: 5),
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
              controller: vendorAdditionalSlotScreenController
                  .additionalNameFieldController,
              keyboardType: TextInputType.text,
              validator: (value) =>
                  FieldValidator().validateAdditionalSlotName(value!),
              decoration:
                  serviceFormFieldDecoration(hintText: 'Additional Slot Name'),
            ),
          ],
        )
      ],
    );
  }
}

/// Additional Slot Price
class AdditionalSlotPriceFieldModule extends StatelessWidget {
  AdditionalSlotPriceFieldModule({Key? key}) : super(key: key);
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
        ).commonSymmetricPadding(horizontal: 5, vertical: 5),
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
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
              ],
              controller: vendorAdditionalSlotScreenController
                  .additionalPriceFieldController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: false,
                signed: false,
              ),
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

/// Additional Slot Short Description
class AdditionalSlotShortDesFieldModule extends StatelessWidget {
  AdditionalSlotShortDesFieldModule({Key? key}) : super(key: key);
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
        ).commonSymmetricPadding(horizontal: 5, vertical: 5),
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
                  .additionalShortDescriptionFieldController,
              keyboardType: TextInputType.text,
              maxLength: 50,
              validator: (value) =>
                  FieldValidator().validateShortDescription(value!),
              decoration: serviceFormFieldDecoration(
                  hintText: 'Additional Slot Description'),
            ),
          ],
        )
      ],
    );
  }
}

/// Additional Slot Long Description
class AdditionalSlotLongDesFieldModule extends StatelessWidget {
  AdditionalSlotLongDesFieldModule({Key? key}) : super(key: key);
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
        ).commonSymmetricPadding(horizontal: 5, vertical: 5),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
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
                    .additionalLongDescriptionFieldController,
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

/// Additional Slot Time Duration
class AdditionalSlotTimeDurationModule extends StatelessWidget {
  AdditionalSlotTimeDurationModule({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController =
      Get.put(VendorAdditionalSlotScreenController());

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
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
          // flex: 5,
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
                child: Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton<double>(
                      value: vendorAdditionalSlotScreenController
                          .selectAdditionalTimeDuration.value,
                      isExpanded: true,
                      items: vendorAdditionalSlotScreenController
                          .timeDurationList
                          .map<DropdownMenuItem<double>>((double value) {
                        return DropdownMenuItem<double>(
                          value: value,
                          child: Text(
                            "$value",
                            style: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        vendorAdditionalSlotScreenController
                            .selectAdditionalTimeDuration.value = newValue!;

                        log("selectTimeDuration : ${vendorAdditionalSlotScreenController.selectAdditionalTimeDuration}");
                        // vendorServicesScreenController.loadUI();
                      },
                    ),
                  ).commonSymmetricPadding(horizontal: 12),
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

/// Additional Slot Create Button
class AdditionalSlotCreateButton extends StatelessWidget {
  AdditionalSlotCreateButton({Key? key}) : super(key: key);
  final vendorAdditionalSlotScreenController =
      Get.put(VendorAdditionalSlotScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (vendorAdditionalSlotScreenController
            .additionalSlotAddFormKey.currentState!
            .validate()) {
          await vendorAdditionalSlotScreenController
              .addVendorAdditionalSlotFunction();
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
