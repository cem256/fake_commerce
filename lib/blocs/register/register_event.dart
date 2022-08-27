part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends RegisterEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends RegisterEvent {
  const PasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordVisibilityChanged extends RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {}
