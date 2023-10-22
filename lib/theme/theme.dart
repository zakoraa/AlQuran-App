import 'package:al_quran/theme/color.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData.light().copyWith(
      primaryColor: CustomColor.primaryColor,
      appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: CustomColor.primaryColor,
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: "Poppins")),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins"),
        bodyMedium: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins"),
        bodySmall:
            TextStyle(fontSize: 12, color: Colors.black, fontFamily: "Poppins"),
      ),
      iconTheme: const IconThemeData(color: Colors.grey, size: 30),
      shadowColor: CustomColor.shadowColor);
}
