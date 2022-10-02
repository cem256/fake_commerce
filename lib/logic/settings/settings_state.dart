part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends SettingsState {
  @override
  List<Object?> get props => [];
}

class DeleteAccountSuccessState extends SettingsState {
  @override
  List<Object?> get props => [];
}

class DeleteAccountFailureState extends SettingsState {
  DeleteAccountFailureState({required this.errorMessage});

  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}

class LogoutSuccessState extends SettingsState {
  @override
  List<Object?> get props => [];
}

class LogoutFailureState extends SettingsState {
  LogoutFailureState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
