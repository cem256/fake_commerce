part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initialState() = InitialState;
  const factory SettingsState.deleteAccountSuccessState() = DeleteAccountSuccessState;
  const factory SettingsState.deleteAccountFailureState({required String errorMessage}) = DeleteAccountFailureState;
  const factory SettingsState.logoutSuccessState() = LogoutSuccessState;
  const factory SettingsState.logoutFailureState({required String errorMessage}) = LogoutFailureState;
}
