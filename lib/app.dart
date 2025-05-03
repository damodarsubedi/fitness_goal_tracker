import 'package:flutter/material.dart';
import 'package:gym_goal_tracker/routing/app_router.dart';
import 'package:gym_goal_tracker/shared/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Gym Goal Tracker', routerConfig: appRouter, theme: AppTheme.darkTheme);
  }
}
