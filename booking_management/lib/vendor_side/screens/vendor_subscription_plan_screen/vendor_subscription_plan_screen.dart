import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/container_decorations.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/vendor_checkout_screen/vendor_checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/api_url.dart';
import '../../controllers/vendor_subscription_plan_screen_controller/vendor_subscription_plan_screen_controller.dart';
import '../../model/vendor_subscription_plan_screen_models/get_all_subscription_model.dart';

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
                    const CommonAppBarModule(
                      title: "Subscription Plan",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
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
                          return _subscriptionPlanLitTile(singleItem);
                        },
                      ).commonSymmetricPadding(horizontal: 20),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _subscriptionPlanLitTile(SubscriptionWorkerList singleItem) {
    return GestureDetector(
      // onTap: () => Get.to(()=> VendorCheckoutScreen(), transition: Transition.rightToLeft, arguments: singleItem.price),
      onTap: () async {
        await vendorSubscriptionPlanScreenController
            .makePayment(singleItem.price);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        decoration: shadowDecoration(),
        // margin: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // image: DecorationImage(
                //   image:
                //       NetworkImage("${ApiUrl.apiImagePath}${singleItem.image}"),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Image.network("${ApiUrl.apiImagePath}${singleItem.image}",
                errorBuilder: (context, st, ob){
                  return Image.asset(AppImages.logoImg);
                },fit: BoxFit.cover),
            ),
            const SizedBox(width: 15),
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
                    'From \$${singleItem.price} / ${singleItem.days}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  //const SizedBox(height: 8),

                  Html(data: singleItem.detail),

                  // const SizedBox(height: 3),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: const [
                  //     Text(
                  //       '- ',
                  //       style: TextStyle(fontSize: 12),
                  //     ),
                  //     Expanded(
                  //       child: Text(
                  //         "Lorem Ipsum has been the industry's standard",
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis,
                  //         style: TextStyle(fontSize: 12),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  //
                  // const SizedBox(height: 3),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: const [
                  //     Text(
                  //       '- ',
                  //       style: TextStyle(fontSize: 12),
                  //     ),
                  //     Expanded(
                  //       child: Text(
                  //         "Lorem Ipsum has been the industry's standard",
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis,
                  //         style: TextStyle(fontSize: 12),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Image.asset(AppImages.rightArrowImg),
          ],
        ).commonAllSidePadding(10),
      ).commonSymmetricPadding(vertical: 10),
    );
  }
}
