// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormStatus status;
  final String email;
  final bool? isValidEmail;
  final String password;
  final bool? isValidPassword;
  final bool isPasswordObscured;
  final auth.User? user;

  const LoginState(
      {this.status = FormStatus.initial,
      this.email = "",
      this.isValidEmail,
      this.password = "",
      this.isValidPassword,
      this.isPasswordObscured = true,
      this.user});

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

  LoginState copyWith({
    FormStatus? status,
    String? email,
    bool? isValidEmail,
    String? password,
    bool? isValidPassword,
    bool? isPasswordObscured,
    auth.User? user,
  }) {
    return LoginState(
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
