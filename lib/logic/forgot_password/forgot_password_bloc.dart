import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/enums/form_status.dart';
import '../../core/utils/input_validator/input_validator.dart';
import '../../data/repositories/auth/auth_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository authRepository;

  ForgotPasswordBloc({required this.authRepository}) : super(const ForgotPasswordState()) {
    on<ForgotPasswordEmailChanged>(_onForgotPasswordEmailChanged);
    on<ForgotPasswordSubmitted>(_onForgotPasswordSubmitted);
  }

  void _onForgotPasswordEmailChanged(ForgotPasswordEmailChanged event, Emitter<ForgotPasswordState> emit) {
    InputValidator.checkEmailValidity(event.email)
        ? emit(state.copyWith(email: event.email, isValidEmail: true))
        : emit(state.copyWith(email: event.email, isValidEmail: false));
  }

  Future<void> _onForgotPasswordSubmitted(ForgotPasswordSubmitted event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(status: FormStatus.submitting));
    try {
      await authRepository.sendPasswordResetEmail(email: state.email);
      emit(state.copyWith(status: FormStatus.success));
      emit(state.copyWith(status: FormStatus.initial));
    } on PasswordResetFailure catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: FormStatus.failure));
      emit(state.copyWith(status: FormStatus.initial));
    }
  }
}
