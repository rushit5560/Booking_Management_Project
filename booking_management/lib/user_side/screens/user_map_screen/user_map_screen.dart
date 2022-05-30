import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/screens/user_map_screen/user_map_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/enums.dart';
import '../../controllers/user_map_screen_controller/user_map_screen_controller.dart';



class UserMapScreen extends StatelessWidget {
  UserMapScreen({Key? key}) : super(key: key);
  final userMapScreenController = Get.put(UserMapScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> userMapScreenController.isLoading.value
        ? const CustomCircularLoaderModule()
        : SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonAppBarModule(
                title: "Location",
                appBarOption: AppBarOption.singleBackButtonOption,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  child: GoogleMapView(),
                ).commonAllSidePadding(10),
              ),
              const SizedBox(height: 20),
              // const GetDirectionButtonModule(),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
