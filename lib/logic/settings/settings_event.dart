part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.accountDeletionRequested() = AccountDeletionRequested;
  const factory SettingsEvent.logoutRequested() = LogoutRequested;
}
