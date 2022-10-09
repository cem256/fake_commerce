part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.registerEmailChanged(String email) = RegisterEmailChanged;
  const factory RegisterEvent.registerPasswordChanged(String password) = RegisterPasswordChanged;
  const factory RegisterEvent.registerPasswordVisibilityChanged() = RegisterPasswordVisibilityChanged;
  const factory RegisterEvent.registerSubmitted() = RegisterSubmitted;
  const factory RegisterEvent.registerWithGooglePressed() = RegisterWithGooglePressed;
}
