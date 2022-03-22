
import 'package:booking_management/common/constants/app_colors.dart';
import 'package:booking_management/common/constants/app_images.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
        color: AppColors.colorLightGrey
        //color: Colors.grey
      ),
      child: const Center(
        child: Text("Vendor List", style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20
        ),),
      ),
    );
  }
}

class VendorList extends StatelessWidget {
  const VendorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.colorLightGrey.withOpacity(0.8),
                    blurRadius: 2,
                    spreadRadius: 2,
                    blurStyle: BlurStyle.outer
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(AppImages.vendorImg),
                          ),
                        ),
                        const SizedBox(width: 15,),

                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Lorem Ipsum", style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16
                              ),),
                              const SizedBox(height: 3,),
                              Row(
                                children: [
                                  const Text("4.5", style: TextStyle(fontSize: 12),),
                                  const SizedBox(width: 4,),
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 17,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      if (kDebugMode) {
                                        print(rating);
                                      }
                                    },
                                  )
                                ],
                              ),
                              const SizedBox(height: 3,),
                              const Text("Lorem Ipsum is simply dummy text of the printing", maxLines: 1,style: TextStyle(fontSize: 12)),
                              const SizedBox(height: 3,),
                              //SizedBox(width: 4,),
                              const Text("Location - 1156, Lorem Ipsum is simply dummy text of the printing", maxLines: 1,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Image.asset(AppImages.rightArrowImg)
                ],
              ),
            ),
          );
        });
  }
}

