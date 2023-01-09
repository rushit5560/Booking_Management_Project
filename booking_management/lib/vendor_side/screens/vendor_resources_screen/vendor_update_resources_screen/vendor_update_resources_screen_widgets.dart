// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_modules/field_decorations.dart';
import 'package:booking_management/common_modules/field_validation.dart';
import 'package:booking_management/vendor_side/controllers/vendor_resources_screen_controller/vendor_update_resources_screen_controller.dart';

import '../../../../common_modules/common_widgets.dart';

class UpdateResourceFormModule extends StatelessWidget {
  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();

  UpdateResourceFormModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Form(
          key: vendorUpdateResController.resourceUpdateFormKey,
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
              vendorUpdateResController.updateEvent.value
                  ? ResourceCapacityFieldModule()
                  : Container(),
              const SizedBox(height: 10),
              vendorUpdateResController.updateEvent.value
                  ? IsAdditionalCriteriaModule()
                  : Container(),
              const SizedBox(height: 10),
              vendorUpdateResController.updateRequireCriteria.value
                  ? CriteriaManageUpdateModule()
                  : const SizedBox(),

              //ServiceShortDesFieldModule(),
              // const SizedBox(height: 20),
              // ServiceLongDesFieldModule(),
              const SizedBox(height: 30),
              ResourceUpdateButton(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    ).commonSymmetricPadding(horizontal: 12, vertical: 15);
  }
}

