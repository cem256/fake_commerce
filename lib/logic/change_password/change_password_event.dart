part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PasswordModified extends ChangePasswordEvent {
  PasswordModified({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class ChangePasswordVisibilityChanged extends ChangePasswordEvent {}

class ChangePasswordSubmitted extends ChangePasswordEvent {}
