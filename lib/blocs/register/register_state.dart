part of 'register_bloc.dart';

enum RegisterStatus { initial, submitting, success, failure }

class RegisterState extends Equatable {
  final RegisterStatus status;
  final String email;
  final bool? isValidEmail;
  final String password;
  final bool? isValidPassword;
  final bool isPasswordObscured;
  final auth.User? user;

  const RegisterState({
    this.status = RegisterStatus.initial,
    this.email = "",
    this.isValidEmail,
    this.password = "",
    this.isValidPassword,
    this.isPasswordObscured = true,
    this.user,
  });

  @override
  List<Object?> get props => [
        status,
        email,
        isValidEmail,
        password,
        isValidPassword,
        isPasswordObscured,
        user,
      ];

  RegisterState copyWith({
    RegisterStatus? status,
    String? email,
    bool? isValidEmail,
    String? password,
    bool? isValidPassword,
    bool? isPasswordObscured,
    auth.User? user,
  }) {
    return RegisterState(
      status: status ?? this.status,
      email: email ?? this.email,
      isValidEmail: isValidEmail ?? this.isValidEmail,
      password: password ?? this.password,
      isValidPassword: isValidPassword ?? this.isValidPassword,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      user: user ?? this.user,
    );
  }
}
