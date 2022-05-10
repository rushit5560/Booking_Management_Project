import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/choose_court_screen/choose_court_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/container_decorations.dart';
import '../../controllers/vendor_resources_screen_controller/vendor_resources_screen_controller.dart';

class VendorResourcesListModule extends StatelessWidget {
  VendorResourcesListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorResourcesScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i){
        return GestureDetector(
          onTap: (){
            Get.to(() => ChooseCourtScreen());
          },
          child: Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: shadowDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.vendorImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
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
                          'Lorem Ipsum is dummy text of the printng.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).commonSymmetricPadding(vertical: 5),
            ),
          ).commonSymmetricPadding(vertical: 10),
        );
      },
    );
  }
}
