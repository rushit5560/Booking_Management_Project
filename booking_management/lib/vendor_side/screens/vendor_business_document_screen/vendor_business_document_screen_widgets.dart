import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/vendor_business_document_screen_controller/vendor_business_document_screen_controller.dart';
import '../../model/business_document_screen_models/get_all_business_documents_model.dart';
import 'vendor_add_business_document_screen/vendor_add_business_document_screen.dart';

class AddBusinessDocButtonModule extends StatelessWidget {
  const AddBusinessDocButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => VendorAddBusinessDocumentScreen(),
          transition: Transition.zoom,
        );
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
            'Add Business Document',
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

class BusinessDocumentList extends StatelessWidget {
  BusinessDocumentList({Key? key}) : super(key: key);
  final screenController = Get.find<VendorBusinessDocumentScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: screenController.businessDocumentList.length,
        itemBuilder: (context, i) {
          DocumentWorkerList singleItem = screenController.businessDocumentList[i];
          return _businessDocumentListTile(context, singleItem);
        });
  }

  Widget _businessDocumentListTile(BuildContext context, DocumentWorkerList singleItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.colorLightGrey1),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  UserDetails.userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                Text(
                  singleItem.documentType,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                // onTap: () => _bottomSheetModule(context),
                child: Text(
                  "View",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                singleItem.isVerify ? "Verified" : "Unverified",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: singleItem.isVerify ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ).commonAllSidePadding(20),
    );
  }

  /// Bottom Sheet
  // Future _bottomSheetModule(BuildContext context) {
  //   return showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             _heading("Verification"),
  //             const Divider(thickness: 1),
  //             _vendorNameModule(),
  //           ],
  //         ).commonAllSidePadding(20);
  //       });
  // }

  // Widget _heading(String heading) {
  //   return Text(
  //     heading,
  //     style: const TextStyle(
  //       fontWeight: FontWeight.bold,
  //       fontSize: 20,
  //     ),
  //   );
  // }
  //
  // Widget _vendorNameModule() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         "UserName",
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 16,
  //         ),
  //       ),
  //       const SizedBox(height: 10),
  //       Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(15),
  //           color: AppColors.colorLightGrey1,
  //         ),
  //         child: Text(
  //           "Vendor Name",
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
