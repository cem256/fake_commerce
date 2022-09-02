import '../../models/user/user_model.dart';

abstract class BaseAuthRepository {
  Stream<UserModel> get user;

  Future<void> logInWithGoogle();

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> updatePassword({
    required String newPassword,
  });

  Future<void> sendPasswordResetEmail({
    required String email,
  });

  Future<void> deleteAccount();

  Future<void> signOut();
}
