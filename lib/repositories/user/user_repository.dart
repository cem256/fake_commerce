import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user/user_model.dart';
import 'base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  UserRepository({required this.firebaseFirestore});

  final FirebaseFirestore firebaseFirestore;

  @override
  Stream<UserModel> getUser(String userId) {
    return firebaseFirestore.collection('users').doc(userId).snapshots().map((snap) => UserModel.fromSnapshot(snap));
  }

  @override
  Future<void> createUser(UserModel user) async {
    await firebaseFirestore.collection('users').doc(user.id).set(user.toDocument());
  }

  @override
  Future<void> updateUser(UserModel user) {
    return firebaseFirestore.collection('users').doc(user.id).update(user.toDocument());
  }
}
