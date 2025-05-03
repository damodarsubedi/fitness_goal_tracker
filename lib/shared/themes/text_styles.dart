import 'package:flutter/material.dart';
import 'package:gym_goal_tracker/core/constants/colors.dart';

class AppTextStyles {
  static const TextStyle titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.bluishWhite,
  );

  static const TextStyle bodyMedium = TextStyle(fontSize: 14, color: AppColors.softWhite);

  static const TextStyle headlineLarge = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white);

  static const TextStyle greetingText = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey);

  static const TextStyle labelSmall = TextStyle(fontSize: 12, color: Colors.grey);
}
