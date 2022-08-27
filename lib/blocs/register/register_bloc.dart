import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../repositories/auth/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc({required this.authRepository}) : super(const RegisterState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    checkEmailValidity(event.email)
        ? emit(state.copyWith(email: event.email, isValidEmail: true))
        : emit(state.copyWith(email: event.email, isValidEmail: false));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    event.password.length > 5
        ? emit(state.copyWith(password: event.password, isValidPassword: true))
        : emit(state.copyWith(password: event.password, isValidPassword: false));
  }

  void _onPasswordVisibilityChanged(PasswordVisibilityChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> _onRegisterSubmitted(RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStatus.submitting));
    try {
      var user = await authRepository.createUserWithEmailAndPassword(email: state.email, password: state.password);
      emit(state.copyWith(status: RegisterStatus.success, user: user));
    } catch (_) {
      emit(state.copyWith(status: RegisterStatus.failure));
      emit(state.copyWith(status: RegisterStatus.initial));
    }
  }

  bool checkEmailValidity(String email) {
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
  }
}
