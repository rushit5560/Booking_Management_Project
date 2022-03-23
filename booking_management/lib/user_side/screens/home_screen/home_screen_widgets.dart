import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../controllers/home_screen_controller/home_screen_controller.dart';

HomeScreenController screenController = Get.find<HomeScreenController>();

class HeaderModule extends StatelessWidget {
  const HeaderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.25,
      child: Stack(
        children: [
          Container(
            height: Get.height * 0.25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.shapeImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.headerLogoImg),
                scale: 0.9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchCategoryField extends StatelessWidget {
  const SearchCategoryField({Key? key}) : super(key: key);

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

class SearchLocationField extends StatelessWidget {
  const SearchLocationField({Key? key}) : super(key: key);

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
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class UpcomingAppointmentModule extends StatelessWidget {
  const UpcomingAppointmentModule({Key? key}) : super(key: key);

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
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return Container(
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
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                image: AssetImage(AppImages.vendorImg),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Lorem Ipsum',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Lorem Ipsum dummy Text for Printing asasa asa ',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.rightArrowImg),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class FavouriteDoctorsModule extends StatelessWidget {
  const FavouriteDoctorsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Favourites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 130,
          child: GridView.builder(
            itemCount: 4,
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
              return Container(
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
                          image: const DecorationImage(
                            image: AssetImage(AppImages.vendorImg),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            'Dr. John Doe',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                            ),
                          ),
                          Text(
                            'Lorem Ipsum',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ).commonAllSidePadding(5),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
