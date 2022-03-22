import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/app_images.dart';

class HeaderLogoModule extends StatelessWidget {
  const HeaderLogoModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.10,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.headerLogoImg),
        ),
      ),
    );
  }
}
