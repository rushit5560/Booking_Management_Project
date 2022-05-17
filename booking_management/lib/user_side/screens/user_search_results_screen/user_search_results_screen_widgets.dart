import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/user_side/controllers/user_search_results_screen_controller/user_search_results_screen_controller.dart';
import 'package:booking_management/user_side/screens/business_details_screen/business_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/api_url.dart';
import '../../model/user_search_results_screen_model/get_all_search_vendor_model.dart';



class SearchCategoryTextField extends StatelessWidget {
  SearchCategoryTextField({Key? key}) : super(key: key);
  final screenController = Get.find<UserSearchResultsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 8,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: TextFormField(
        controller: screenController.categoryFieldController,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Search category or Name',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

/*class SearchLocationTextField extends StatelessWidget {
  const SearchLocationTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 8,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: TextFormField(
        //controller: screenController.categoryFieldController,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Search Location',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}*/

class PopularSearchAndDistance extends StatefulWidget {
  const PopularSearchAndDistance({Key? key}) : super(key: key);

  @override
  State<PopularSearchAndDistance> createState() => _PopularSearchAndDistanceState();
}
class _PopularSearchAndDistanceState extends State<PopularSearchAndDistance> {
  final screenController = Get.find<UserSearchResultsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: Container(
        //     height: 45,
        //     //padding: EdgeInsets.all(3),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       boxShadow: [
        //         BoxShadow(
        //           color: AppColors.colorLightGrey.withOpacity(0.5),
        //           blurRadius: 5,
        //           //spreadRadius: 5,
        //           blurStyle: BlurStyle.outer,
        //         ),
        //       ],
        //       //border: Border.all(color: AppColors.colorLightGrey)
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         SizedBox(width: 17,),
        //         Expanded(child: Text("Popular Search", style: TextStyle(fontSize: 12),)),
        //
        //       ],
        //     ),
        //   ),
        // ),

        const SizedBox(width: 10),
        Expanded(
          child:Container(
            padding: const EdgeInsets.only(right: 3),
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
                  icon: Image.asset(AppImages.dropDownArrowImg, scale: 3),
                  isExpanded: true,
                  focusColor: Colors.white,
                  value: screenController.ratting,
                  //elevation: 5,
                  style: TextStyle(color: AppColors.colorLightGrey),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                  ].
                  map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: AppColors.colorLightGrey),
                      ),
                    );
                  }).toList(),
                  hint: const Text("Ratting", style: TextStyle(color: Colors.black, fontSize: 11),),
                  onChanged: (newValue) async {
                    setState(() {
                      screenController.ratting = newValue!;
                    });
                    await screenController.getAllSearchVendorListRatingWiseFunction(
                      searchText: screenController.categoryFieldController.text,
                    );

                  },
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child:Container(
                padding: const EdgeInsets.only(right: 3),
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
                      icon: Image.asset(AppImages.dropDownArrowImg, scale: 3),
                      isExpanded: true,
                      focusColor: Colors.white,
                      value: screenController.distance,
                      //elevation: 5,
                      style: TextStyle(color: AppColors.colorLightGrey),
                      iconEnabledColor: Colors.black,
                      items: <String>[
                        '1',
                        '2',
                        '3',
                        '4','5'
                      ].
                      map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: AppColors.colorLightGrey),
                          ),
                        );
                      }).toList(),
                      hint: Text("Distance", style: TextStyle(color: Colors.black, fontSize: 11),),
                      onChanged: (newValue) {
                        setState(() {
                          screenController.distance = newValue!;
                        });

                      },
                    ),
                  ),
                ),
              ),
          ),
        const SizedBox(width: 10),
        Expanded(
            child:Container(
                  padding: const EdgeInsets.only(right: 3),
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
                        icon: Image.asset(AppImages.dropDownArrowImg, scale: 3,),
                        isExpanded: true,
                        focusColor: Colors.white,
                        value: screenController.date,
                        //elevation: 5,
                        style: TextStyle(color: AppColors.colorLightGrey),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          '1',
                          '2',
                          '3',
                          '4','5'
                        ].
                        map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: AppColors.colorLightGrey),
                            ),
                          );
                        }).toList(),
                        hint: const Text("Date", style: TextStyle(color: Colors.black, fontSize: 11),),
                        onChanged: (newValue) {
                          setState(() {
                            screenController.date = newValue!;
                          });

                        },
                      ),
                    ),
                  ),
                ),
        ),

      ],
    );
  }
}

