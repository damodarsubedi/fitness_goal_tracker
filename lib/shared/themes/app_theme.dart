import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0D1119), // Even darker bluish background
    primaryColor: const Color(0xFF1A73E8), // Main theme color (blue)
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
        backgroundColor: Color(0xFF1A73E8), // Button color matches the primary color
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF1A73E8), // Main theme color (blue)
      secondary: const Color(0xFF03A9F4), // Accent color (lighter blue)
      surface: const Color(0xFF181E27), // Darker bluish surface color
      onSurface: Colors.white, // Text color on surfaces (light text on dark surfaces)
    ),
  );
}
