import 'dart:developer';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../controllers/review_screen_controller/review_screen_controller.dart';
import '../../model/review_screen_model/get_all_reviews_model.dart';

class ReviewListModule extends StatelessWidget {
  ReviewListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ReviewScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: screenController.reviewList.length,
        itemBuilder: (context, i) {
          VendorReviewObject singleItem = screenController.reviewList[i];
          return _reviewListTile(singleItem);
        });
  }

  Widget _reviewListTile(VendorReviewObject singleItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.colorLightGrey1),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                /*ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(AppImages.vendorImg, scale: 20,),
                  //child: Image.network(screenController.reviewList[index].customer.image),
                ),
                const SizedBox(width: 10),*/

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        singleItem.customer.userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        singleItem.customer.email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: singleItem.ratting.toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            ignoreGestures: true,
                            //itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              log(rating.toString());
                            },
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Date : ${singleItem.date}",
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(singleItem.description)
          ],
        ),
      ),
    );
  }
}
