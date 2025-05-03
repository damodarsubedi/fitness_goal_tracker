import 'package:flutter/material.dart';
import 'package:gym_goal_tracker/features/dashboard/presentation/dashboard_screen.dart';
import 'package:gym_goal_tracker/shared/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const DashboardScreen(),
    );
  }
}
