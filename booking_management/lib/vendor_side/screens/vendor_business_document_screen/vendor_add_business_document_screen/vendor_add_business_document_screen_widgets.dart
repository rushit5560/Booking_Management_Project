import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common_modules/constants/app_colors.dart';
import '../../../../common_modules/constants/app_images.dart';
import '../../../controllers/vendor_business_document_screen_controller/vendor_business_document_screen_controller.dart';

class AddBusinessDocumentFormModule extends StatelessWidget {
  AddBusinessDocumentFormModule({Key? key}) : super(key: key);
  final vendorBusinessDocumentScreenController =
      Get.find<VendorBusinessDocumentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        BusinessDocumentImageModule(),
        const SizedBox(height: 25),
        DocTypeDropDownModule(),
        const SizedBox(height: 25),
        AddBusinessDocButtonModule(),
        const SizedBox(height: 15),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }
}

/// Add Image Button
class BusinessDocumentImageModule extends StatelessWidget {
  BusinessDocumentImageModule({Key? key}) : super(key: key);
  final vendorBusinessDocumentScreenController =
      Get.find<VendorBusinessDocumentScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      //clipBehavior: Clip.none,
      children: [
        vendorBusinessDocumentScreenController.file != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(vendorBusinessDocumentScreenController.file!,
                    height: 100, width: 100, fit: BoxFit.fill))
            : ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SvgPicture.asset(AppImages.businessDocSvgLogo,
                    height: 100, width: 100, fit: BoxFit.contain),

                // Image.asset(AppImages.businessDocSvgLogo,
                //     height: 100, width: 100, fit: BoxFit.contain)
              ),
        GestureDetector(
          onTap: () => openGallery(),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: const Icon(Icons.edit),
          ),
        ),
      ],
    );
  }

  void openGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      //setState(() {
      vendorBusinessDocumentScreenController.file = File(image.path);
      vendorBusinessDocumentScreenController.loadUI();
      log('Camera File Path : ${vendorBusinessDocumentScreenController.file}');
      log('Camera Image Path : ${image.path}');
      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {}
  }
}

/// Set DD Value
class DocTypeDropDownModule extends StatelessWidget {
  DocTypeDropDownModule({Key? key}) : super(key: key);
  final vendorBusinessDocumentScreenController =
      Get.find<VendorBusinessDocumentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: vendorBusinessDocumentScreenController
                .selectedDocTypeValue.value,
            items: vendorBusinessDocumentScreenController.docTypeList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              vendorBusinessDocumentScreenController
                  .selectedDocTypeValue.value = newValue!;
              log("selectTimeDuration : ${vendorBusinessDocumentScreenController.selectedDocTypeValue}");
              // vendorServicesScreenController.loadUI();
            },
          ),
        ).commonSymmetricPadding(horizontal: 15),
      ),
    );
  }
}

/// Add Doc Button
class AddBusinessDocButtonModule extends StatelessWidget {
  AddBusinessDocButtonModule({Key? key}) : super(key: key);
  final vendorBusinessDocumentScreenController =
      Get.find<VendorBusinessDocumentScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (vendorBusinessDocumentScreenController.file == null) {
          Fluttertoast.showToast(msg: "Please select document image!");
        } else {
          await vendorBusinessDocumentScreenController
              .addBusinessDocumentFunction();
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
            'Upload',
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
