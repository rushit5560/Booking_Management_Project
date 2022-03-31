import 'package:booking_management/user_side/controllers/business_details_screen_controller/business_details_screen_controller.dart';
import 'package:booking_management/user_side/model/user_business_details_model/user_business_details_model.dart';
import 'package:booking_management/user_side/screens/user_checkout_screen/user_checkout_screen.dart';
import 'package:booking_management/user_side/screens/user_map_screen/user_map_screen.dart';
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
  //OverviewModule ({Key? key}) : super(key: key);

  UserBusinessDetailsModel ? userBusinessDetailsModel;
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
                const SizedBox(height: 25,),
                serviceDropDown(context),
                //SizedBox(height: 25,),
                //ReviewTextFieldAndButtonModule(),
                const SizedBox(height: 40,),
                resourcesList()
                //bookAppointmentButtonModule()
              ],
            )
        ),
    );
  }

  Widget vendorName(){
    return Text(screenController.businessName.isNotEmpty ? screenController.businessName : "123",
      style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold));
  }

  Widget ratting(){
    return Row(
      children: [
        Text(screenController.ratting.toString().isNotEmpty ? screenController.ratting.toString() : "4",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
        const SizedBox(width: 4,),
        RatingBar.builder(
          initialRating: 5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: screenController.ratting,
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
    return Text(screenController.description.isNotEmpty ? screenController.description : "Lorem Ipsum",
      style: TextStyle(fontSize: 13, color: Colors.black),);
  }

   Widget priceAndLocation(){
     return Column(
       children: [
         Row(
           children: [
             const Expanded(
                 flex: 1,
                 child: Text("Price -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
             Expanded(
                 flex: 3,
                 child: Text("Rs." +  screenController.price.toString()  + "/Day", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)))
           ],
         ),
         const SizedBox(height: 15,),

         Row(
           children: [
             Row(
               children: [
                 Container(
                   height: 40, width: 40,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     boxShadow: [
                       BoxShadow(
                         color: AppColors.colorLightGrey,
                         blurStyle: BlurStyle.outer,
                         blurRadius: 5
                       )
                     ]
                   ),
                   child: Center(
                     child: Image.asset(AppImages.callingImg),
                   ),
                 ),
                 SizedBox(width: 10,),
                 Text(screenController.mobileNo.isNotEmpty ? screenController.mobileNo : "1234567890", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),)
               ],
             ),
             SizedBox(width: 20,),
             Row(
               children: [
                 Container(
                   height: 40, width: 40,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       boxShadow: [
                         BoxShadow(
                             color: AppColors.colorLightGrey,
                             blurStyle: BlurStyle.outer,
                             blurRadius: 5
                         )
                       ]
                   ),
                   child: Center(
                     child: Image.asset(AppImages.msgImg),
                   ),
                 ),
                 SizedBox(width: 10,),
                 Text("Message", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),)
               ],
             ),
           ],
         ),

         const SizedBox(height: 15,),
         Row(
           children: [
             const Expanded(
                 flex: 1,
                 child: Text("Location -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
             Expanded(
                 flex: 3,
                 child: Text(screenController.address.isNotEmpty ? screenController.address : "1156, Lorem Soc. simply dummy text",
                     style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)))
           ],
         ),
       ],
     );
   }

    Widget viewMapButtonModule(){
      return GestureDetector(
        onTap: () {
          Get.to(()=> const UserMapScreen());
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

    Widget serviceDropDown(context){
      return Row(
        children: [
          Text("Service -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
          SizedBox(width: 20,),

          Obx(()=>
              Container(
                width: Get.width/2.5,
                padding: const EdgeInsets.only(right: 10),
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.colorLightGrey.withOpacity(0.5),
                      blurRadius: 5,
                      //spreadRadius: 5,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor: Colors.grey.shade100,
                      // background color for the dropdown items
                      buttonTheme: ButtonTheme.of(context).copyWith(
                        alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: Image.asset(AppImages.dropDownArrowImg, scale: 2, color: Colors.black,),
                      isExpanded: true,
                      focusColor: Colors.white,
                      value: screenController.service.value,
                      //elevation: 5,
                      style: TextStyle(color: AppColors.colorLightGrey),
                      iconEnabledColor: Colors.black,
                      items: <String>[
                        'Daily Checkup',
                        'Daily Checkup1',
                        'Daily Checkup2'
                      ].
                      map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: Text("Daily Checkup", style: TextStyle(color: Colors.black),),
                      onChanged: (newValue) {
                        screenController.service.value = newValue!;
                      },
                    ),
                  ),
                ),
              ),
          )
        ],
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

    Widget resourcesList(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Resources -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
          SizedBox(height: 30,),

          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(bottom: 15, left: 3, right: 3, top: 3),
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
                        Expanded(
                          flex:3,
                          child: Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(AppImages.vendorImg),
                                ),
                              ),
                              SizedBox(width: 15,),

                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Lorem Ipsum", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(height: 7,),
                                    Text("Lorem Ipsum is simply dummy text of the following", maxLines: 1, style: TextStyle(fontSize: 11,),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        //SizedBox(height: 10,),

                        Expanded(
                            flex:1,
                            child: GestureDetector(
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
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Book',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              })
        ],
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


