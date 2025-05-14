import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_goal_tracker/routing/app_router.dart';
import 'package:gym_goal_tracker/shared/themes/app_theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(title: 'Gym Goal Tracker', routerConfig: router, theme: AppTheme.darkTheme);
  }
}
