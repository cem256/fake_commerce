part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initialState() = _InitialState;
  const factory SettingsState.deleteAccountSuccessState() = _DeleteAccountSuccessState;
  const factory SettingsState.deleteAccountFailureState({required String errorMessage}) = _DeleteAccountFailureState;
  const factory SettingsState.logoutSuccessState() = _LogoutSuccessState;
  const factory SettingsState.logoutFailureState({required String errorMessage}) = _LogoutFailureState;
}
