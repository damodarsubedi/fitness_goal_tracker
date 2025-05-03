import 'package:go_router/go_router.dart';
import 'package:gym_goal_tracker/features/auth/presentation/login_screen.dart';
import 'package:gym_goal_tracker/features/auth/presentation/signup_screen.dart';
import 'package:gym_goal_tracker/features/dashboard/presentation/dashboard_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login', // Default starting page
  routes: [
    // Authentication Routes
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),

    // Dashboard Route
    GoRoute(path: '/dashboard', builder: (context, state) => const DashboardScreen()),
  ],
);
