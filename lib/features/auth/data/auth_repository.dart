import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_goal_tracker/core/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Stream<User?> authChanges() => _authService.authStateChanges;

  Future<User?> login(String email, String password) async {
    final credential = await _authService.signIn(email, password);
    return credential.user;
  }

  Future<User?> signup(String email, String password) async {
    final credential = await _authService.signUp(email, password);
    return credential.user;
  }

  Future<void> logout() => _authService.signOut();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final service = ref.watch(authServiceProvider);
  return AuthRepository(service);
});
