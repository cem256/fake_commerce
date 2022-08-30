import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../models/user/user_model.dart';
import 'base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository({required this.firebaseAuth});

  final firebase_auth.FirebaseAuth firebaseAuth;

  @override
  Stream<UserModel> get user {
    return firebaseAuth.authStateChanges().map(
      (firebaseUser) {
        return firebaseUser == null ? UserModel.empty : firebaseUser.toUser;
      },
    );
  }

  @override
  Future<void> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw PasswordResetFailure.fromCode(e.code);
    } catch (_) {
      throw const PasswordResetFailure();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  UserModel get toUser {
    return UserModel(id: uid, email: email, name: displayName, photo: photoURL);
  }
}

// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure([this.message = 'An unknown exception occurred.']);

  final String message;

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}

//https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([this.message = 'An unknown exception occurred.']);

  final String message;

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}

class PasswordResetFailure implements Exception {
  const PasswordResetFailure([this.message = 'An unknown exception occurred.']);

  final String message;

  factory PasswordResetFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const PasswordResetFailure(
          'Email is not valid or badly formatted.',
        );
      default:
        return const PasswordResetFailure();
    }
  }
}

class LogOutFailure implements Exception {}
