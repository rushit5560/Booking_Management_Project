import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:flutter/material.dart';

BoxDecoration shadowDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        spreadRadius: 3,
        blurRadius: 5,
        color: AppColors.colorGreyIconLight.withOpacity(0.65),
        blurStyle: BlurStyle.outer,
      ),
    ],
  );
}
