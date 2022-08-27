import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository({required this.firebaseAuth});

  final auth.FirebaseAuth firebaseAuth;

  @override
  Stream<auth.User?> get user => firebaseAuth.userChanges();

  @override
  Future<auth.User?> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      return user;
    } on auth.FirebaseAuthException {
      rethrow;
    }
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
