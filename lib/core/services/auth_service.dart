import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_goal_tracker/core/services/firebase_service.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseError(e);
    }
  }

  Future<UserCredential> signUp(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseError(e);
    }
  }

  Future<void> signOut() => _auth.signOut();

  String _mapFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'invalid-credential':
        return 'Login credential is invalid or has expired.';
      default:
        return 'Authentication error: ${e.message}';
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return AuthService(auth);
});
