import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/user/user_model.dart';
import '../../../data/repositories/auth/base_auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BaseAuthRepository authRepository;
  late final StreamSubscription<UserModel> _userSubscription;

  AuthBloc({required this.authRepository}) : super(const _Unauthenticated()) {
    on<_UserChanged>(_onUserChanged);
    _userSubscription = authRepository.userStream.listen(
      (user) => add(_UserChanged(user: user)),
    );
  }
  void _onUserChanged(_UserChanged event, Emitter<AuthState> emit) {
    emit(event.user.isNotEmpty ? AuthState.authenticated(user: event.user) : const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
