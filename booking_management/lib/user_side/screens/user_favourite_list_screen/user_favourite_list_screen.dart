import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/custom_appbar/custom_appbar.dart';
import '../../controllers/user_favourite_list_screen_controller/user_favourite_list_screen_controller.dart';
import '../../model/home_screen_models/get_favourite_vendor_model.dart';

class UserFavouriteListScreen extends StatelessWidget {
  UserFavouriteListScreen({Key? key}) : super(key: key);
  final userFavouriteListScreenController =
      Get.put(UserFavouriteListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => userFavouriteListScreenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : SafeArea(
                child: Column(
                  children: [
                    const CommonAppBarModule(
                      title: "Favorites",
                      appBarOption: AppBarOption.singleBackButtonOption,
                    ),
                    Expanded(
                      child: userFavouriteListScreenController
                          .favouriteVendorList.isEmpty
                      ? const Center(
                        child: Text("No Favourite Vendor"),
                      )
                      : GridView.builder(
                        itemCount: userFavouriteListScreenController
                            .favouriteVendorList.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.1,
                        ),
                        itemBuilder: (context, i) {
                          FavouriteVendorDetails singleVendor =
                              userFavouriteListScreenController
                                  .favouriteVendorList[i];
                          return _favouriteVendorListTile(singleVendor);
                        },
                      ).commonAllSidePadding(10),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _favouriteVendorListTile(FavouriteVendorDetails singleVendor) {
    String imgUrl = ApiUrl.apiImagePath + singleVendor.businessLogo;
    return Container(
      margin: const EdgeInsets.only(bottom: 3, top: 3, left: 3, right: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 5,
            color: Colors.grey.shade400,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              Expanded(
                flex: 70,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // image: DecorationImage(
                    //   image: NetworkImage(imgUrl),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Image.network(imgUrl,
                    errorBuilder: (context, st, ob){
                      return Image.asset(AppImages.logoImg);
                    },),
                ),
              ),
              Expanded(
                flex: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      singleVendor.businessName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    /*Text(
                  'Lorem Ipsum',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),*/
                  ],
                ).commonAllSidePadding(5),
              ),
            ],
          ),
          Positioned(
            // top: 10,
            // right: 10,
            child: IconButton(
              onPressed: () async {
                await userFavouriteListScreenController.addVendorInFavoriteFunction(singleVendor.id);
                // screenController.loadUI();
              },
              icon: const Icon(Icons.favorite_rounded),
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
