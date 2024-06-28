import 'package:flutter/material.dart';

class FontSizes {
  static const extraSmall = 14.0;
  static const small = 16.0;
  static const standard = 18.0;
  static const large = 20.0;
  static const extraLarge = 24.0;
  static const doubleExtraLarge = 26.0;
}

ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    inputDecorationTheme:
        const InputDecorationTheme(labelStyle: TextStyle(color: Colors.blue)),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Color(0xff000000),
        ),
        titleSmall: TextStyle(
          color: Color(0xff000000),
        ),
        bodyMedium:
            TextStyle(color: Color(0xffEEEEEE), fontSize: FontSizes.small),
        bodySmall:
            TextStyle(color: Color(0xff000000), fontSize: FontSizes.small)),
    colorScheme: const ColorScheme.light(
        background: Colors.white,
        primary: Colors.blue,
        secondary: Color(0xFFE0E0E0)));

ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Color(0xffEEEEEE),
        ),
        titleSmall: TextStyle(
          color: Color(0xff000000),
        ),
        bodyMedium:
            TextStyle(color: Color(0xffEEEEEE), fontSize: FontSizes.small),
        bodySmall:
            TextStyle(color: Color(0xff000000), fontSize: FontSizes.small)),
    colorScheme: const ColorScheme.dark(
        background: Colors.black45,
        primary: Colors.blue,
        secondary: Color(0xFFE0E0E0)));
