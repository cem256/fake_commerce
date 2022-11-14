part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(FormStatus.initial) FormStatus status,
    @Default('') String email,
    bool? isValidEmail,
    @Default('') String password,
    bool? isValidPassword,
    @Default(true) bool isPasswordObscured,
    String? errorMessage,
  }) = _RegisterState;
}
