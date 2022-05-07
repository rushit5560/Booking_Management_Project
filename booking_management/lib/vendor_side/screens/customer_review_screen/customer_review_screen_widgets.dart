import 'dart:developer';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewListModule extends StatelessWidget {
  const ReviewListModule({Key? key}) : super(key: key);

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
                          children: [
                            const Text("Lorem Ipsum",
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                            const SizedBox(height: 3,),
                            RatingBar.builder(
                              initialRating: 5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              //itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                log(rating.toString());
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                ],
              ),
            ),
          );
        });
  }
}
