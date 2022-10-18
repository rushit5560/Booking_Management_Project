import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_modules/field_decorations.dart';
import 'package:booking_management/common_modules/field_validation.dart';
import 'package:booking_management/vendor_side/controllers/vendor_resources_screen_controller/vendor_resources_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddResourceFormModule extends StatelessWidget {
  AddResourceFormModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    log('vendorResourcesScreenController.isEvent.value: ${vendorResourcesScreenController.isEvent.value}');
    return SingleChildScrollView(
      child: Form(
        key: vendorResourcesScreenController.resourceAddFormKey,
        child: Obx(
          () => Column(
            children: [
              ResourceProfileModule(),
              const SizedBox(height: 20),
              ResourceNameFieldModule(),
              const SizedBox(height: 20),
              ResourceDetailsModule(),
              const SizedBox(height: 20),
              ResourcePriceFieldModule(),
              const SizedBox(height: 10),
              IsEventCheckBoxModule(),
              const SizedBox(height: 10),

              ResourceCapacityFieldModule(),
              const SizedBox(height: 10),
              IsAdditionalCriteriaModule(),
              const SizedBox(height: 10),
              vendorResourcesScreenController.isAdditionalCriteria.value
                  ? CriteriaManageUpdateModule()
                  : const SizedBox(),

              // ServiceShortDesFieldModule(),
              // const SizedBox(height: 20),
              // ServiceLongDesFieldModule(),
              const SizedBox(height: 30),
              ResourceCreateButton(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ).commonAllSidePadding(10),
    );
  }
}

class ResourceProfileModule extends StatelessWidget {
  ResourceProfileModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        vendorResourcesScreenController.addFile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(vendorResourcesScreenController.addFile!,
                    height: 100, width: 100, fit: BoxFit.fill))
            : ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SvgPicture.asset(AppImages.resourceScheduleSvgLogo,
                    height: 100, width: 100, fit: BoxFit.fill),

                //  Image.asset(AppImages.profileImg,
                //     height: 100, width: 100, fit: BoxFit.fill)
              ),
        GestureDetector(
          onTap: () {
            openGallery();
          },
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
      vendorResourcesScreenController.addFile = File(image.path);
      vendorResourcesScreenController.loadUI();
      log('Camera File Path : ${vendorResourcesScreenController.addFile}');
      log('Camera Image Path : ${image.path}');
      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {}
  }
}

class ResourceNameFieldModule extends StatelessWidget {
  ResourceNameFieldModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();

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
                  vendorResourcesScreenController.resourceNameFieldController,
              keyboardType: TextInputType.text,
              validator: (value) =>
                  FieldValidator().validateResourceName(value!),
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
  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();

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
              controller: vendorResourcesScreenController
                  .resourceDetailsFieldController,
              keyboardType: TextInputType.text,
              validator: (value) =>
                  FieldValidator().validateResourceDetail(value!),
              decoration:
                  serviceFormFieldDecoration(hintText: 'Resource Details'),
            ),
          ],
        )
      ],
    );
  }
}

class ResourcePriceFieldModule extends StatelessWidget {
  ResourcePriceFieldModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();

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
              controller:
                  vendorResourcesScreenController.resourcePriceFieldController,
              keyboardType: TextInputType.number,
              validator: (value) => FieldValidator().validatePrice(value!),
              decoration:
                  serviceFormFieldDecoration(hintText: 'Resource Price'),
            ),
          ],
        )
      ],
    );
  }
}

