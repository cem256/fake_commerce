part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState({
    this.status = FormStatus.initial,
    this.password = "",
    this.isValidPassword,
    this.isPasswordObscured = true,
    this.errorMessage,
  });

  final FormStatus status;
  final String password;
  final bool? isValidPassword;
  final bool isPasswordObscured;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        status,
        password,
        isValidPassword,
        isPasswordObscured,
        isPasswordObscured,
        errorMessage,
      ];

  ChangePasswordState copyWith({
    FormStatus? status,
    String? password,
    bool? isValidPassword,
    bool? isPasswordObscured,
    String? errorMessage,
  }) {
    return ChangePasswordState(
      status: status ?? this.status,
      password: password ?? this.password,
      isValidPassword: isValidPassword ?? this.isValidPassword,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
