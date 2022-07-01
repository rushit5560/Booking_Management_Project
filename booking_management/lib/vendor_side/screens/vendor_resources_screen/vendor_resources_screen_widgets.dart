import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/choose_court_screen/choose_court_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_resources_screen/vendor_add_resource_screen/vendor_add_resource_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_resources_screen/vendor_update_resources_screen/vendor_update_resources_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/container_decorations.dart';
import '../../controllers/vendor_resources_screen_controller/vendor_resources_screen_controller.dart';

class AddResourcesButton extends StatelessWidget {
  const AddResourcesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //if(screenController.vendorProfileFormKey.currentState!.validate()){
        Get.to(() => VendorAddResourceScreen());
        // }
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
            'Add Resource',
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

class VendorResourcesListModule extends StatelessWidget {
  VendorResourcesListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.getResourceList.isEmpty
        ? const Center(child: Text("There is no resources list"))
        : ListView.builder(
            itemCount: screenController.getResourceList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  //Get.to(() => ChooseCourtScreen());
                },
                child: Container(
                  //margin: const EdgeInsets.only(left: 5, right: 5),
                  decoration: shadowDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                screenController
                                    .getResourceList[i].resourceName!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                screenController.getResourceList[i].details!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text(
                                    'price:',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${screenController.getResourceList[i].price}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text(
                                    'Capacity:',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${screenController.getResourceList[i].capacity}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  await screenController
                                      .getResourcesDetailsByIdFunction(
                                          id: screenController
                                              .getResourceList[i].id!);
                                  //screenController.selectedItemId = screenController.getResourceList[i].id;
                                  //screenController.updateResourceNameFieldController.text = screenController.getResourceList[i].resourceName;
                                  //screenController.updateResourceDetailsFieldController.text = screenController.getResourceList[i].details;
                                  //screenController.updateResourcePriceFieldController.text = screenController.getResourceList[i].price.toString();
                                  //screenController.updatePhotoUrl = "http://5.189.147.159:9600///images//Resource//9188f689-6c67-4fae-9045-a55a32888891.png";
                                  //screenController.updatePhotoUrl = "http://5.189.147.159:9600/""${screenController.getResourceList[i].image}";
                                  //log("http://5.189.147.159:9600/" +screenController.getResourceList[i].image );
                                  //log('screenController.updatePhotoUrl : ${screenController.updatePhotoUrl}');
                                  //log('image: ${screenController.getResourceList[i].image}');
                                  Get.to(
                                    () => VendorUpdateResourcesScreen(),
                                    transition: Transition.zoom,
                                  );
                                },
                                child: const Icon(Icons.edit)),
                            SizedBox(width: 10),
                            GestureDetector(
                                onTap: () {
                                  CommonWidgets.yesOrNoDialog(
                                    context: context,
                                    title: "Are You Sure ?",
                                    body: "You want to delete this resource ",
                                    onYesPressed: () async {
                                      await screenController
                                          .deleteVendorResourceFunction(
                                              resourceId:
                                                  "${screenController.getResourceList[i].id}");

                                      Get.back();
                                    },
                                    onNoPressed: () {
                                      Get.back();
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ).commonSymmetricPadding(vertical: 10),
              );
            },
          );
  }
}
