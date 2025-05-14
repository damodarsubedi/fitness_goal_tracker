// auth_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_goal_tracker/features/auth/data/auth_repository.dart';
import 'package:gym_goal_tracker/features/auth/domain/auth_state.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthController(repo);
});

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository _repo;

  AuthController(this._repo) : super(AuthState.initial()) {
    _repo.authChanges().listen((user) {
      state = state.copyWith(user: user, isLoading: false);
    });
  }
  Stream<dynamic> get authChanges => _repo.authChanges();

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await _repo.login(email, password);
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> signup(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await _repo.signup(email, password);
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> logout() async {
    await _repo.logout();
    state = AuthState.initial();
  }
}
