import '../../models/user/user_model.dart';

abstract class BaseAuthRepository {
  Stream<UserModel> get user;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
