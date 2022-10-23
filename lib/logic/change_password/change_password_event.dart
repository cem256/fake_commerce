part of 'change_password_bloc.dart';

@freezed
class ChangePasswordEvent with _$ChangePasswordEvent {
  const factory ChangePasswordEvent.passwordModified(String password) = _PasswordModified;
  const factory ChangePasswordEvent.passwordVisibilityChanged() = _PasswordVisibilityChanged;
  const factory ChangePasswordEvent.changePasswordSubmitted() = _ChangePasswordSubmitted;
}
