import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/app_images.dart';

class HeaderLogoModule extends StatelessWidget {
  const HeaderLogoModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.headerLogoImg,
      height: Get.height * 0.10,
      scale: 0.9,
    );
  }
}

class HeaderTextModule extends StatelessWidget {
  final String name;
  const HeaderTextModule({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }
}
