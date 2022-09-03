// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final FormStatus status;
  final String email;
  final bool? isValidEmail;
  final String password;
  final bool? isValidPassword;
  final bool isPasswordObscured;
  final String? errorMessage;

  const RegisterState({
    this.status = FormStatus.initial,
    this.email = "",
    this.isValidEmail,
    this.password = "",
    this.isValidPassword,
    this.isPasswordObscured = true,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        email,
        isValidEmail,
        password,
        isValidPassword,
        isPasswordObscured,
        errorMessage,
      ];

  RegisterState copyWith({
    FormStatus? status,
    String? email,
    bool? isValidEmail,
    String? password,
    bool? isValidPassword,
    bool? isPasswordObscured,
    String? errorMessage,
  }) {
    return RegisterState(
      status: status ?? this.status,
      email: email ?? this.email,
      isValidEmail: isValidEmail ?? this.isValidEmail,
      password: password ?? this.password,
      isValidPassword: isValidPassword ?? this.isValidPassword,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