class IsAdditionalCriteriaModule extends StatelessWidget {
  IsAdditionalCriteriaModule({Key? key}) : super(key: key);
  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();

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
            value: vendorUpdateResController.updateRequireCriteria.value,
            onChanged: (value) {
              vendorUpdateResController.updateRequireCriteria.value =
                  !vendorUpdateResController.updateRequireCriteria.value;

              // if (vendorUpdateResController.updateRequireCriteria.value ==
              //     false) {
              //   vendorUpdateResController.updateResourceCapacityFieldController
              //       .clear();
              // }
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

// class CriteriaManageAddModule extends StatefulWidget {
//   CriteriaManageAddModule({Key? key}) : super(key: key);

//   @override
//   State<CriteriaManageAddModule> createState() =>
//       _CriteriaManageAddModuleState();
// }

// class _CriteriaManageAddModuleState extends State<CriteriaManageAddModule> {
//   final vendorUpdateResController =
//       Get.find<VendorUpdateResourcesScreenController>();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Obx(
//         //   () =>
//         Container(
//           height: 40,
//           width: 150,
//           margin: const EdgeInsets.symmetric(vertical: 5),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               primary: AppColors.accentColor,
//               padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(10),
//                 ),
//               ),
//             ),
//             onPressed: () {
//               setState(() {});

//               int iNumber = vendorUpdateResController.criteriaUpdateList.length;

//               TextEditingController criteriaNameFieldController =
//                   TextEditingController();
//               TextEditingController criteriaOptionFieldController =
//                   TextEditingController();

//               vendorUpdateResController.criteriaNameUpdateControllerList
//                   .add(criteriaNameFieldController);
//               vendorUpdateResController.criteriaOptionUpdateControllerList
//                   .add(criteriaOptionFieldController);

//               vendorUpdateResController.criteriaUpdateList.add(
//                 CriteriaFormWidget(
//                   index: iNumber,
//                   criteriaNameFieldController: vendorUpdateResController
//                       .criteriaNameUpdateControllerList[iNumber],
//                   optionFieldController: vendorUpdateResController
//                       .criteriaOptionUpdateControllerList[iNumber],
//                 ),
//               );
//             },
//             child: const Center(
//               child: Text(
//                 "Add Criteria",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         // ),
//         // Obx(
//         //   () =>
//         vendorUpdateResController.criteriaUpdateList.isEmpty
//             ? const SizedBox()
//             : ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//                 itemCount: vendorUpdateResController.criteriaUpdateList.length,
//                 itemBuilder: (BuildContext context, int i) {
//                   return vendorUpdateResController.criteriaUpdateList[i];
//                   /* return CriteriaFormWidget(
//                     index: index,
//                   );*/
//                 },
//                 separatorBuilder: (BuildContext context, int index) {
//                   return Divider(
//                     height: 25,
//                     color: AppColors.colorGreyIconLight,
//                     thickness: 0.6,
//                   );
//                 },
//               ),

//         // ),
//         // addCriteriaFormWidget(inputBorder),
//       ],
//     );
//   }
// }

// class CriteriaFormWidget extends StatefulWidget {
//   final int index;
//   TextEditingController criteriaNameFieldController;
//   TextEditingController optionFieldController;

//   CriteriaFormWidget({
//     Key? key,
//     required this.index,
//     required this.criteriaNameFieldController,
//     required this.optionFieldController,
//   }) : super(key: key);

//   @override
//   State<CriteriaFormWidget> createState() => _CriteriaFormWidgetState();
// }

// class _CriteriaFormWidgetState extends State<CriteriaFormWidget> {
//   final vendorUpdateResController =
//       Get.find<VendorUpdateResourcesScreenController>();

//   // TextEditingController criteriaNameFieldController = TextEditingController();
//   // TextEditingController optionFieldController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final inputBorder = OutlineInputBorder(
//       borderSide: BorderSide(
//         color: AppColors.colorGreyIconLight,
//         width: 0.8,
//       ),
//       borderRadius: const BorderRadius.all(Radius.circular(12)),
//     );
//     return Obx(
//       () => vendorUpdateResController.isLoading.value
//           ? const CustomCircularLoaderModule()
//           : Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Criteria Name*",
//                             maxLines: 2,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14,
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           TextFormField(
//                             controller: widget.criteriaNameFieldController,
//                             textInputAction: TextInputAction.done,
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 12),
//                               isDense: true,
//                               border: inputBorder,
//                               enabledBorder: inputBorder,
//                               focusedBorder: inputBorder,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Option to select from*",
//                             maxLines: 2,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14,
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           TextFormField(
//                             controller: widget.optionFieldController,
//                             textInputAction: TextInputAction.next,
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 12),
//                               isDense: true,
//                               border: inputBorder,
//                               enabledBorder: inputBorder,
//                               focusedBorder: inputBorder,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Container(
//                   height: 35,
//                   width: 75,
//                   margin: const EdgeInsets.symmetric(vertical: 5),
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: AppColors.redColor,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 2, vertical: 10),
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       vendorUpdateResController.isLoading(true);
//                       setState(() {});
//                       log('Criteria index number is :${widget.index}');
//                       log('Criteria Name :${vendorUpdateResController.criteriaNameUpdateControllerList[widget.index].text}');
//                       log('Criteria Option :${vendorUpdateResController.criteriaOptionUpdateControllerList[widget.index].text}');

//                       vendorUpdateResController.criteriaUpdateList
//                           .removeAt(widget.index);
//                       vendorUpdateResController.criteriaNameUpdateControllerList
//                           .removeAt(widget.index);
//                       vendorUpdateResController
//                           .criteriaOptionUpdateControllerList
//                           .removeAt(widget.index);

//                       // if (widget.index ==
//                       //     vendorUpdateResController.criteriaGetIndexList
//                       //         .indexWhere((element) {

//                       //   vendorUpdateResController.criteriaGetIndexList
//                       //       .removeAt(widget.index);

//                       //         },)) {
//                       // }

//                       vendorUpdateResController.criteriaGetIndexList
//                           .indexWhere((element) {
//                         if (element == widget.index) {
//                           vendorUpdateResController.criteriaGetIndexList
//                               .removeAt(widget.index);
//                         }
//                         return true;
//                       });

//                       ///
//                       // if (vendorUpdateResController
//                       //         .criteriaGetIndexList.length >=
//                       //     vendorUpdateResController
//                       //         .criteriaUpdateList.length) {
//                       //   vendorUpdateResController.criteriaGetIndexList
//                       //       .removeAt(widget.index);
//                       // }

//                       vendorUpdateResController.isLoading(false);
//                     },
//                     child: const Center(
//                       child: Text(
//                         "Remove",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }

class ResourceProfileModule extends StatelessWidget {
  ResourceProfileModule({Key? key}) : super(key: key);
  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      // clipBehavior: Clip.none,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
              //border: Border.all(color: AppColors.colorLightGrey),
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    color: Colors.grey.shade500)
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: vendorUpdateResController.updateFile != null
                ? Image.file(
                    vendorUpdateResController.updateFile!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    vendorUpdateResController.updatePhotoUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
          ),
        ),

        /*ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(vendorUpdateResController.file!, height: 100, width: 100, fit: BoxFit.fill))*/
        //     : Container(
        //   height: 150, width: 150,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10.0),
        //       //border: Border.all(color: AppColors.colorLightGrey),
        //       boxShadow: [
        //         BoxShadow(
        //             blurRadius: 1,
        //             blurStyle: BlurStyle.outer,
        //             color: Colors.grey.shade500
        //         )
        //       ]
        //   ),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(10.0),
        //     child: Image.network(vendorUpdateResController.updatePhotoUrl,
        //         height: 100, width: 100, fit: BoxFit.cover),
        //   ),
        // )

        /*ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(vendorUpdateResController.updatePhotoUrl,
                height: 100, width: 100, fit: BoxFit.fill))*/

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
      vendorUpdateResController.updateFile = File(image.path);
      vendorUpdateResController.loadUI();
      log('Camera File Path : ${vendorUpdateResController.updateFile}');
      log('Camera Image Path : ${image.path}');
      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {
      vendorUpdateResController.updateFile = File("");
    }
  }
}

