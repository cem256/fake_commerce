import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/user/user_model.dart';

// converts firebase user to UserModel
extension ToUserModelExtension on User? {
  UserModel get toUserModel {
    return this == null
        ? UserModel.empty
        : UserModel(
            uid: this!.uid,
            email: this!.email,
            displayName: this!.displayName,
            photoURL: this!.photoURL,
          );
  }
}
