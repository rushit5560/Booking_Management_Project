import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_modules/field_decorations.dart';
import 'package:booking_management/common_modules/field_validation.dart';
import 'package:booking_management/vendor_side/controllers/vendor_resources_screen_controller/vendor_resources_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddResourceFormModule extends StatelessWidget {
  AddResourceFormModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: vendorResourcesScreenController.resourceAddFormKey,
        child: Column(
          children: [
            ResourceProfileModule(),
            const SizedBox(height: 20),
            ResourceNameFieldModule(),
            const SizedBox(height: 20),
             ResourceDetailsModule(),
            const SizedBox(height: 20),
            ResourcePriceFieldModule(),
            // const SizedBox(height: 20),
            // ServiceShortDesFieldModule(),
            // const SizedBox(height: 20),
            // ServiceLongDesFieldModule(),
             const SizedBox(height: 30),
            ResourceCreateButton(),
            const SizedBox(height: 10),
          ],
        ),
      ).commonAllSidePadding(10),
    );
  }
}

class ResourceProfileModule extends StatelessWidget {
  ResourceProfileModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      //clipBehavior: Clip.none,
      children: [
        vendorResourcesScreenController.file != null ?
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(vendorResourcesScreenController.file!, height: 100, width: 100, fit: BoxFit.fill)) :
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(AppImages.profileImg, height: 100, width: 100, fit: BoxFit.fill)),

        GestureDetector(
          onTap: (){
            openGallery();
          },
          child: Positioned(
            //bottom: 15,
            //top: 15,
            child: Container(
              height: 35, width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white
              ),
              child: const Icon(Icons.edit),
            ),
          ),
        ),
      ],
    );
  }

  void openGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      //setState(() {
      vendorResourcesScreenController.file = File(image.path);
      vendorResourcesScreenController.loadUI();
      log('Camera File Path : ${vendorResourcesScreenController.file}');
      log('Camera Image Path : ${image.path}');
      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {}
  }
}


class ResourceNameFieldModule extends StatelessWidget {
  ResourceNameFieldModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

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
              controller: vendorResourcesScreenController.resourceNameFieldController,
              keyboardType: TextInputType.text,
              validator: (value) => FieldValidator().validateServiceName(value!),
              decoration: serviceFormFieldDecoration(hintText: 'Resource Name'),
            ),
          ],
        )
      ],
    );
  }
}

class ResourceDetailsModule extends StatelessWidget {
  ResourceDetailsModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Details",
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
              controller: vendorResourcesScreenController.resourceDetailsFieldController,
              keyboardType: TextInputType.number,
              validator: (value) => FieldValidator().validatePrice(value!),
              decoration: serviceFormFieldDecoration(hintText: 'Resource Details'),
            ),
          ],
        )
      ],
    );
  }
}

class ResourcePriceFieldModule extends StatelessWidget {
  ResourcePriceFieldModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

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
              controller: vendorResourcesScreenController.resourcePriceFieldController,
              keyboardType: TextInputType.text,
              validator: (value) => FieldValidator().validateShortDescription(value!),
              decoration: serviceFormFieldDecoration(hintText: 'Resource Price'),
            ),
          ],
        )
      ],
    );
  }
}

/*class ServiceLongDesFieldModule extends StatelessWidget {
  ServiceLongDesFieldModule({Key? key}) : super(key: key);
  final vendorServicesScreenController = Get.find<VendorServicesScreenController>();

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
              controller: vendorServicesScreenController.serviceLongDesFieldController,
              keyboardType: TextInputType.text,
              validator: (value) => FieldValidator().validateLongDescription(value!),
              decoration: serviceFormFieldDecoration(hintText: 'Long Description'),
            ),
          ],
        )
      ],
    );
  }
}*/

/*class ServiceTimeDurationModule extends StatelessWidget {
  ServiceTimeDurationModule({Key? key}) : super(key: key);
  final vendorServicesScreenController = Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
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
                    ()=> DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: vendorServicesScreenController.selectTimeDuration.value,
                    items:vendorServicesScreenController.timeDurationList
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text("$value Minutes",style: const TextStyle(color:Colors.black),),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      vendorServicesScreenController.selectTimeDuration.value = newValue!;
                      log("selectTimeDuration : ${vendorServicesScreenController.selectTimeDuration}");
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
}*/


class ResourceCreateButton extends StatelessWidget {
  ResourceCreateButton({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(vendorResourcesScreenController.resourceAddFormKey.currentState!.validate()) {
          await vendorResourcesScreenController.addVendorResourcesFunction();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 3,
                blurRadius: 5,
                color: Colors.grey.shade300,
                blurStyle: BlurStyle.outer,
              ),
            ]
        ),
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
