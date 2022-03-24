
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/user_side/screens/user_map_screen/user_map_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserMapScreen extends StatelessWidget {
  const UserMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [


                  ClipRRect(
                      borderRadius: BorderRadius.only(bottomRight: const Radius.circular(30), bottomLeft: Radius.circular(30)),
                      child: GoogleMapView()),

                  Container(
                    height: 55,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25)),
                        color: Colors.white
                      //color: Colors.grey
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AppImages.backArrowImg),
                          const Text(
                            "Map",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 50,
                            width: 50,
                          )
                        ],
                      ),
                    ),
                  )
                  //CommonAppBarModule(title: "Map", appBarOption: AppBarOption.singleBackButtonOption),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const GetDirectionButtonModule(),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
