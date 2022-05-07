import 'dart:developer';

import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';

import '../../../common_modules/constants/app_images.dart';


class CategoryListModule extends StatelessWidget {
  const CategoryListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, i) {
        return _categoryListModule();
      },
    ).commonAllSidePadding(10);
  }

  Widget _categoryListModule() {
    return GestureDetector(
      onTap: () {
        log("Category Name");
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.vendorImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ).commonAllSidePadding(10),
            ),
            const Expanded(
              flex: 25,
              child: Center(
                child: Text(
                  "Category Name",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ).commonAllSidePadding(5),
    );
  }

}