class ResourceNameFieldModule extends StatelessWidget {
  ResourceNameFieldModule({Key? key}) : super(key: key);
  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();

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
                  vendorUpdateResController.updateResourceNameFieldController,
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
  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide: BorderSide(
        color: AppColors.whiteColor,
        width: 0,
      ),
    );
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
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              // height: 200,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(color: AppColors.colorLightGrey),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 5,
                    // spreadRadius: 5,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: TextFormField(
                maxLines: null,
                controller: vendorUpdateResController
                    .updateResourceDetailsFieldController,
                keyboardType: TextInputType.multiline,

                validator: (value) =>
                    FieldValidator().validateResourceDetail(value!),
                decoration: InputDecoration(
                  hintText: "Resource Details",
                  focusedBorder: border,
                  border: border,
                  enabledBorder: border,
                ),
                // serviceFormFieldDecoration(hintText: 'Resource Details'),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ResourcePriceFieldModule extends StatelessWidget {
  ResourcePriceFieldModule({Key? key}) : super(key: key);
  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();

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
                  vendorUpdateResController.updateResourcePriceFieldController,
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
  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();

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
              controller: vendorUpdateResController
                  .updateResourceCapacityFieldController,
              keyboardType: TextInputType.number,
              readOnly:
                  vendorUpdateResController.updateEvent == true ? false : true,
              // validator: (value) => FieldValidator().validatePrice(value!),
              decoration:
                  serviceFormFieldDecoration(hintText: 'Resource Capacity'),
            ),
          ],
        )
      ],
    );
  }
}

class EventCheckBoxModule extends StatelessWidget {
  EventCheckBoxModule({Key? key}) : super(key: key);
  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();

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
            value: vendorUpdateResController.updateEvent.value,
            onChanged: (value) {
              vendorUpdateResController.isLoading(true);
              vendorUpdateResController.updateEvent.value =
                  !vendorUpdateResController.updateEvent.value;
              if (vendorUpdateResController.updateEvent.value == false) {
                vendorUpdateResController.updateResourceCapacityFieldController
                    .clear();
                vendorUpdateResController.updateRequireCriteria.value = false;
              }
              log('updateEvent123 : ${vendorUpdateResController.updateEvent.value}');

              vendorUpdateResController.isLoading(false);
              // if(vendorUpdateResController.isSundayOn.value == false) {
              //   vendorUpdateResController.sundayStartTime.value = "00:00";
              //   vendorUpdateResController.sundayEndTime.value = "00:00";
              // }
              // log("${screenController.isSundayOn.value}");
            },
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          "Enable multiple bookings with set capacity",
          maxLines: 2,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
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
  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => vendorUpdateResController.isLoading.value
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Container(
                  height: 40,
                  width: 150,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.accentColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {});
                      vendorUpdateResController.isLoading(true);

