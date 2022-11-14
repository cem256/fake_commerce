part of 'change_password_bloc.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(FormStatus.initial) FormStatus status,
    @Default('') String password,
    bool? isValidPassword,
    @Default(true) bool isPasswordObscured,
    String? errorMessage,
  }) = _ChangePasswordState;
}
