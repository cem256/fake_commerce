import '../../models/user/user_model.dart';

abstract class BaseUserRepository {
  UserModel get currentUser;
  Future<void> addUserDetails();
  Future<void> deleteUserDetails();
}
