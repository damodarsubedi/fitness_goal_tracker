import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF1A73E8);
  static const Color secondaryBlue = Color(0xFF03A9F4);
  static const Color darkBackground = Color(0xFF0D1119);
  static const Color surfaceDark = Color(0xFF181E27);
  static const Color softWhite = Color(0xFFF1F1F1);
  static const Color bluishWhite = Color(0xFFDDEBFF);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,
    primaryColor: primaryBlue,
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 14),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryBlue,
      secondary: secondaryBlue,
      surface: surfaceDark,
      onSurface: Colors.white,
    ),
  );
}
