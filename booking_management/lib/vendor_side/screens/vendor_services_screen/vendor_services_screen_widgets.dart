import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/vendor_services_screen/vendor_update_service_screen/vendor_update_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_widgets.dart';
import '../../controllers/vendor_services_screen_controller/vendor_services_screen_controller.dart';
import '../../model/vendor_service_screen_model/get_vendor_service_model.dart';
import 'vendor_add_service_screen/vendor_add_service_screen.dart';

/// Add Service Button
class AddServicesButton extends StatelessWidget {
  const AddServicesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.to(() => VendorAddServiceScreen(), transition: Transition.zoom),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 3,
              blurRadius: 5,
              color: Colors.grey.shade400,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Text(
            'Add Service',
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

/// Service List Module
class ServicesListModule extends StatelessWidget {
  ServicesListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: screenController.allResourcesList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          WorkerList1 singleItem = screenController.allResourcesList[i];
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
              children: [
                Expanded(
                  //flex: 68,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _categoryModule(singleItem),
                            const SizedBox(height: 8),

                            _serviceModule(singleItem),
                            const SizedBox(height: 8),

                            // _userMobileNoModule(singleItem),
                            // const SizedBox(height: 8),
                            _priceModule(singleItem),
                            const SizedBox(height: 8),
                            _timeDurationModule(singleItem),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await screenController.getAdditionalDetailsByIdFunction(
                            id: singleItem.id);
                        // screenController.selectedItemId = singleItem.id;
                        // screenController.updateServiceNameFieldController.text = singleItem.name;
                        // screenController.updateServicePriceFieldController.text = singleItem.price.toString();
                        // screenController.updateServiceShortDesFieldController.text = singleItem.shortDescription;
                        // screenController.updateServiceLongDesFieldController.text = singleItem.longDescription;
                        // screenController.updateTimeDuration.value = singleItem.timeDuration;

                        Get.to(
                          () => VendorUpdateServiceScreen(),
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
                          title: "Are you sure ?",
                          body: "You want to delete this service.",
                          onYesPressed: () async {
                            Get.back();
                            await screenController.deleteVendorServiceFunction(
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

  // Widget _userImageModule(i) {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.pendingList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _categoryModule(WorkerList1 singleItem) {
    return Text(
      singleItem.name,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _serviceModule(WorkerList1 singleItem) {
    return Text(singleItem.categories.name,
        style: const TextStyle(fontSize: 14));
  }

  // Widget _userMobileNoModule(WorkerList1 singleItem){
  //   return Text(
  //       singleItem.mobileNo,
  //       style: const TextStyle(fontSize: 14));
  // }

  Widget _priceModule(WorkerList1 singleItem) {
    return Text(singleItem.price.toString(),
        style: const TextStyle(fontSize: 14));
  }

  Widget _timeDurationModule(WorkerList1 singleItem) {
    return Text("Time Duration : ${singleItem.timeDuration.toString()}",
        style: const TextStyle(fontSize: 14));
  }

  showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container();
        });
  }
}
