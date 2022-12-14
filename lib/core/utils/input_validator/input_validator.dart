class InputValidator {
  static bool checkPasswordValidity(String password) {
    return password.trim().length > 5;
  }

  static bool checkEmailValidity(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.trim());
  }
}
