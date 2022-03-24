import 'package:booking_management/user_side/controllers/business_details_screen_controller/business_details_screen_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/field_validation.dart';
import '../book_appointment_screen/book_appointment_screen.dart';

BusinessDetailsScreenController screenController = Get.find<BusinessDetailsScreenController>();

class ProfileModule extends StatelessWidget {
  const ProfileModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Image.asset(AppImages.vendorImg, scale: 2.5,)
    );
  }
}

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
          margin: const EdgeInsets.only(top: 15, left: 20),
          child: Image.asset(AppImages.backArrowImg)),
    );
  }
}

class TabViewModule extends StatelessWidget {
  const TabViewModule({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              screenController.isOverviewSelected.value = true;
              screenController.isReviewSelected.value = false;
            },
            child: Container(
              width: Get.width/4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 5,
                    //spreadRadius: 3,
                    blurStyle: BlurStyle.outer
                  )
                ],
                // border: Border.all(
                //     color: AppColors.colorLightGrey,
                //     width: 2
                // ),
                color: screenController.isOverviewSelected.value ? AppColors.colorLightGrey2 : Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric( vertical: 12),
                child: Center(
                  child: Text(
                    'Overview',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          GestureDetector(
            onTap: () {
              screenController.isOverviewSelected.value = false;
              screenController.isReviewSelected.value = true;
            },
            child: Container(
              width: Get.width/4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.colorLightGrey,
                      blurRadius: 5,
                      //spreadRadius: 3,
                      blurStyle: BlurStyle.outer
                  )
                ],
                // border: Border.all(
                //     color: AppColors.colorLightGrey,
                //     width: 2
                // ),
                color: screenController.isReviewSelected.value ? AppColors.colorLightGrey2 : Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: Center(
                  child: Text(
                    'Review',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OverviewModule extends StatelessWidget {
  const OverviewModule ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vendorName(),
            const SizedBox(height: 10,),
            ratting(),
            const SizedBox(height: 10,),
            description(),
            const SizedBox(height: 20,),
            priceAndLocation(),
            const SizedBox(height: 25,),
            viewMapButtonModule(),
            //SizedBox(height: 25,),
            //ReviewTextFieldAndButtonModule(),
            const SizedBox(height: 40,),
            bookAppointmentButtonModule()
          ],
        ),
      )
    );
  }

  Widget vendorName(){
    return const Text("Lorem Ipsum", style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),);
  }

  Widget ratting(){
    return Row(
      children: [
        const Text("4.5", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
        const SizedBox(width: 4,),
        RatingBar.builder(
          initialRating: 5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 28,
          //itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
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
    );
  }

  Widget description(){
    return const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
      style: TextStyle(fontSize: 13, color: Colors.black),);
  }

   Widget priceAndLocation(){
     return Column(
       children: [
         Row(
           children: const [
             Expanded(
                 flex: 1,
                 child: Text("Price -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
             Expanded(
                 flex: 3,
                 child: Text("\$20 - \$30/Day", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)))
           ],
         ),
         const SizedBox(height: 15,),
         Row(
           children: const [
             Expanded(
                 flex: 1,
                 child: Text("Location -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
             Expanded(
                 flex: 3,
                 child: Text("1156, Lorem Soc. simply dummy text of the printing scram printer",
                     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)))
           ],
         ),
       ],
     );
   }

    Widget viewMapButtonModule(){
      return GestureDetector(
        onTap: () {

        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey.shade300,
                  blurStyle: BlurStyle.outer,
                ),
              ]
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
              'View Map',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      );
    }

    Widget bookAppointmentButtonModule(){
      return GestureDetector(
        onTap: () {
          Get.to(() => BookAppointMentScreen());
        },
        child: Container(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 5,
                    color: Colors.grey.shade300,
                    blurStyle: BlurStyle.outer,
                  ),
                ]
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'BOOK APPOINTMENT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      );
    }
}

class ReviewModule extends StatelessWidget {
  const ReviewModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ratting(),
            const SizedBox(height: 20,),
            reviewTextFieldAndButtonModule(),
            const SizedBox(height: 20,),
            showReviewList()
          ],
        ),
      ),
    );
  }

  Widget ratting(){
    return Column(
      children: [
        const Text("4.5", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
        const SizedBox(height: 5,),
        RatingBar.builder(
          initialRating: 5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 45,
          //itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
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
    );
  }

  Widget reviewTextFieldAndButtonModule(){
    return Form(
      key: screenController.reviewFormKey,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child:  TextFormField(
              controller: screenController.reviewFieldController,
              keyboardType: TextInputType.text,
              validator: (value) => FieldValidator().validateReview(value!),
              decoration: const InputDecoration(
                hintText: "Add Review",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                errorBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              ),
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                if(screenController.reviewFormKey.currentState!.validate()){}
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 3,
                        blurRadius: 5,
                        color: Colors.grey.shade300,
                        blurStyle: BlurStyle.outer,
                      ),
                    ]
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'SEND',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget showReviewList(){
    return ListView.builder(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
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
                      ),
                      const SizedBox(width: 10,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Mr. John Doe", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
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
                              if (kDebugMode) {
                                print(rating);
                              }
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),

                  const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                ],
              ),
            ),
          );
    });
  }

}

