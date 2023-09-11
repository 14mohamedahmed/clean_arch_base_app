import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0277BD);
  static const Color secondaryColor = Color(0xFFF9A825);

  static ThemeData appLightTheme(context) => ThemeData(
        useMaterial3: true,
        focusColor: Colors.black,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        highlightColor: Colors.transparent,
        buttonTheme: ButtonThemeData(
          buttonColor: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
}
