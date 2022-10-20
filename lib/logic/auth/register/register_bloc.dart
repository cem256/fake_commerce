import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/form_status.dart';
import '../../../../core/exceptions/auth_exceptions.dart';
import '../../../../core/utils/input_validator/input_validator.dart';
import '../../../data/repositories/auth/base_auth_repository.dart';
import '../../../data/repositories/user/base_user_repository.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final BaseAuthRepository authRepository;
  final BaseUserRepository userRepository;

  RegisterBloc({required this.authRepository, required this.userRepository}) : super(const RegisterState()) {
    on<_EmailChanged>(_onEmailChanged);
    on<_PasswordChanged>(_onPasswordChanged);
    on<_PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<_RegisterSubmitted>(_onRegisterSubmitted);
    on<_RegisterWithGooglePressed>(_onRegisterWithGoogleSubmitted);
  }

  void _onEmailChanged(_EmailChanged event, Emitter<RegisterState> emit) {
    InputValidator.checkEmailValidity(event.email)
        ? emit(state.copyWith(email: event.email, isValidEmail: true))
        : emit(state.copyWith(email: event.email, isValidEmail: false));
  }

  void _onPasswordChanged(_PasswordChanged event, Emitter<RegisterState> emit) {
    InputValidator.checkPasswordValidity(event.password)
        ? emit(state.copyWith(password: event.password, isValidPassword: true))
        : emit(state.copyWith(password: event.password, isValidPassword: false));
  }

  void _onPasswordVisibilityChanged(_PasswordVisibilityChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> _onRegisterSubmitted(_RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: FormStatus.submitting));
    try {
      // signInWithEmailAndPassword then create user in firestore database
      await authRepository.createUserWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      await userRepository.addUserDetails();
      emit(state.copyWith(status: FormStatus.success));
      emit(state.copyWith(status: FormStatus.initial));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: FormStatus.failure));
      emit(state.copyWith(status: FormStatus.initial));
    } on AddUserDetailsFailure catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: FormStatus.failure));
      emit(state.copyWith(status: FormStatus.initial));
    }
  }

  Future<void> _onRegisterWithGoogleSubmitted(_RegisterWithGooglePressed event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: FormStatus.submitting));

    try {
      // signInWithGoogle then create user in firestore database
      await authRepository.logInWithGoogle();
      await userRepository.addUserDetails();
      emit(state.copyWith(status: FormStatus.success));
      emit(state.copyWith(status: FormStatus.initial));
    } on LogInWithGoogleFailure catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: FormStatus.failure));
      emit(state.copyWith(status: FormStatus.initial));
    } on AddUserDetailsFailure catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: FormStatus.failure));
      emit(state.copyWith(status: FormStatus.initial));
    }
  }
}
