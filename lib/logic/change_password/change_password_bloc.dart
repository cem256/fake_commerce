import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/enums/form_status.dart';
import '../../core/exceptions/auth_exceptions.dart';
import '../../core/utils/input_validator/input_validator.dart';
import '../../data/repositories/auth/auth_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final AuthRepository authRepository;
  ChangePasswordBloc({required this.authRepository}) : super(const ChangePasswordState()) {
    on<PasswordModified>(_onPasswordChanged);
    on<ChangePasswordVisibilityChanged>(_onChangePasswordVisibilityChanged);
    on<ChangePasswordSubmitted>(_onChangePasswordSubmitted);
  }

  void _onPasswordChanged(PasswordModified event, Emitter<ChangePasswordState> emit) {
    InputValidator.checkPasswordValidity(event.password)
        ? emit(state.copyWith(password: event.password, isValidPassword: true))
        : emit(state.copyWith(password: event.password, isValidPassword: false));
  }

  void _onChangePasswordVisibilityChanged(ChangePasswordVisibilityChanged event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> _onChangePasswordSubmitted(ChangePasswordSubmitted event, Emitter<ChangePasswordState> emit) async {
    try {
      await authRepository.updatePassword(newPassword: state.password);
      await authRepository.signOut();
      emit(state.copyWith(status: FormStatus.success));
    } on UpdatePasswordFailure catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: FormStatus.failure));
      emit(state.copyWith(status: FormStatus.initial));
    }
  }
}
