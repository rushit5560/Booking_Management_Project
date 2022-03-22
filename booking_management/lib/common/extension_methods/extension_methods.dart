import 'package:flutter/material.dart';

extension CustomWidgets on Widget {

  Widget commonAllSidePadding() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: this,
    );
  }
}