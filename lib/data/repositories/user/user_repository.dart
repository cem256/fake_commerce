import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/exceptions/auth_exceptions.dart';
import '../../../core/extensions/firebase_user_extensions.dart';
import '../../models/user/user_model.dart';
import 'base_user_repository.dart';

class UserRepository implements BaseUserRepository {
  UserRepository({required this.firebaseAuth, required this.firebaseFirestore});

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  @override
  UserModel get currentUser => firebaseAuth.currentUser.toUserModel;

  @override
  Future<void> addUserDetails() async {
    try {
      await firebaseFirestore.collection('users').doc(currentUser.uid).set({
        'uid': currentUser.uid,
        'email': currentUser.email,
        'name': currentUser.displayName,
        'photo': currentUser.photoURL,
      });
    } catch (_) {
      throw AddUserDetailsFailure();
    }
  }

  @override
  Future<void> deleteUserDetails() async {
    try {
      await firebaseFirestore.collection('users').doc(currentUser.uid).delete();
    } catch (_) {
      throw DeleteUserDetailsFailure();
    }
  }
}