                      int iNumber =
                          vendorUpdateResController.criteriaUpdateList.length;

                      // TextEditingController criteriaNameFieldController =
                      //     TextEditingController();
                      // TextEditingController criteriaOptionFieldController =
                      //     TextEditingController();

                      log("adding to index number :: $iNumber");
                      vendorUpdateResController.criteriaNameUpdateControllerList
                          .add(TextEditingController(text: ""));
                      vendorUpdateResController
                          .criteriaOptionUpdateControllerList
                          .add(TextEditingController(text: ""));
                      vendorUpdateResController
                          .criteriaPriceUpdateControllerList
                          .add(TextEditingController(text: ""));
                      vendorUpdateResController.criteriaModeList
                          .add(CriteriaMode.add);

                      vendorUpdateResController.criteriaUpdateList.add(
                        CriteriaFormUpdateWidget(
                          index: iNumber,
                          id: 0,
                          criteriaNameFieldController: vendorUpdateResController
                              .criteriaNameUpdateControllerList[iNumber],
                          optionFieldController: vendorUpdateResController
                              .criteriaOptionUpdateControllerList[iNumber],
                          priceFieldController: vendorUpdateResController
                              .criteriaPriceUpdateControllerList[iNumber],
                          criteriaModeIs: vendorUpdateResController
                              .criteriaModeList[iNumber],
                          optionContollerList: [],
                          priceContollerList: [],
                        ),
                      );
                      vendorUpdateResController.criteriaGetIndexList.add(0);
                      vendorUpdateResController.isLoading(false);
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
                const SizedBox(height: 20),

                vendorUpdateResController.criteriaUpdateList.isEmpty
                    ? const SizedBox()
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            vendorUpdateResController.criteriaUpdateList.length,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (BuildContext context, int index) {
                          return vendorUpdateResController
                              .criteriaUpdateList[index];
                          // return CriteriaFormUpdateWidget(
                          //   index: index,
                          //   id: 0,
                          //   criteriaNameFieldController:
                          //       vendorUpdateResController
                          //           .criteriaNameUpdateControllerList[index],
                          //   optionFieldController: vendorUpdateResController
                          //       .criteriaOptionUpdateControllerList[index],
                          //   priceFieldController: vendorUpdateResController
                          //       .criteriaPriceUpdateControllerList[index],
                          //   criteriaModeIs: vendorUpdateResController
                          //       .criteriaModeList[index],
                          //            subCriteriaWidgetList: [],
                          // );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 10);
                          // return Divider(
                          //   height: 25,
                          //   color: AppColors.colorGreyIconLight,
                          //   thickness: 0.6,
                          // );
                        },
                      ),

                // addCriteriaFormUpdateWidget(inputBorder),
              ],
            ),
    );
  }
}

class CriteriaFormUpdateWidget extends StatefulWidget {
  final int index;
  final int id;
  TextEditingController criteriaNameFieldController;
  TextEditingController optionFieldController;
  TextEditingController priceFieldController;
  List<TextEditingController>? optionContollerList;
  List<TextEditingController>? priceContollerList;
  CriteriaMode criteriaModeIs;

  CriteriaFormUpdateWidget({
    Key? key,
    required this.index,
    required this.id,
    required this.criteriaNameFieldController,
    required this.optionFieldController,
    required this.priceFieldController,
    required this.criteriaModeIs,
    this.optionContollerList,
    this.priceContollerList,
  }) : super(key: key);

  @override
  State<CriteriaFormUpdateWidget> createState() =>
      _CriteriaFormUpdateWidgetState();
}

class _CriteriaFormUpdateWidgetState extends State<CriteriaFormUpdateWidget> {
  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();

