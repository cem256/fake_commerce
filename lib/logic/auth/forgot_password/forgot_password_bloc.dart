import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/exceptions/auth_exceptions.dart';
import '../../../../core/utils/input_validator/input_validator.dart';
import '../../../core/enums/form_status.dart';
import '../../../data/repositories/auth/base_auth_repository.dart';

part 'forgot_password_bloc.freezed.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({required this.authRepository}) : super(const ForgotPasswordState()) {
    on<_EmailChanged>(_onEmailChanged);
    on<_PasswordSubmitted>(_onPasswordSubmitted);
  }
  final BaseAuthRepository authRepository;

  void _onEmailChanged(_EmailChanged event, Emitter<ForgotPasswordState> emit) {
    InputValidator.checkEmailValidity(event.email)
        ? emit(state.copyWith(email: event.email, isValidEmail: true))
        : emit(state.copyWith(email: event.email, isValidEmail: false));
  }

  Future<void> _onPasswordSubmitted(
    _PasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
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
