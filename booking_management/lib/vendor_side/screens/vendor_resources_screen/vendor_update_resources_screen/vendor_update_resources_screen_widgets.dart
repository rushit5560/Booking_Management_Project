import 'dart:developer';
import 'dart:io';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_modules/field_decorations.dart';
import 'package:booking_management/common_modules/field_validation.dart';
import 'package:booking_management/vendor_side/controllers/vendor_resources_screen_controller/vendor_resources_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



class UpdateResourceFormModule extends StatelessWidget {
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

  UpdateResourceFormModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: vendorResourcesScreenController.resourceUpdateFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ResourceProfileModule(),
            const SizedBox(height: 20),
            ResourceNameFieldModule(),
            const SizedBox(height: 20),
            ResourceDetailsModule(),
            const SizedBox(height: 20),
            ResourcePriceFieldModule(),
            const SizedBox(height: 20),
            EventCheckBoxModule(),
             const SizedBox(height: 20),
             ResourceCapacityFieldModule(),

             //ServiceShortDesFieldModule(),
            // const SizedBox(height: 20),
            // ServiceLongDesFieldModule(),
            const SizedBox(height: 30),
            ResourceUpdateButton(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    ).commonAllSidePadding(10);
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
      clipBehavior: Clip.none,
      children: [
        vendorResourcesScreenController.file != null
            ? Container(
          height: 150, width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              //border: Border.all(color: AppColors.colorLightGrey),
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    color: Colors.grey.shade500
                )
              ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.file(vendorResourcesScreenController.file!,
                height: 100, width: 100, fit: BoxFit.cover),
          ),
        )

        /*ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(vendorResourcesScreenController.file!, height: 100, width: 100, fit: BoxFit.fill))*/
            : Container(
          height: 150, width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              //border: Border.all(color: AppColors.colorLightGrey),
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    color: Colors.grey.shade500
                )
              ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(vendorResourcesScreenController.updatePhotoUrl,
                height: 100, width: 100, fit: BoxFit.cover),
          ),
        )


        /*ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(vendorResourcesScreenController.updatePhotoUrl,
                height: 100, width: 100, fit: BoxFit.fill))*/,

        GestureDetector(
          onTap: (){
            openGallery();
          },
          child: Container(
            height: 35, width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white
            ),
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
              controller: vendorResourcesScreenController.updateResourceNameFieldController,
              keyboardType: TextInputType.text,
              validator: (value) => FieldValidator().validateResourceName(value!),
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
              controller: vendorResourcesScreenController.updateResourceDetailsFieldController,
              keyboardType: TextInputType.text,
              validator: (value) => FieldValidator().validateResourceDetail(value!),
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
              controller: vendorResourcesScreenController.updateResourcePriceFieldController,
              keyboardType: TextInputType.number,
              validator: (value) => FieldValidator().validatePrice(value!),
              decoration: serviceFormFieldDecoration(hintText: 'Resource Price'),
            ),
          ],
        )
      ],
    );
  }
}

class ResourceCapacityFieldModule extends StatelessWidget {
  ResourceCapacityFieldModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Capacity",
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
              controller: vendorResourcesScreenController.updateResourceCapacityFieldController,
              keyboardType: TextInputType.number,
              readOnly: vendorResourcesScreenController.updateEvent == true ? false : true,
              // validator: (value) => FieldValidator().validatePrice(value!),
              decoration: serviceFormFieldDecoration(hintText: 'Resource Capacity'),
            ),
          ],
        )
      ],
    );
  }
}

class EventCheckBoxModule extends StatelessWidget {
   EventCheckBoxModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
              () => Checkbox(
            value: vendorResourcesScreenController.updateEvent.value,
            onChanged: (value) {
              vendorResourcesScreenController.isLoading(true);
              vendorResourcesScreenController.updateEvent.value = !vendorResourcesScreenController.updateEvent.value;
              if(vendorResourcesScreenController.updateEvent.value == false) {
                vendorResourcesScreenController.updateResourceCapacityFieldController.clear();
              }
              vendorResourcesScreenController.isLoading(false);
              // if(vendorResourcesScreenController.isSundayOn.value == false) {
              //   vendorResourcesScreenController.sundayStartTime.value = "00:00";
              //   vendorResourcesScreenController.sundayEndTime.value = "00:00";
              // }
              // log("${screenController.isSundayOn.value}");
            },
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          "Event",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}


class ResourceUpdateButton extends StatelessWidget {
  ResourceUpdateButton({Key? key}) : super(key: key);
  final vendorResourcesScreenController = Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(vendorResourcesScreenController.resourceUpdateFormKey.currentState!.validate()) {
          await vendorResourcesScreenController.updateVendorResourceFunction();
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
