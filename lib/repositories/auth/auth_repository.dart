import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository({required this.firebaseAuth});

  final auth.FirebaseAuth firebaseAuth;

  @override
  Stream<auth.User?> get user => firebaseAuth.userChanges();

  @override
  Future<auth.User?> createUserWithEmailAndPassword({required String email, required String password}) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    return credential.user;
  }

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
