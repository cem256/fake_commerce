import '../../models/user/user_model.dart';

abstract class BaseUserRepository {
  Stream<UserModel> getUser(String userId);
  Future<void> createUser(UserModel user);
  Future<void> updateUser(UserModel user);
}
