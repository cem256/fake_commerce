// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final String? deletionError;
  final bool? isDeletionSuccessful;
  final String? logoutError;
  final bool? isLogoutSuccessful;

  final FormStatus status;
  final String password;
  final bool? isValidPassword;
  final bool isPasswordObscured;
  final String? changePasswordErrorMessage;

  const SettingsState({
    this.deletionError,
    this.isDeletionSuccessful,
    this.logoutError,
    this.isLogoutSuccessful,
    this.status = FormStatus.initial,
    this.password = "",
    this.isValidPassword,
    this.isPasswordObscured = true,
    this.changePasswordErrorMessage,
  });

  @override
  List<Object?> get props => [
        deletionError,
        isDeletionSuccessful,
        logoutError,
        isLogoutSuccessful,
        status,
        password,
        isValidPassword,
        isPasswordObscured,
        changePasswordErrorMessage,
      ];

  SettingsState copyWith({
    FormStatus? status,
    String? password,
    bool? isValidPassword,
    bool? isPasswordObscured,
    String? changePasswordErrorMessage,
  }) {
    return SettingsState(
      status: status ?? this.status,
      password: password ?? this.password,
      isValidPassword: isValidPassword ?? this.isValidPassword,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      changePasswordErrorMessage: changePasswordErrorMessage ?? this.changePasswordErrorMessage,
    );
  }
}