  // TextEditingController criteriaNameFieldController = TextEditingController();
  // TextEditingController optionFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.colorGreyIconLight,
        width: 0.8,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    );
    return Obx(
      () => vendorUpdateResController.isLoading.value
          ? const CustomCircularLoaderModule()
          : Container(
              // margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    offset: const Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          vendorUpdateResController.isLoading(true);
                          log('Criteria index number is :${widget.index}');
                          log('Criteria Name :${vendorUpdateResController.criteriaNameUpdateControllerList[widget.index].text}');
                          log('Criteria Option :${vendorUpdateResController.criteriaOptionUpdateControllerList[widget.index].text}');

                          vendorUpdateResController.criteriaUpdateList
                              .removeAt(widget.index);
                          vendorUpdateResController
                              .criteriaNameUpdateControllerList
                              .removeAt(widget.index);
                          vendorUpdateResController
                              .criteriaOptionUpdateControllerList
                              .removeAt(widget.index);

                          if (vendorUpdateResController
                              .criteriaGetIndexList.isEmpty) {
                            log("id index is not there :: ");

                            // if(vendorUpdateResController
                            //   .criteriaGetIndexList.){}
                          } else {
                            vendorUpdateResController.criteriaGetIndexList
                                .removeAt(widget.index);
                            log("vendorUpdateResController.criteriaGetIndexList is :: ${vendorUpdateResController.criteriaGetIndexList}");
                          }

                          vendorUpdateResController.isLoading(false);

                          log("criteias list lentgh is : ${vendorUpdateResController.criteriaGetIndexList}");
                        },
                        child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            color: AppColors.redColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Criteria Name *",
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: widget.criteriaNameFieldController,
                              textInputAction: TextInputAction.next,
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
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Option to select from *",
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: widget.optionFieldController,
                              textInputAction: TextInputAction.next,
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Price *",
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: widget.priceFieldController,
                              textInputAction: TextInputAction.done,
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
                      ),
                      const SizedBox(width: 10),
                      widget.criteriaModeIs == CriteriaMode.add
                          ? const Expanded(child: SizedBox())
                          : Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "",
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  GestureDetector(
                                    onTap: () {
                                      vendorUpdateResController.isLoading(true);

                                      vendorUpdateResController
                                          .isLoading(false);
                                    },
                                    child: Container(
                                      height: 42,
                                      decoration: BoxDecoration(
                                        color: AppColors.accentColor,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Add SubCriteria",
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  widget.criteriaModeIs == CriteriaMode.add
                      ? const SizedBox()
                      : Divider(
                          color: AppColors.colorLightGrey,
                          thickness: 0.8,
                        ),
                  widget.criteriaModeIs == CriteriaMode.add
                      ? const SizedBox()
                      : Row(
                          children: [
                            Text(
                              "Sub Criterias",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorGreyIconDark,
                              ),
                            ),
                          ],
                        ),
                  widget.criteriaModeIs == CriteriaMode.add
                      ? const SizedBox()
                      : const SizedBox(height: 10),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.priceContollerList!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SubCriteriaSingleWidget(
                        optionFieldController:
                            widget.optionContollerList![index],
                        priceFieldController: widget.priceContollerList![index],
                        // index: index,
                      );
                    },
                    separatorBuilder: (ctx, ind) {
                      return const SizedBox(height: 5);
                    },
                  ),
                ],
              ),
            ),
    );
  }
}

class SubCriteriaSingleWidget extends StatelessWidget {
  SubCriteriaSingleWidget({
    Key? key,
    required this.optionFieldController,
    required this.priceFieldController,
    // required this.index,
  }) : super(key: key);

  final TextEditingController optionFieldController;
  final TextEditingController priceFieldController;
  // final int index;

  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.colorGreyIconLight,
        width: 0.8,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Option to select from *",
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: optionFieldController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  isDense: true,
                  border: inputBorder,
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Price *",
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: priceFieldController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  isDense: true,
                  border: inputBorder,
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "",
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // setState(() {});
                // vendorUpdateResController.isLoading(true);
                // log('Criteria index number is :${widget.index}');
                // log('Criteria Name :${vendorUpdateResController.criteriaNameUpdateControllerList[widget.index].text}');
                // log('Criteria Option :${vendorUpdateResController.criteriaOptionUpdateControllerList[widget.index].text}');

