import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../constants/enums/form_status.dart';
import '../../core/utils/input_validator/input_validator.dart';
import '../../repositories/auth/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    InputValidator.checkEmailValidity(event.email)
        ? emit(state.copyWith(email: event.email, isValidEmail: true))
        : emit(state.copyWith(email: event.email, isValidEmail: false));
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    InputValidator.checkPasswordValidity(event.password)
        ? emit(state.copyWith(password: event.password, isValidPassword: true))
        : emit(state.copyWith(password: event.password, isValidPassword: false));
  }

  void _onPasswordVisibilityChanged(LoginPasswordVisibilityChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: FormStatus.submitting));
    try {
      await authRepository.signInWithEmailAndPassword(email: state.email, password: state.password);
      emit(state.copyWith(status: FormStatus.success));
      emit(state.copyWith(status: FormStatus.initial));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: FormStatus.failure));
      emit(state.copyWith(status: FormStatus.initial));
    }
  }
}