class ResourceCapacityFieldModule extends StatelessWidget {
  ResourceCapacityFieldModule({Key? key}) : super(key: key);

  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();

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
            Obx(
              () => TextFormField(
                readOnly: !vendorResourcesScreenController.isEvent.value,
                controller: vendorResourcesScreenController
                    .resourceCapacityFieldController,
                keyboardType: TextInputType.number,
                // validator: (value) => FieldValidator().validateCapacity(value!),
                decoration:
                    serviceFormFieldDecoration(hintText: 'Resource Capacity'),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class IsEventCheckBoxModule extends StatelessWidget {
  IsEventCheckBoxModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            fillColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.accentColor),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            value: vendorResourcesScreenController.isEvent.value,
            onChanged: (value) {
              vendorResourcesScreenController.isEvent.value =
                  !vendorResourcesScreenController.isEvent.value;

              if (vendorResourcesScreenController.isEvent.value == false) {
                vendorResourcesScreenController.resourceCapacityFieldController
                    .clear();
              }
            },
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          "Enable multiple bookings with set capacity ",
          maxLines: 2,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class IsAdditionalCriteriaModule extends StatelessWidget {
  IsAdditionalCriteriaModule({Key? key}) : super(key: key);
  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            fillColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.accentColor),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            value: vendorResourcesScreenController.isAdditionalCriteria.value,
            onChanged: (value) {
              vendorResourcesScreenController.isAdditionalCriteria.value =
                  !vendorResourcesScreenController.isAdditionalCriteria.value;

              if (vendorResourcesScreenController.isAdditionalCriteria.value ==
                  false) {
                vendorResourcesScreenController.resourceCapacityFieldController
                    .clear();
              }
            },
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          "Require additional criteria",
          maxLines: 2,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class CriteriaManageUpdateModule extends StatefulWidget {
  CriteriaManageUpdateModule({Key? key}) : super(key: key);

  @override
  State<CriteriaManageUpdateModule> createState() =>
      _CriteriaManageUpdateModuleState();
}

class _CriteriaManageUpdateModuleState
    extends State<CriteriaManageUpdateModule> {
  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Obx(
        //   () =>
        Container(
          height: 40,
          width: 150,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.accentColor,
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              setState(() {});

              vendorResourcesScreenController.criteriaList
                  .add(CriteriaFormWidget());
            },
            child: const Center(
              child: Text(
                "Add Criteria",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        // ),
        // Obx(
        //   () =>
        vendorResourcesScreenController.criteriaList.isEmpty
            ? SizedBox()
            : ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                itemCount: vendorResourcesScreenController.criteriaList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CriteriaFormWidget(
                    index: index,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 25,
                    color: AppColors.colorGreyIconLight,
                    thickness: 0.6,
                  );
                },
              ),

        // ),
        // addCriteriaFormWidget(inputBorder),
      ],
    );
  }
}

class CriteriaFormWidget extends StatefulWidget {
  CriteriaFormWidget({
    Key? key,
    this.index,
  }) : super(key: key);

  final int? index;

  @override
  State<CriteriaFormWidget> createState() => _CriteriaFormWidgetState();
}

class _CriteriaFormWidgetState extends State<CriteriaFormWidget> {
  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.colorGreyIconLight,
        width: 0.8,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    );
    return Obx(
      () => vendorResourcesScreenController.isLoading.value
          ? CustomCircularLoaderModule()
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Criteria Name*",
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              isDense: true,
                              border: inputBorder,
                              enabledBorder: inputBorder,
                              focusedBorder: inputBorder,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Option to select from*",
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              isDense: true,
                              border: inputBorder,
                              enabledBorder: inputBorder,
                              focusedBorder: inputBorder,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 35,
                  width: 75,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.redColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      vendorResourcesScreenController.isLoading(true);
                      setState(() {
                        vendorResourcesScreenController.criteriaList
                            .removeAt(widget.index!);
                      });
                      vendorResourcesScreenController.isLoading(false);
                    },
                    child: const Center(
                      child: Text(
                        "Remove",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class ResourceCreateButton extends StatelessWidget {
  ResourceCreateButton({Key? key}) : super(key: key);
  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (vendorResourcesScreenController.resourceAddFormKey.currentState!
            .validate()) {
          if (vendorResourcesScreenController.addFile == null) {
            Fluttertoast.showToast(msg: "Image is required");
          } else {
            await vendorResourcesScreenController.addVendorResourcesFunction();
          }
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
