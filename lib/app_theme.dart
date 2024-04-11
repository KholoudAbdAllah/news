import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xFF39A552);
  static Color navyColor = const Color(0xFF4F5A69);
  static Color greyColor = const Color(0xFF79828B);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color balckColor = const Color.fromARGB(255, 0, 0, 0);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: whiteColor,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: navyColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: whiteColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: navyColor,
      ),
    ),
  );
}
