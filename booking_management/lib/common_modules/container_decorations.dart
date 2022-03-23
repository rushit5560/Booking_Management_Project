import 'package:flutter/material.dart';

BoxDecoration shadowDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        spreadRadius: 3,
        blurRadius: 5,
        color: Colors.grey.shade300,
        blurStyle: BlurStyle.outer,
      ),
    ],
  );
}