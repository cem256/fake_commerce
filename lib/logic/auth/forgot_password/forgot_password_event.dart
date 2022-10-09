part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.forgotPasswordEmailChanged(String email) = ForgotPasswordEmailChanged;
  const factory ForgotPasswordEvent.forgotPasswordSubmitted() = ForgotPasswordSubmitted;
}
