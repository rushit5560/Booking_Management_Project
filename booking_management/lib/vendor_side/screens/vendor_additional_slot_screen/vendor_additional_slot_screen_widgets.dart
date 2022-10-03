import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_widgets.dart';
import '../../controllers/vendor_additional_slot_screen_controller/vendor_additional_slot_screen_controller.dart';
import '../../model/vendor_additional_slot_screen_model/get_all_additional_slot_model.dart';
import 'vendor_add_additional_slot_screen/vendor_add_additional_slot_screen.dart';
import 'vendor_update_additional_slot_screen/vendor_update_additional_slot_screen.dart';

class AddAdditionalSlotButton extends StatelessWidget {
  const AddAdditionalSlotButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => VendorAddAdditionalSlotScreen(),
          transition: Transition.zoom),
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
            'Add Additional Slot',
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

class AdditionalSlotListModule extends StatelessWidget {
  AdditionalSlotListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAdditionalSlotScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: screenController.allAdditionalSlotList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          AdditionalSlotWorkerList singleItem =
              screenController.allAdditionalSlotList[i];
          return Container(
            margin:
                const EdgeInsets.only(bottom: 17, left: 5, right: 5, top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey.shade300,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  //flex: 68,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _categoryModule(singleItem),
                      const SizedBox(height: 5),

                      _serviceModule(singleItem),
                      const SizedBox(height: 8),

                      // _userMobileNoModule(singleItem),
                      // const SizedBox(height: 8),
                      _priceModule(singleItem),
                      const SizedBox(height: 8),
                      _timeDurationModule(singleItem),
                      const SizedBox(height: 2),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await screenController.getAdditionalDetailsByIdFunction(
                            id: singleItem.id!);
                        // screenController.selectedUpdateItemId = singleItem.id;
                        // screenController.updateAdditionalNameFieldController.text = singleItem.name;
                        // screenController.updateAdditionalPriceFieldController.text = singleItem.price.toString();
                        // screenController.updateAdditionalShortDescriptionFieldController.text = singleItem.shortDescription;
                        // screenController.updateAdditionalLongDescriptionFieldController.text = singleItem.longDescription;
                        // screenController.updateAdditionalTimeDuration.value = singleItem.timeDuration;

                        Get.to(
                          () => VendorUpdateAdditionalSlotScreen(),
                          transition: Transition.zoom,
                        );
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        CommonWidgets.yesOrNoDialog(
                          context: context,
                          title: "Are You Sure ?",
                          body: "You want to delete this additional slot.",
                          onYesPressed: () async {
                            Get.back();
                            await screenController
                                .deleteVendorAdditionalSlotFunction(
                                    resourceId: "${singleItem.id}");
                          },
                          onNoPressed: () {
                            Get.back();
                          },
                        );
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 5),

                //_viewButton(),
              ],
            ).commonAllSidePadding(10),
          );
        });
  }

  Widget _categoryModule(AdditionalSlotWorkerList singleItem) {
    return Text(
      singleItem.shortDescription!,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    );
  }

  Widget _serviceModule(AdditionalSlotWorkerList singleItem) {
    return Text(
      singleItem.categories!.name,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    );
  }

  // Widget _userMobileNoModule(AdditionalSlotWorkerList singleItem){
  //   return Text(
  //       singleItem.mobileNo,
  //       style: const TextStyle(fontSize: 12));
  // }

  Widget _priceModule(AdditionalSlotWorkerList singleItem) {
    return Text(
      singleItem.price.toString(),
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    );
  }

  Widget _timeDurationModule(AdditionalSlotWorkerList singleItem) {
    return Text(
      "Time Duration : ${singleItem.timeDuration.toString()}",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    );
  }
}
