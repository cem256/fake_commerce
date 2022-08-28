part of 'auth_bloc.dart';

class AuthUserChanged extends Equatable {
  final auth.User? user;

  const AuthUserChanged({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}
