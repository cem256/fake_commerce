part of 'change_password_bloc.dart';

@freezed
class ChangePasswordEvent with _$ChangePasswordEvent {
  const factory ChangePasswordEvent.passwordModified(password) = PasswordModified;
  const factory ChangePasswordEvent.changePasswordVisibilityChanged() = ChangePasswordVisibilityChanged;
  const factory ChangePasswordEvent.changePasswordSubmitted() = ChangePasswordSubmitted;
}
