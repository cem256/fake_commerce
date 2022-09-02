part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class AccountDeletionRequested extends SettingsEvent {}

class LogoutRequested extends SettingsEvent {}

class ChangePasswordChanged extends SettingsEvent {
  const ChangePasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class ChangePasswordVisibilityChanged extends SettingsEvent {}

class ChangePasswordSubmitted extends SettingsEvent {}
