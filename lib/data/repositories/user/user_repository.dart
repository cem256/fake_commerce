import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/exceptions/auth_exceptions.dart';
import '../../models/user/user_model.dart';
import 'base_user_repository.dart';

class UserRepository implements BaseUserRepository {
  UserRepository({required this.firebaseFirestore, required this.firebaseAuth});

  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  UserModel get _currentUser => firebaseAuth.currentUser._toUser;

  @override
  Future<void> addUserDetails() async {
    try {
      await firebaseFirestore.collection('users').doc(_currentUser.uid).set({
        'uid': _currentUser.uid,
        'email': _currentUser.email,
        'name': _currentUser.displayName,
        'photo': _currentUser.photoURL,
      });
    } catch (_) {
      throw AddUserDetailsFailure();
    }
  }

  @override
  Future<void> deleteUserDetails() async {
    try {
      await firebaseFirestore.collection('users').doc(_currentUser.uid).delete();
    } catch (_) {
      throw DeleteUserDetailsFailure();
    }
  }
}

extension on User? {
  UserModel get _toUser {
    return this == null
        ? UserModel.empty
        : UserModel(uid: this!.uid, email: this!.email, displayName: this!.displayName, photoURL: this!.photoURL);
  }
}
