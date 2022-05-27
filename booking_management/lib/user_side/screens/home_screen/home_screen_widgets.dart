import 'dart:developer';
import 'package:booking_management/common_modules/common_functions.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/screens/user_search_results_screen/user_search_results_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/constants/enums.dart';
import '../../controllers/home_screen_controller/home_screen_controller.dart';
import '../../model/home_screen_models/get_all_appointment_list_model.dart';
import '../../model/home_screen_models/get_all_category_model.dart';
import '../../model/home_screen_models/get_favourite_vendor_model.dart';
import 'upcoming_appointment_details_screen/upcoming_appointment_details_screen.dart';


/// Header Logo Module
class HeaderModule extends StatelessWidget {
  const HeaderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.15,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: Get.height * 0.15,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.shapeImg),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.07,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.headerLogoImg),
                scale: 0.9,
              ),
            ),
          ),

          Positioned(
            top: 10,
            left: 10,
            child: GestureDetector(
              onTap: () {
                log("Clk");
                // Scaffold.of(context).openDrawer();
                Scaffold.of(context).openDrawer();
              },
              child: Icon(
                Icons.menu_rounded,
                color: Colors.grey.shade600,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Search Field (Category & Name)
class SearchCategoryField extends StatelessWidget {
  SearchCategoryField({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
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
        decoration: const InputDecoration(
          hintText: 'Search category or Name',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          prefixIcon: Icon(
              Icons.search_rounded,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

/// Search Location Wise
class SearchLocationField extends StatelessWidget {
  SearchLocationField({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
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
        controller: screenController.locationFieldController,
        cursorColor: Colors.grey,
        decoration: const InputDecoration(
          hintText: 'Search Location',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

/// Search Button
class SearchButtonModule extends StatelessWidget {
  SearchButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if(screenController.categoryFieldController.text.isNotEmpty) {
        Get.to(() => UserSearchResultsScreen(),
          arguments: [
            screenController.categoryFieldController.text,
            screenController.locationFieldController.text,
            SearchType.none,
          ],
        );
        hideKeyboard();
        // }
      },
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
            padding: EdgeInsets.all(12),
            child: Text(
              'Search',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/// Upcoming Appointment
class UpcomingAppointmentModule extends StatelessWidget {
  UpcomingAppointmentModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming Appointment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),

        ListView.builder(
          itemCount: screenController.allUpcomingAppointmentList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            UpcomingAppointmentDatum singleItem = screenController.allUpcomingAppointmentList[i];
            return _upcomingAppointmentListTile(singleItem);
          },
        ),
      ],
    );
  }

  Widget _upcomingAppointmentListTile(UpcomingAppointmentDatum singleItem) {

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  /*Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.vendorImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),*/
                  // const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          singleItem.bookingFor,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          singleItem.startDateTime,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                await screenController.getUpcomingAppointmentDetailsFunction(id: singleItem.id);
                Get.to(()=> UpcomingAppointmentDetailsScreen(), transition: Transition.zoom);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.rightArrowImg),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

/// All Category List
class PartialCategoryListModule extends StatelessWidget {
  PartialCategoryListModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: GridView.builder(
            itemCount: screenController.allCategoryList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, i) {
              CategoryDatum singleItem = screenController.allCategoryList[i];
              return _categoryListModule(singleItem);
            },
          ),
        ),
      ],
    );
  }

  Widget _categoryListModule(CategoryDatum singleItem) {
    // String imgUrl = ApiUrl.apiMainPath + singleItem.image;
    return GestureDetector(
      onTap: () {
        Get.to(
          () => UserSearchResultsScreen(),
          transition: Transition.zoom,
          arguments: [
            singleItem.id.toString(),
            "",
            SearchType.categoryWise,
          ],
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 75,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(singleItem.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ).commonAllSidePadding(10),
            ),
            Expanded(
              flex: 25,
              child: Center(
                child: Text(
                  singleItem.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ).commonAllSidePadding(5),
    );
  }

}

/// Favourite Vendor List
class FavouriteDoctorsModule extends StatelessWidget {
  FavouriteDoctorsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Favourites Vendor',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 130,
          child: GridView.builder(
            itemCount: screenController.favouriteVendorList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, i) {
              FavouriteVendorDetails singleVendor = screenController.favouriteVendorList[i];
              return _favouriteVendorListTile(singleVendor);
            },
          ),
        ),
      ],
    );
  }

  Widget _favouriteVendorListTile(FavouriteVendorDetails singleVendor) {
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
      child: Column(
        children: [
          Expanded(
            flex: 60,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(singleVendor.businessLogo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  singleVendor.businessName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                  ),
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
    );
  }

}



