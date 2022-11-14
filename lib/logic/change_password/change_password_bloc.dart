import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/exceptions/auth_exceptions.dart';
import '../../../core/utils/input_validator/input_validator.dart';
import '../../core/enums/form_status.dart';
import '../../data/repositories/auth/base_auth_repository.dart';

part 'change_password_bloc.freezed.dart';
part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({required this.authRepository}) : super(const ChangePasswordState()) {
    on<_PasswordModified>(_onPasswordChanged);
    on<_PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<_ChangePasswordSubmitted>(_onChangePasswordSubmitted);
  }
  final BaseAuthRepository authRepository;

  void _onPasswordChanged(_PasswordModified event, Emitter<ChangePasswordState> emit) {
    InputValidator.checkPasswordValidity(event.password)
        ? emit(state.copyWith(password: event.password, isValidPassword: true))
        : emit(state.copyWith(password: event.password, isValidPassword: false));
  }

  void _onPasswordVisibilityChanged(_PasswordVisibilityChanged event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> _onChangePasswordSubmitted(_ChangePasswordSubmitted event, Emitter<ChangePasswordState> emit) async {
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