class BusinessListModule extends StatelessWidget {
  BusinessListModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserSearchResultsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Business", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),

        const SizedBox(height: 20,),

        ListView.builder(
          itemCount: screenController.searchVendorList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index){
              SearchVendorDatum singleItem = screenController.searchVendorList[index];
              return _vendorListTile(singleItem);
            })
      ],
    );
  }

  Widget _vendorListTile(SearchVendorDatum singleItem) {
    String imgUrl = ApiUrl.apiMainPath + singleItem.businessLogo;
    return GestureDetector(
        onTap: () {
            Get.to(()=> BusinessDetailScreen(),
            arguments: singleItem.id);
          },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.colorLightGrey.withOpacity(0.5),
              blurRadius: 5,
              //spreadRadius: 5,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(AppImages.vendorImg),
                                ),
                              ),
                              SizedBox(width: 15,),

                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Lorem Ipsum", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                                    Row(
                                      children: [
                                        Text("4.5", style: TextStyle(fontSize: 12),),
                                        SizedBox(width: 5,),
                                        RatingBar.builder(
                                          initialRating: 5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20,
                                          //itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                          itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            // if (kDebugMode) {
                                            //   print(rating);
                                            // }
                                          },
                                        )

                                      ],
                                    ),
                                    Text("Lorem Ipsum is simply dummy text of the printing", maxLines: 1),

                                    Text("Location - 1156, Lorem Soc. simply dummy text of the printing", maxLines: 1,
                                    style: TextStyle(fontWeight: FontWeight.w500),),


                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.asset(AppImages.rightArrowImg),
                        )*/
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(imgUrl),
                ),
              ),
              const SizedBox(width: 7),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          // flex:3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                singleItem.businessName,
                                style: const TextStyle(fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Row(
                                children: [
                                  Text(
                                    singleItem.rating.toString(),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(width: 5),
                                  RatingBar.builder(
                                    initialRating: double.parse(singleItem.rating.toString()),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    ignoreGestures: true,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  )

                                ],
                              ),

                              const SizedBox(height: 3),
                              Text("Location - ${singleItem.address}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Row(
                                children: [
                                  Expanded(
                                    flex:1,
                                    child: Container(
                                      height:10, width: 10,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: singleItem.workingHoursStatus == "Close"
                                          ? Colors.red
                                          : Colors.green
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                      flex: 20,
                                      child: Text(
                                        singleItem.workingHoursStatus == "Close"
                                        ? "Close"
                                        : "Open",
                                        maxLines: 1, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),))
                                ],
                              ),

                            ],
                          ),
                        ),
                        // Expanded(
                        //   flex: 1,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Get.to(()=> BusinessDetailScreen(),
                        //       arguments: singleItem.id);
                        //     },
                        //       child: Image.asset(AppImages.rightArrowImg),
                        //   ),
                        // ),
                      ],
                    ),

                    /*Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Container(
                                  height:8, width: 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Expanded(
                                  flex: 20,
                                  child: Text("Open - Available Time 08.30 AM",maxLines: 1, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),))
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text("0.5 km away", style: TextStyle(
                              fontSize: 12
                          ),),
                        )
                      ],
                    ),*/

                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  // spreadRadius: 3,
                                  blurRadius: 5,
                                  color: Colors.grey.shade300,
                                  blurStyle: BlurStyle.outer,
                                ),
                              ]),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'BOOK APPOINTMENT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}


