import 'package:flutter/material.dart';

extension CustomWidgets on Widget {
  Widget commonAllSidePadding(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget commonSymmetricPadding({double horizontal = 0, double vertical = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget commonOnlyPadding(
      {double top = 0, double bottom = 0, double right = 0, double left = 0}) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, bottom: bottom, top: top),
      child: this,
    );
  }
}

extension CustomString on String {
  String wordCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
