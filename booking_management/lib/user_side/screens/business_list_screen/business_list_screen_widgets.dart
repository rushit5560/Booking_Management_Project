import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/user_side/controllers/business_list_screen_controller/business_list_screen_controller.dart';
import 'package:booking_management/user_side/model/user_business_list_model/user_business_list_model.dart';
import 'package:booking_management/user_side/screens/business_details_screen/business_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';

class BusinessList extends StatelessWidget {
   BusinessList({Key? key}) : super(key: key);
   BusinessListScreenController screenController = Get.find<BusinessListScreenController>();

  //Datum ? datum1;
  @override
  Widget build(BuildContext context) {
    return screenController.businessList.isEmpty
       ? const Center(child: Text("Empty List")) :
      ListView.builder(
      itemCount: screenController.businessList.length,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index){
          Datum datum = screenController.businessList[index];
          return BusinessListModule(datum: datum);
        });
  }

  // Widget businessListModule(index){
  //   return GestureDetector(
  //     onTap: (){
  //       Get.to(() => BusinessDetailScreen(), arguments: datum1!.id);
  //     },
  //     child: Container(
  //       margin: const EdgeInsets.only(bottom: 12, left: 3, right: 3, top: 7),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: Colors.white,
  //         boxShadow: [
  //           BoxShadow(
  //               color: AppColors.colorLightGrey.withOpacity(0.8),
  //               blurRadius: 2,
  //               spreadRadius: 2,
  //               blurStyle: BlurStyle.outer
  //           ),
  //         ],
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(12),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Expanded(
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                     flex: 1,
  //                     child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(10),
  //                       child: Image.network(ApiUrl.apiMainPath + screenController.businessList[index].businessLogo),
  //                     ),
  //                   ),
  //                   const SizedBox(width: 15,),
  //
  //                   Expanded(
  //                     flex: 3,
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(screenController.businessList[index].businessName, style: const TextStyle(
  //                             color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16
  //                         ),),
  //                         const SizedBox(height: 3,),
  //                         Row(
  //                           children: [
  //                             screenController.businessList[index].review.isNotEmpty ?
  //                             Text( screenController.businessList[index].review, style: const TextStyle(fontSize: 12),) :
  //                             const Text("4.5", style: TextStyle(fontSize: 12),),
  //
  //                             const SizedBox(width: 4,),
  //                             RatingBar.builder(
  //                               initialRating: 5,
  //                               minRating: 1,
  //                               direction: Axis.horizontal,
  //                               allowHalfRating: true,
  //                               itemCount: 5,
  //                               itemSize: 17,
  //                               itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
  //                               itemBuilder: (context, _) => const Icon(
  //                                 Icons.star,
  //                                 color: Colors.amber,
  //                               ),
  //                               onRatingUpdate: (rating) {
  //                                 if (kDebugMode) {
  //                                   print(rating);
  //                                 }
  //                               },
  //                             )
  //                           ],
  //                         ),
  //                         const SizedBox(height: 3,),
  //                         Text(screenController.businessList[index].address1, maxLines: 1,style: TextStyle(fontSize: 12)),
  //                         const SizedBox(height: 3,),
  //                         //SizedBox(width: 4,),
  //                       Text("Location - " +  screenController.businessList[index].address2, maxLines: 1,
  //                           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(width: 15,),
  //             Image.asset(AppImages.rightArrowImg)
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class BusinessListModule extends StatelessWidget {
  //BusinessListModule({Key? key}) : super(key: key);

  final Datum datum;
  const BusinessListModule({Key? key, required this.datum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        log("id: ${datum.id}");
        Get.to(() => BusinessDetailScreen(), arguments: datum.id);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, left: 3, right: 3, top: 7),
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
                        //child: datum.businessLogo.isNotEmpty ? Image.network(ApiUrl.apiMainPath + datum.businessLogo) : Image.asset(AppImages.vendorImg),
                        child: CachedNetworkImage(
                          imageUrl: ApiUrl.apiImagePath + datum.businessLogo,
                            placeholder: (context, url) {
                            return Image.asset(AppImages.vendorImg);},
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),

                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(datum.businessName, style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16
                          ),),
                          const SizedBox(height: 3,),
                          Row(
                            children: [
                              datum.review.isNotEmpty ?
                              Text(datum.review, style: const TextStyle(fontSize: 12),) :
                              const Text("4.5", style: TextStyle(fontSize: 12),),

                              const SizedBox(width: 4),
                              RatingBar.builder(
                                initialRating: double.parse(datum.review),
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
                          // const SizedBox(height: 3,),
                          // Text(datum.address1, maxLines: 1,style: TextStyle(fontSize: 12)),
                          const SizedBox(height: 5,),
                          //SizedBox(width: 4,),
                          Text("Location - " +  datum.address, maxLines: 1,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
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
      ),
    );
  }
}


