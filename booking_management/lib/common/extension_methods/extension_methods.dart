import 'package:flutter/material.dart';

extension CustomWidgets on Widget {

  Widget commonAllSidePadding(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
}