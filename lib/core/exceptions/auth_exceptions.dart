// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
class LogInWithGoogleFailure implements Exception {
  const LogInWithGoogleFailure([this.message = 'An unknown exception occurred.']);

  final String message;

  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
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

// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User/updatePassword.html
class UpdatePasswordFailure implements Exception {
  const UpdatePasswordFailure([this.message = 'An unknown exception occurred.']);

  final String message;

  factory UpdatePasswordFailure.fromCode(String code) {
    switch (code) {
      case 'weak-password':
        return const UpdatePasswordFailure(
          'Please enter a stronger password.',
        );
      case 'requires-recent-login':
        return const UpdatePasswordFailure(
          'Please login again to perform this action.',
        );

      default:
        return const UpdatePasswordFailure();
    }
  }
}

// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/sendPasswordResetEmail.html
class PasswordResetFailure implements Exception {
  const PasswordResetFailure([this.message = 'An unknown exception occurred.']);

  final String message;

  factory PasswordResetFailure.fromCode(String code) {
    switch (code) {
      case 'user-not-found':
        return const PasswordResetFailure(
          'Enter a valid email address.',
        );
      case 'invalid-email':
        return const PasswordResetFailure(
          'Email is not valid or badly formatted.',
        );
      default:
        return const PasswordResetFailure();
    }
  }
}

// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User/delete.html
class AccountDeletionFailure implements Exception {
  AccountDeletionFailure([this.message = 'An unknown exception occurred.']);

  final String message;

  factory AccountDeletionFailure.fromCode(String code) {
    switch (code) {
      case 'requires-recent-login':
        return AccountDeletionFailure(
          'Please login again to perform this action.',
        );
      default:
        return AccountDeletionFailure();
    }
  }
}

class AddUserDetailsFailure implements Exception {
  AddUserDetailsFailure([this.message = 'An error occured while creating user.']);
  final String message;
}

class LogOutFailure implements Exception {}
