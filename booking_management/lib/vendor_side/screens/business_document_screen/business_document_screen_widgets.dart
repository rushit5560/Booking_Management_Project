import 'dart:developer';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BusinessDocumentList extends StatelessWidget {
  const BusinessDocumentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index){
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                color: AppColors.colorLightGrey1
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(AppImages.vendorImg, scale: 20,),
                        //child: Image.network(screenController.reviewList[index].customer.image),
                      ),
                      const SizedBox(width: 10,),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Lorem Ipsum",
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                            SizedBox(height: 3,),
                            Text("Document Type",
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          ],
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
          );
        });
  }
}
