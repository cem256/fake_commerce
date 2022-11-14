part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(FormStatus.initial) FormStatus status,
    @Default('') String email,
    bool? isValidEmail,
    @Default('') String password,
    bool? isValidPassword,
    @Default(true) bool isPasswordObscured,
    String? errorMessage,
  }) = _LoginState;
}
