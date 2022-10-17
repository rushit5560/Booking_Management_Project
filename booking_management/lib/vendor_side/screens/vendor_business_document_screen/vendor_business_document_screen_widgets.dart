import 'package:booking_management/common_modules/constants/api_url.dart';
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
          DocumentWorkerList singleItem =
              screenController.businessDocumentList[i];
          return _businessDocumentListTile(context, singleItem);
        });
  }

  Widget _businessDocumentListTile(
      BuildContext context, DocumentWorkerList singleItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.colorLightGrey1),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            child: Image.network(
              ApiUrl.apiImagePath + singleItem.documentPath,
              height: 45,
              width: 45,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  UserDetails.userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                Text(
                  singleItem.documentType,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => _bottomSheetModule(context, singleItem),
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
              GestureDetector(
                onTap: () {
                  if (singleItem.isVerify == false &&
                      singleItem.isCancel == true) {
                    _rejectBottomSheet(context, singleItem);
                  }
                },
                child: Text(
                  singleItem.isVerify
                      ? "Verified"
                      : singleItem.isCancel
                          ? "Rejected"
                          : "Pending",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: singleItem.isVerify
                        ? Colors.green
                        : singleItem.isCancel
                            ? Colors.red
                            : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ).commonAllSidePadding(16),
    );
  }

  /// Bottom Sheet
  Future _bottomSheetModule(
      BuildContext context, DocumentWorkerList singleItem) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _heading("Verification"),
              const Divider(thickness: 1),
              _vendorNameModule(),
              const SizedBox(height: 10),
              _vendorDocTypeModule(singleItem),
            ],
          ).commonAllSidePadding(20);
        });
  }

  Widget _heading(String heading) {
    return Text(
      heading,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _vendorNameModule() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "UserName",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.colorLightGrey1,
          ),
          child: Text(UserDetails.userName),
        ),
      ],
    );
  }

  Widget _vendorDocTypeModule(DocumentWorkerList singleItem) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Document Type",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.colorLightGrey1,
          ),
          child: Text(singleItem.documentType),
        ),
      ],
    );
  }

  Future _rejectBottomSheet(
      BuildContext context, DocumentWorkerList singleItem) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _heading("Rejection Reason"),
              const Divider(thickness: 1),
              _vendorRejectTextModule(singleItem),
              // const SizedBox(height: 10),
              // _vendorDocTypeModule(singleItem),
            ],
          ).commonAllSidePadding(20);
        });
  }

  Widget _vendorRejectTextModule(DocumentWorkerList singleItem) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Issue",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.colorLightGrey1,
          ),
          child: Text(singleItem.notes),
        ),
      ],
    );
  }
}
