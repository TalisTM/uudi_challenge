import 'package:flutter/material.dart';

class LightTheme {
  static const primaryColor = Color(0xFF00bee0);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
      centerTitle: true,
    ),
  );
}