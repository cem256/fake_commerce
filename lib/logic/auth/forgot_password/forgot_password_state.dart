part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(FormStatus.initial) FormStatus status,
    @Default('') String email,
    bool? isValidEmail,
    String? errorMessage,
  }) = _ForgotPasswordState;
}
