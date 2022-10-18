import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/user_side/screens/user_map_screen/user_map_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/field_validation.dart';
import '../../../firebase_database/firebase_database.dart';
import '../../controllers/business_details_screen_controller/business_details_screen_controller.dart';
import '../../model/user_business_details_model/get_business_hours_model.dart';
import '../book_appointment_screen/book_appointment_screen.dart';
import '../user_conversation_screen/user_conversation_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileModule extends StatelessWidget {
  ProfileModule({Key? key}) : super(key: key);
  final screenController = Get.find<BusinessDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    String imgUrl = ApiUrl.apiImagePath +
        screenController.vendorDetailsData!.vendor!.businessLogo;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Image.network(
        imgUrl,
        errorBuilder: (context, st, ob) {
          return Image.asset(AppImages.logoImg);
        },
        fit: BoxFit.cover,
      ),
    );
  }
}

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
          margin: const EdgeInsets.only(top: 15, left: 20),
          child: Image.asset(AppImages.backArrowImg)),
    );
  }
}

class TabViewModule extends StatelessWidget {
  TabViewModule({Key? key}) : super(key: key);

  final screenController = Get.find<BusinessDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              screenController.isOverviewSelected.value = true;
              screenController.isReviewSelected.value = false;
              log('overview : ${screenController.isOverviewSelected.value}');
              log('Review : ${screenController.isReviewSelected.value}');
            },
            child: Container(
              width: Get.width / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.colorLightGrey,
                      blurRadius: 5,
                      //spreadRadius: 3,
                      blurStyle: BlurStyle.outer)
                ],
                // border: Border.all(
                //     color: AppColors.colorLightGrey,
                //     width: 2
                // ),
                color: screenController.isOverviewSelected.value
                    ? AppColors.colorLightGrey2
                    : Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
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
              screenController.reviewFieldController.clear();
              screenController.selectRating.value = 1;
              log('Review : ${screenController.isReviewSelected.value}');
              log('Overview : ${screenController.isOverviewSelected.value}');
            },
            child: Container(
              width: Get.width / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.colorLightGrey,
                      blurRadius: 5,
                      //spreadRadius: 3,
                      blurStyle: BlurStyle.outer)
                ],
                // border: Border.all(
                //     color: AppColors.colorLightGrey,
                //     width: 2
                // ),
                color: screenController.isReviewSelected.value
                    ? AppColors.colorLightGrey2
                    : Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: Center(
                  child: Text(
                    'Reviews',
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
  OverviewModule({Key? key}) : super(key: key);
  final screenController = Get.find<BusinessDetailsScreenController>();
  final FirebaseDatabase firebaseDatabase = FirebaseDatabase();

  @override
  Widget build(BuildContext context) {
    log('overview1: ${screenController.isOverviewSelected.value}');
    log('review1: ${screenController.isReviewSelected.value}');
    return Obx(() => screenController.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 10),
                  vendorName(),
                  // const SizedBox(height: 10),
                  ratting(),
                  // const SizedBox(height: 10),
                  description(),
                  const SizedBox(height: 10),
                  priceAndLocation(),
                  const SizedBox(height: 10),
                  viewMapButtonModule(),
                  // const SizedBox(height: 8),
                  // serviceDropDown(context),
                  //SizedBox(height: 25,),
                  //ReviewTextFieldAndButtonModule(),
                  const SizedBox(height: 5),
                  // resourcesList(),
                  businessHoursModule(),

                  const SizedBox(height: 10),
                  bookAppointmentButtonModule(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            //)
          ));
  }

  Widget vendorName() {
    return Text(
      screenController.vendorDetailsData!.vendor!.businessName.isNotEmpty
          ? screenController.vendorDetailsData!.vendor!.businessName
          : "Abc",
      style: const TextStyle(
          color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),
    );
  }

  Widget ratting() {
    // double rating = double.parse(screenController.vendorDetailsData!.ratting.toString());
    return Row(
      children: [
        Text(
          screenController.vendorDetailsData!.ratting.toString().isNotEmpty
              ? screenController.vendorDetailsData!.ratting.toString()
              : "0",
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 4),
        RatingBar.builder(
          initialRating:
              screenController.vendorDetailsData!.ratting!.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 25,
          ignoreGestures: true,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            if (kDebugMode) {
              print(rating);
            }
          },
        ),
        Expanded(child: Container()),
        IconButton(
          onPressed: () async {
            if (UserDetails.isUserLoggedIn == true) {
              screenController.isFavourite.value =
                  !screenController.isFavourite.value;
              await screenController.addVendorInFavoriteFunction();
            } else {
              Get.to(() => SignInScreen(), transition: Transition.zoom);
            }
            // screenController.loadUI();
          },
          icon: Icon(screenController.isFavourite.value == true
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded),
          color: screenController.isFavourite.value == true
              ? Colors.red
              : Colors.grey,
        ),
      ],
    );
  }

  Widget description() {
    return Text(
      screenController.vendorDetailsData!.description!.isNotEmpty
          ? screenController.vendorDetailsData!.description!
          : "Lorem Ipsum",
      style: const TextStyle(fontSize: 13, color: Colors.black),
    );
  }

  Widget priceAndLocation() {
    return Column(
      children: [
        /*Row(
          children: [
            const Expanded(
                flex: 1,
                child: Text(
                  "Price -",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
            Expanded(
                flex: 3,
                child: Text("Rs." + screenController.price.toString() + "/Day",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)))
          ],
        ),*/
        // const SizedBox(height: 15),
        Row(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    String phoneNo =
                        screenController.vendorDetailsData!.vendor!.phoneNo;

                    String url = "tel:$phoneNo";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.colorLightGrey,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 5,
                          ),
                        ]),
                    child: Center(
                      child: Image.asset(AppImages.callingImg),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  screenController.vendorDetailsData!.vendor!.phoneNo.isNotEmpty
                      ? screenController.vendorDetailsData!.vendor!.phoneNo
                      : "1234567890",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(width: 25),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (UserDetails.isUserLoggedIn == true) {
                      Timestamp timeStamp = Timestamp.now();

                      /// CharRoom Id Generate
                      String charRoomId =
                          "${UserDetails.uniqueId}_${screenController.vendorUniqueId}";

                      /// ChatRoom Data
                      Map<String, dynamic> chatRoomData = {
                        "createdAt": timeStamp,
                        "createdBy": UserDetails.email.toLowerCase(),
                        "peerId": screenController.vendorEmail.toLowerCase(),
                        "roomId": charRoomId,
                        "createdName": UserDetails.userName,
                        "peerName": screenController.vendorBusinessName,
                        "users": [
                          UserDetails.email,
                          screenController.vendorEmail
                        ],
                        "customerid": UserDetails.uniqueId,
                        "vendorid": screenController.vendorUniqueId
                      };

                      log("chatRoomData : $chatRoomData");

                      /// Create ChatRoom Function
                      firebaseDatabase.createChatRoomOfTwoUsers(
                          charRoomId, chatRoomData);

                      Get.to(
                        () => UserConversationScreen(),
                        transition: Transition.zoom,
                        arguments: [
                          charRoomId,
                          screenController.vendorEmail,
                          screenController.vendorBusinessName,
                          screenController.vendorUniqueId,
                          screenController.vendorId.toString(),
                          screenController.vendorEmail,
                        ],
                      );
                    } else {
                      Get.to(() => SignInScreen(), transition: Transition.zoom);
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.colorLightGrey,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 5,
                          ),
                        ]),
                    child: Center(
                      child: Image.asset(AppImages.msgImg),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  "Chat with us",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
                flex: 1,
                child: Text(
                  "Location -",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            Expanded(
                flex: 3,
                child: Text(screenController.vendorDetailsData!.vendor!.address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black)))
          ],
        ),
      ],
    );
  }

  Widget viewMapButtonModule() {
    return GestureDetector(
      onTap: () {
        if (screenController.vendorDetailsData!.vendor!.latitude.isEmpty ||
            screenController.vendorDetailsData!.vendor!.longitude.isEmpty) {
          Fluttertoast.showToast(
              msg: "Vendor has not provided his location details.");
        } else {
          Get.to(
            () => UserMapScreen(),
            arguments: [
              screenController.vendorDetailsData!.vendor!.latitude,
              screenController.vendorDetailsData!.vendor!.longitude,
            ],
          );
        }
      },
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ]),
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

  /*Widget serviceDropDown(context) {
    return Row(
      children: [
        Text(
          "Service -",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          width: 20,
        ),
        Obx(
          () => Container(
            width: Get.width / 2.5,
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
                    alignedDropdown:
                        true, //If false (the default), then the dropdown's menu will be wider than its button.
                  )),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: Image.asset(
                    AppImages.dropDownArrowImg,
                    scale: 2,
                    color: Colors.black,
                  ),
                  isExpanded: true,
                  focusColor: Colors.white,
                  value: screenController.service.value,
                  //elevation: 5,
                  style: TextStyle(color: AppColors.colorLightGrey),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    //'Service'
                    'Daily Checkup',
                    'Daily Checkup1',
                    'Daily Checkup2'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Daily Checkup",
                    style: TextStyle(color: Colors.black),
                  ),
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
  }*/

  Widget bookAppointmentButtonModule() {
    return GestureDetector(
      onTap: () {
        Get.to(() => BookAppointmentScreen(),
            arguments: screenController.vendorId);
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
              ]),
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

  Widget resourcesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Resources -",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        const SizedBox(height: 30),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                    bottom: 15, left: 3, right: 3, top: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.colorLightGrey,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 5)
                    ]),
                //color: AppColors.colorLightGrey1
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(AppImages.vendorImg),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Lorem Ipsum",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Lorem Ipsum is simply dummy text of the following",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      //SizedBox(height: 10,),

                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => BookAppointmentScreen());
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
                                    ]),
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

  Widget businessHoursModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Business Hours",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          itemCount: screenController.businessHoursList.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            BusinessHoursDatum singleItem =
                screenController.businessHoursList[i];
            return Row(
              children: [
                Expanded(
                  child: Text(
                    singleItem.day,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(singleItem.startTime),
                      const Text(' - '),
                      Text(singleItem.endTime),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ReviewModule extends StatelessWidget {
  ReviewModule({Key? key}) : super(key: key);
  final screenController = Get.find<BusinessDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    // log('overview1: ${screenController.isOverviewSelected.value}');
    // log('review1: ${screenController.isReviewSelected.value}');
    return Obx(
      () => screenController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserDetails.isUserLoggedIn == true
                        ? ratting()
                        : Container(),
                    UserDetails.isUserLoggedIn == true
                        ? const SizedBox(height: 20)
                        : Container(),
                    UserDetails.isUserLoggedIn == true
                        ? reviewTextFieldAndButtonModule()
                        : Container(),
                    const SizedBox(height: 20),
                    showReviewList(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget ratting() {
    return Column(
      children: [
        Text(
          screenController.selectRating.toString(),
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        RatingBar.builder(
          initialRating:
              double.parse(screenController.selectRating.value.toString()),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemSize: 35,
          glow: false,
          //itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            screenController.selectRating.value = rating.toInt();
          },
        )
      ],
    );
  }

  Widget reviewTextFieldAndButtonModule() {
    var oulineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.colorGreyIconDark,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    );
    return Form(
      key: screenController.reviewFormKey,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextFormField(
              controller: screenController.reviewFieldController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 100,
              validator: (value) => FieldValidator().validateReview(value!),
              decoration: InputDecoration(
                hintText: "Add Review",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: oulineInputBorder,
                focusedBorder: oulineInputBorder,
                errorBorder: oulineInputBorder,
                focusedErrorBorder: oulineInputBorder,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () async {
                // if(screenController.reviewFormKey.currentState!.validate()){
                // screenController.addReview();
                // }
                if (screenController.reviewFieldController.text
                    .trim()
                    .isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Enter your valuable comments for review.");
                } else {
                  await screenController.addCustomerReviewFunction();
                  screenController.reviewFieldController.clear();
                }
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
                    ]),
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

  Widget showReviewList() {
    return screenController.reviewList.isEmpty
        ? const Center(child: Text('Vendor has no reviews.'))
        : ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: screenController.reviewList.length,
            itemBuilder: (context, index) {
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
                        child: Image.network(
                          AppImages.vendorImg,
                          scale: 20,
                        ),
                        //child: Image.network(screenController.reviewList[index].customer.image),
                      ),*/
                          // const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  screenController.reviewList[index].customer
                                      .userName.capitalizeFirst
                                      .toString(),
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 5,
                                      minRating: 1,
                                      ignoreGestures: true,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,

                                      itemCount: screenController
                                          .reviewList[index].ratting,
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
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Text(
                                        screenController.reviewList[index].date,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        screenController.reviewList[index].description,
                        maxLines: null,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              );
            });
  }
}
