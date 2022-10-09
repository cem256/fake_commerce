part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginEmailChanged(String email) = LoginEmailChanged;
  const factory LoginEvent.passwordChanged(String password) = LoginPasswordChanged;
  const factory LoginEvent.passwordVisibilityChanged() = LoginPasswordVisibilityChanged;
  const factory LoginEvent.loginSubmitted() = LoginSubmitted;
  const factory LoginEvent.loginWithGooglePressed() = LoginWithGooglePressed;
}
