import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/enums/form_status.dart';
import '../../core/utils/input_validator/input_validator.dart';
import '../../data/repositories/auth/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc({required this.authRepository}) : super(const RegisterState()) {
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterPasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<RegisterSubmitted>(_onRegisterSubmitted);
    on<RegisterWithGooglePressed>(_onRegisterWithGoogleSubmitted);
  }

  void _onEmailChanged(RegisterEmailChanged event, Emitter<RegisterState> emit) {
    InputValidator.checkEmailValidity(event.email)
        ? emit(state.copyWith(email: event.email, isValidEmail: true))
        : emit(state.copyWith(email: event.email, isValidEmail: false));
  }

  void _onPasswordChanged(RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    InputValidator.checkPasswordValidity(event.password)
        ? emit(state.copyWith(password: event.password, isValidPassword: true))
        : emit(state.copyWith(password: event.password, isValidPassword: false));
  }

  void _onPasswordVisibilityChanged(RegisterPasswordVisibilityChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> _onRegisterSubmitted(RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: FormStatus.submitting));
    try {
      await authRepository.createUserWithEmailAndPassword(email: state.email, password: state.password);
      emit(state.copyWith(status: FormStatus.success));
      emit(state.copyWith(status: FormStatus.initial));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: FormStatus.failure));
      emit(state.copyWith(status: FormStatus.initial));
    }
  }

  Future<void> _onRegisterWithGoogleSubmitted(RegisterWithGooglePressed event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: FormStatus.submitting));

    try {
      await authRepository.logInWithGoogle();
      emit(state.copyWith(status: FormStatus.success));
      emit(state.copyWith(status: FormStatus.initial));
    } on LogInWithGoogleFailure catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: FormStatus.failure));
      emit(state.copyWith(status: FormStatus.initial));
    }
  }
}
