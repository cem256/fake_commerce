import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '/repositories/repositories.dart';
import '../../models/models.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthUserChanged, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  StreamSubscription<auth.User?>? _authUserSubscription;
  StreamSubscription<UserModel?>? _userSubscription;

  AuthBloc({required AuthRepository authRepository, required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AuthState.unknown()) {
    on<AuthUserChanged>(_onAuthUserChanged);

    _authUserSubscription = _authRepository.user.listen(
      (authUser) {
        if (authUser != null) {
          _userRepository.getUser(authUser.uid).listen((user) => add(AuthUserChanged(authUser: authUser, user: user)));
        } else {
          add(AuthUserChanged(authUser: authUser));
        }
      },
    );
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    event.authUser != null
        ? emit(AuthState.authenticated(authUser: event.authUser!, user: event.user!))
        : emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _authUserSubscription?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }
}
