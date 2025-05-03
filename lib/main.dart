import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_goal_tracker/app.dart';
import 'package:gym_goal_tracker/core/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final container = ProviderContainer();
  final notificationService = container.read(notificationServiceProvider);
  await notificationService.init();

  runApp(UncontrolledProviderScope(container: container, child: MyApp()));
}
