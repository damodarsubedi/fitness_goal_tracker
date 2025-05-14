import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:gym_goal_tracker/features/auth/presentation/login_screen.dart';
import 'package:gym_goal_tracker/features/auth/presentation/signup_screen.dart';
import 'package:gym_goal_tracker/features/dashboard/presentation/dashboard_screen.dart';
import 'package:gym_goal_tracker/features/auth/presentation/auth_controller.dart';

// Needed for GoRouter with Riverpod
final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: GoRouterRefreshStream(ref.watch(authControllerProvider.notifier).authChanges),

    redirect: (context, state) {
      final loggedIn = authState.user != null;
      final loggingIn = state.uri.toString() == '/login' || state.uri.toString() == '/signup';

      if (!loggedIn) {
        return loggingIn ? null : '/login';
      }

      if (loggedIn && loggingIn) {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
      GoRoute(path: '/dashboard', builder: (context, state) => const DashboardScreen()),
    ],
  );
});

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
