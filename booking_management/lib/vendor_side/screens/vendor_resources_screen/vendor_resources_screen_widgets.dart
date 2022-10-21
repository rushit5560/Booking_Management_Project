import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/choose_court_screen/choose_court_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_resources_screen/vendor_add_resource_screen/vendor_add_resource_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_resources_screen/vendor_update_resources_screen/vendor_update_resources_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
  final vendorResourcesScreenController =
      Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return vendorResourcesScreenController.getResourceList.isEmpty
        ? const Center(child: Text("There is no resources list"))
        : ListView.builder(
            itemCount: vendorResourcesScreenController.getResourceList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              var price = vendorResourcesScreenController
                  .getResourceList[i].price
                  .toString()
                  .split(".")[0];
              return GestureDetector(
                onTap: () {
                  //Get.to(() => ChooseCourtScreen());
                },
                child: Container(
                  //margin: const EdgeInsets.only(left: 5, right: 5),
                  decoration: shadowDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                child: Image.network(
                                  ApiUrl.apiImagePath +
                                      "${vendorResourcesScreenController.getResourceList[i].image}",
                                  height: 65,
                                  width: 65,
                                  errorBuilder: (ctx, obj, st) {
                                    return Image.asset(
                                      AppImages.vendorImg,
                                      height: 65,
                                      width: 65,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                vendorResourcesScreenController
                                    .getResourceList[i].resourceName!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              //const SizedBox(height: 8),
                              Html(
                                data: vendorResourcesScreenController
                                    .getResourceList[i].details!,
                              ),
                              // Text(
                              //   vendorResourcesScreenController.getResourceList[i].details!,
                              //   maxLines: 2,
                              //   overflow: TextOverflow.ellipsis,
                              //   style: const TextStyle(
                              //     fontSize: 15,
                              //   ),
                              // ),
                              //const SizedBox(height: 8),
                              UserDetails.isPriceDisplay
                                  ? Row(
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
                                          price,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              UserDetails.isPriceDisplay
                                  ? const SizedBox(height: 8)
                                  : Container(),
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
                                    '${vendorResourcesScreenController.getResourceList[i].capacity}',
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
                                // await vendorResourcesScreenController
                                //     .getResourcesDetailsByIdFunction(
                                //         id: vendorResourcesScreenController
                                //             .getResourceList[i].id!);
                                Get.to(
                                  () => VendorUpdateResourcesScreen(),
                                  transition: Transition.zoom,
                                  arguments: vendorResourcesScreenController
                                      .getResourceList[i].id!,
                                );
                              },
                              child: const Icon(
                                Icons.edit,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                CommonWidgets.yesOrNoDialog(
                                  context: context,
                                  title: "Are you sure ?",
                                  body: "You want to delete this resource.",
                                  onYesPressed: () async {
                                    Get.back();
                                    await vendorResourcesScreenController
                                        .deleteVendorResourceFunction(
                                            resourceId:
                                                "${vendorResourcesScreenController.getResourceList[i].id}");
                                  },
                                  onNoPressed: () {
                                    Get.back();
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).commonSymmetricPadding(vertical: 12),
              );
            },
          );
  }
}