                // vendorUpdateResController.criteriaUpdateList
                //     .removeAt(widget.index);
                // vendorUpdateResController.criteriaNameUpdateControllerList
                //     .removeAt(widget.index);
                // vendorUpdateResController.criteriaOptionUpdateControllerList
                //     .removeAt(widget.index);

                // if (vendorUpdateResController.criteriaGetIndexList.isEmpty) {
                //   log("id index is not there :: ");

                //   // if(vendorUpdateResController
                //   //   .criteriaGetIndexList.){}
                // } else {
                //   vendorUpdateResController.criteriaGetIndexList
                //       .removeAt(widget.index);
                //   log("vendorUpdateResController.criteriaGetIndexList is :: ${vendorUpdateResController.criteriaGetIndexList}");
                // }

                // vendorUpdateResController.isLoading(false);

                // log("criteias list lentgh is : ${vendorUpdateResController.criteriaGetIndexList}");
              },
              child: Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(AppImages.minusImgLogo),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ResourceUpdateButton extends StatelessWidget {
  ResourceUpdateButton({Key? key}) : super(key: key);
  final vendorUpdateResController =
      Get.find<VendorUpdateResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (vendorUpdateResController.resourceUpdateFormKey.currentState!
            .validate()) {
          // vendorUpdateResController.criteriaNameUpdateControllerList.clear();

          vendorUpdateResController.criteriaObjectUpdateList.clear();

          if (vendorUpdateResController.updateEvent.value) {
            if (vendorUpdateResController.updateRequireCriteria.value) {
              for (int i = 0;
                  i <
                      vendorUpdateResController
                          .criteriaNameUpdateControllerList.length;
                  i++) {
                if (vendorUpdateResController
                            .criteriaNameUpdateControllerList[i].text
                            .trim() ==
                        "" ||
                    vendorUpdateResController
                            .criteriaOptionUpdateControllerList[i].text
                            .trim() ==
                        "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text("please provide criteria name and its options"),
                    ),
                  );
                } else {
                  if (vendorUpdateResController.criteriaGetIndexList.isEmpty) {
                    vendorUpdateResController.criteriaObjectUpdateList.add(
                      {
                        "Name": vendorUpdateResController
                            .criteriaNameUpdateControllerList[i].text
                            .trim(),
                        "Options": vendorUpdateResController
                            .criteriaOptionUpdateControllerList[i].text
                            .trim(),
                      },
                    );
                  } else {
                    vendorUpdateResController.criteriaObjectUpdateList.add(
                      {
                        "id":
                            "${vendorUpdateResController.criteriaGetIndexList[i]}",
                        "Name": vendorUpdateResController
                            .criteriaNameUpdateControllerList[i].text
                            .trim(),
                        "Options": vendorUpdateResController
                            .criteriaOptionUpdateControllerList[i].text
                            .trim(),
                      },
                    );
                  }
                  log("criteria object list map :: ${vendorUpdateResController.criteriaObjectUpdateList[i]}");
                }
              }
            }
          }

          await vendorUpdateResController.updateVendorResourceFunction();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.accentColor,
            boxShadow: [
              BoxShadow(
                // spreadRadius: 3,
                blurRadius: 5,
                color: Colors.grey.shade300,
                blurStyle: BlurStyle.outer,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Text(
            'Update',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}

//criterias update old widget

// class CriteriaFormUpdateWidget extends StatefulWidget {
//   final int index;
//   final int id;
//   TextEditingController criteriaNameFieldController;
//   TextEditingController optionFieldController;

//   CriteriaFormUpdateWidget({
//     Key? key,
//     required this.index,
//     required this.id,
//     required this.criteriaNameFieldController,
//     required this.optionFieldController,
//   }) : super(key: key);

//   @override
//   State<CriteriaFormUpdateWidget> createState() =>
//       _CriteriaFormUpdateWidgetState();
// }

// class _CriteriaFormUpdateWidgetState extends State<CriteriaFormUpdateWidget> {
//   final vendorUpdateResController =
//       Get.find<VendorUpdateResourcesScreenController>();

//   // TextEditingController criteriaNameFieldController = TextEditingController();
//   // TextEditingController optionFieldController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final inputBorder = OutlineInputBorder(
//       borderSide: BorderSide(
//         color: AppColors.colorGreyIconLight,
//         width: 0.8,
//       ),
//       borderRadius: const BorderRadius.all(Radius.circular(12)),
//     );
//     return Obx(
//       () => vendorUpdateResController.isLoading.value
//           ? const CustomCircularLoaderModule()
//           : Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Criteria Name*",
//                             maxLines: 2,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14,
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           TextFormField(
//                             controller: widget.criteriaNameFieldController,
//                             textInputAction: TextInputAction.done,
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 12),
//                               isDense: true,
//                               border: inputBorder,
//                               enabledBorder: inputBorder,
//                               focusedBorder: inputBorder,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Option to select from*",
//                             maxLines: 2,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14,
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           TextFormField(
//                             controller: widget.optionFieldController,
//                             textInputAction: TextInputAction.next,
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 12),
//                               isDense: true,
//                               border: inputBorder,
//                               enabledBorder: inputBorder,
//                               focusedBorder: inputBorder,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Container(
//                   height: 35,
//                   width: 75,
//                   margin: const EdgeInsets.symmetric(vertical: 5),
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: AppColors.redColor,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 2, vertical: 10),
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       setState(() {});
//                       // vendorUpdateResController.isLoading(true);
//                       // vendorUpdateResController.criteriaUpdateList
//                       //     .removeAt(widget.index);
//                       // vendorUpdateResController.criteriaNameUpdateControllerList
//                       //     .removeAt(widget.index);
//                       // vendorUpdateResController
//                       //     .criteriaOptionUpdateControllerList
//                       //     .removeAt(widget.index);
//                       // vendorUpdateResController.isLoading(false);

//                       //  vendorUpdateResController.isLoading(true);
//                       setState(() {});
//                       vendorUpdateResController.isLoading(true);
//                       log('Criteria index number is :${widget.index}');
//                       log('Criteria Name :${vendorUpdateResController.criteriaNameUpdateControllerList[widget.index].text}');
//                       log('Criteria Option :${vendorUpdateResController.criteriaOptionUpdateControllerList[widget.index].text}');

//                       vendorUpdateResController.criteriaUpdateList
//                           .removeAt(widget.index);
//                       vendorUpdateResController.criteriaNameUpdateControllerList
//                           .removeAt(widget.index);
//                       vendorUpdateResController
//                           .criteriaOptionUpdateControllerList
//                           .removeAt(widget.index);

//                       if (vendorUpdateResController
//                           .criteriaGetIndexList.isEmpty) {
//                         log("id index is not there :: ");

//                         // if(vendorUpdateResController
//                         //   .criteriaGetIndexList.){}
//                       } else {
//                         vendorUpdateResController.criteriaGetIndexList
//                             .removeAt(widget.index);
//                         log("vendorUpdateResController.criteriaGetIndexList is :: ${vendorUpdateResController.criteriaGetIndexList}");
//                       }

//                       vendorUpdateResController.isLoading(false);
//                       // if (widget.index ==
//                       //     vendorUpdateResController.criteriaGetIndexList
//                       //         .indexWhere((element) {

//                       //   vendorUpdateResController.criteriaGetIndexList
//                       //       .removeAt(widget.index);

//                       //         },)) {
//                       // }

//                       //     ((element) {
//                       //   if (element == widget.index) {
//                       //     log('Criteria id list  index number is :${widget.index}');
//                       //     vendorUpdateResController.criteriaGetIndexList
//                       //         .removeAt(widget.index);
//                       //   }
//                       //   return true;
//                       // });

//                       ///
//                       // if (vendorUpdateResController
//                       //         .criteriaGetIndexList.length >=
//                       //     vendorUpdateResController
//                       //         .criteriaUpdateList.length) {
//                       //   vendorUpdateResController.criteriaGetIndexList
//                       //       .removeAt(widget.index);
//                       // }
//                     },
//                     child: const Center(
//                       child: Text(
//                         "Remove",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
