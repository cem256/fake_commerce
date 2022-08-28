part of 'auth_bloc.dart';

enum AuthStatus { unknown, unauthenticated, authenticated }

class AuthState extends Equatable {
  const AuthState._({this.status = AuthStatus.unknown, this.user});

  const AuthState.unknown() : this._();

  const AuthState.authenticated(UserModel user) : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated() : this._(status: AuthStatus.unauthenticated);

  final AuthStatus status;
  final UserModel? user;

  @override
  List<Object?> get props => [status, user];
}
