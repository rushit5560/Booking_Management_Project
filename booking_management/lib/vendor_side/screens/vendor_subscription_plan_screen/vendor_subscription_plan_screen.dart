import 'dart:developer';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/container_decorations.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/vendor_index_screen/vendor_index_screen.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../controllers/vendor_subscription_plan_screen_controller/vendor_subscription_plan_screen_controller.dart';
import '../../model/vendor_subscription_plan_screen_models/get_all_subscription_model.dart';
import '../vendor_card_payment_screen/vendor_card_payment_sceen.dart';

class VendorSubscriptionPlanScreen extends StatelessWidget {
  VendorSubscriptionPlanScreen({Key? key}) : super(key: key);
  final vendorSubscriptionPlanScreenController =
      Get.put(VendorSubscriptionPlanScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => vendorSubscriptionPlanScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    customAppbar(),
                    // const CommonAppBarModule(
                    //   title: "Subscription Plan",
                    //   appBarOption: AppBarOption.,
                    // ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: vendorSubscriptionPlanScreenController
                            .allSubscriptionList.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          SubscriptionWorkerList singleItem =
                              vendorSubscriptionPlanScreenController
                                  .allSubscriptionList[i];
                          return subscriptionPlanListTile(singleItem);
                        },
                      ).commonSymmetricPadding(horizontal: 15),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  customAppbar() {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          color: AppColors.accentColor
          //color: Colors.grey
          ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Subscription Plan",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
          vendorSubscriptionPlanScreenController.subscriptionOption ==
                  SubscriptionOption.drawer
              ? leftSideButton()
              : const SizedBox(),
          vendorSubscriptionPlanScreenController.subscriptionOption ==
                  SubscriptionOption.direct
              ? rightSideButton()
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget leftSideButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(AppImages.backArrowImg),
        ),
      ),
    );
  }

  Widget rightSideButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Get.offAll(() => VendorIndexScreen());
        },
        child: Container(
          // height: 50,
          // width: 50,
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            "Skip",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget subscriptionPlanListTile(SubscriptionWorkerList singleItem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: AppColors.accentColor,
          width: 0.8,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpandablePanel(
        header: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // image: DecorationImage(
                  //   image:
                  //       NetworkImage("${ApiUrl.apiImagePath}${singleItem.image}"),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: Image.network("${singleItem.image}",
                    errorBuilder: (context, st, ob) {
                  return Image.asset(AppImages.logoImg);
                }, fit: BoxFit.cover),
              ),
              const SizedBox(width: 25),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      singleItem.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'From \$${singleItem.price} ${singleItem.currency} / ${singleItem.interval}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    //const SizedBox(height: 8),

                    Html(data: singleItem.detail),
                  ],
                ),
              ),
              // const SizedBox(width: 15),
              // Image.asset(AppImages.rightArrowImg),
            ],
          ),
        ),
        theme: ExpandableThemeData(
          // collapseIcon: Icons.arrow_drop_down,

          animationDuration: const Duration(milliseconds: 500),
          headerAlignment: ExpandablePanelHeaderAlignment.center,

          iconColor: AppColors.blackColor,
        ),
        collapsed: Container(),
        expanded: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () async {
                    if (singleItem.isActive == true) {
                      // Remove Plan Api Call
                      await vendorSubscriptionPlanScreenController
                          .cancelSubscriptionPlanFunction(
                        productId: singleItem.id,
                        id: singleItem.stripeSubscriptionId,
                      );
                    } else {
                      Get.to(
                        () => const VendorCardPaymentScreen(),
                        arguments: [
                          singleItem.price,
                          singleItem.id,
                          singleItem.interval,
                          singleItem.currency,
                          singleItem.priceId,
                        ],
                      );
                      // // Purchase plan api call
                      // await vendorSubscriptionPlanScreenController
                      //     .purchaseSubscriptionPlanFunction(
                      //         productId: singleItem.id);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: singleItem.isActive == true
                            ? Colors.red
                            : Colors.green),
                    child: Text(
                      singleItem.isActive == true ? "Cancel" : "Purchase Now",
                      style: const TextStyle(color: Colors.white),
                    ).commonSymmetricPadding(horizontal: 15, vertical: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//old sub listtile
// Widget _subscriptionPlanLitTile(SubscriptionWorkerList singleItem) {
//     return GestureDetector(
//       // onTap: () => Get.to(()=> VendorCheckoutScreen(), transition: Transition.rightToLeft, arguments: singleItem.price),
//       onTap: () async {
//         /*await vendorSubscriptionPlanScreenController
//             .makePayment(singleItem.price);*/
//       },
//       child: Container(
//         margin: const EdgeInsets.only(left: 5, right: 5),
//         decoration: shadowDecoration(),
//         // margin: EdgeInsets.all(5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: 60,
//                   width: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     // image: DecorationImage(
//                     //   image:
//                     //       NetworkImage("${ApiUrl.apiImagePath}${singleItem.image}"),
//                     //   fit: BoxFit.cover,
//                     // ),
//                   ),
//                   child:
//                       Image.network("${ApiUrl.apiImagePath}${singleItem.image}",
//                           errorBuilder: (context, st, ob) {
//                     return Image.asset(AppImages.logoImg);
//                   }, fit: BoxFit.cover),
//                 ),
//                 const SizedBox(width: 15),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         singleItem.name,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 8),

//                       Text(
//                         'From \$${singleItem.price} ${singleItem.currency} / ${singleItem.interval}',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                       //const SizedBox(height: 8),

//                       Html(data: singleItem.detail),
//                     ],
//                   ),
//                 ),
//                 // const SizedBox(width: 15),
//                 // Image.asset(AppImages.rightArrowImg),
//               ],
//             ),
//             GestureDetector(
//               onTap: () async {
//                 if (singleItem.isActive == true) {
//                   // Remove Plan Api Call
//                   await vendorSubscriptionPlanScreenController
//                       .cancelSubscriptionPlanFunction(
//                     productId: singleItem.id,
//                     id: singleItem.stripeSubscriptionId,
//                   );
//                 } else {
//                   Get.to(
//                     () => const VendorCardPaymentScreen(),
//                     arguments: [
//                       singleItem.price,
//                     ],
//                   );
//                   // Purchase plan api call
//                   await vendorSubscriptionPlanScreenController
//                       .purchaseSubscriptionPlanFunction(
//                           productId: singleItem.id);
//                 }
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: singleItem.isActive == true
//                         ? Colors.red
//                         : Colors.green),
//                 child: Text(
//                   singleItem.isActive == true ? "Cancel" : "Purchase Now",
//                   style: const TextStyle(color: Colors.white),
//                 ).commonSymmetricPadding(horizontal: 15, vertical: 10),
//               ),
//             ),
//           ],
//         ).commonAllSidePadding(10),
//       ).commonSymmetricPadding(vertical: 10),
//     );
//   }
