part of 'auth_bloc.dart';

class AuthUserChanged extends Equatable {
  final auth.User? authUser;
  final UserModel? user;

  const AuthUserChanged({
    required this.authUser,
    this.user,
  });

  @override
  List<Object?> get props => [authUser, user];
}
