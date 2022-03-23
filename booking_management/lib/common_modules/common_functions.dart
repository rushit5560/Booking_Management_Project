import 'package:flutter/material.dart';

hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}