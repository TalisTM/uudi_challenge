import 'package:flutter/material.dart';

class LightTheme {
  static const primaryColor = Color(0xFFFD7014);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
  );
}