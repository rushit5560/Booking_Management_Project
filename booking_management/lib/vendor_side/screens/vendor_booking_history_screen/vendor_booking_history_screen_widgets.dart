import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:flutter/material.dart';

class VendorBookingHistoryList extends StatelessWidget {
  const VendorBookingHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              //Get.to(() => const BookingDetailsScreen(), transition: Transition.zoom);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10, left: 3, right: 3, top: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.colorLightGrey,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 5
                    )
                  ]
              ),
              //color: AppColors.colorLightGrey1
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(AppImages.vendorImg, scale: 15,),
                        ),
                        SizedBox(width: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Lorem Ipsum", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                            SizedBox(height: 7,),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(AppImages.calenderImg),
                                    SizedBox(width: 5,),
                                    Text("22-03-2022", style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Row(
                                  children: [
                                    Image.asset(AppImages.clockImg),
                                    SizedBox(width: 5,),
                                    Text("2:00 PM", style: TextStyle(fontSize: 12))
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 7,),
                            Text("Status - Done", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                          ],
                        )
                      ],
                    ),
                    //SizedBox(height: 10,),

                    Image.asset(AppImages.rightArrowImg)
                  ],
                ),
              ),
            ),
          );
        });
  }
}