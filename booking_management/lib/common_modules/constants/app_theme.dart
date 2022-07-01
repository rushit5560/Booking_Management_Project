import 'package:flutter/material.dart';

ThemeData appThemeData() {
  MaterialColor blackPrimarySwatch = MaterialColor(
    0xFF000000, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Colors.black.withOpacity(0.05), //10%
      100: Colors.black.withOpacity(0.1), //20%
      200: Colors.black.withOpacity(0.2), //30%
      300: Colors.black.withOpacity(0.3), //40%
      400: Colors.black.withOpacity(0.4), //50%
      500: Colors.black.withOpacity(0.5), //60%
      600: Colors.black.withOpacity(0.6), //70%
      700: Colors.black.withOpacity(0.7), //80%
      800: Colors.black.withOpacity(0.8), //90%
      900: Colors.black.withOpacity(0.9), //100%
    },
  );

  return ThemeData(
    primarySwatch: blackPrimarySwatch,
    // checkboxTheme: CheckboxThemeData(
    //   checkColor: MaterialStateProperty.,
    // ),
  );
}
