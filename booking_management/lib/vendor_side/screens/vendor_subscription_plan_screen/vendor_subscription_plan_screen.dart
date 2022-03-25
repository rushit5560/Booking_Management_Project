import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/container_decorations.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';

class VendorSubscriptionPlanScreen extends StatelessWidget {
  const VendorSubscriptionPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: "Subscription Plan", appBarOption: AppBarOption.singleBackButtonOption,),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i){
                  return Container(
                    decoration: shadowDecoration(),
                    // margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text(
                                '\$49 / Mon',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),

                              const Text(
                                '\$49 / Mon',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '- ',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '- ',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Lorem Ipsum has been the industry's standard",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 3),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '- ',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Lorem Ipsum has been the industry's standard",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Image.asset(AppImages.rightArrowImg),
                      ],
                    ).commonAllSidePadding(10),
                  ).commonSymmetricPadding(vertical: 10);
                },
              ).commonSymmetricPadding(horizontal: 25),
            ),
          ],
        ),
      ),
    );
  }
}
