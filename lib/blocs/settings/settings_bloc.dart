import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../constants/enums/form_status.dart';
import '../../core/utils/input_validator/input_validator.dart';
import '../../repositories/auth/auth_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AuthRepository authRepository;

  SettingsBloc({required this.authRepository}) : super(const SettingsState()) {
    on<AccountDeletionRequested>(_onAccountDeletionRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<ChangePasswordChanged>(_onPasswordChanged);
    on<ChangePasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<ChangePasswordSubmitted>(_onChangePasswordSubmitted);
  }

  Future<void> _onAccountDeletionRequested(AccountDeletionRequested event, Emitter<SettingsState> emit) async {
    try {
      await authRepository.deleteAccount();
      emit(const SettingsState(isDeletionSuccessful: true));
    } on AccountDeletionFailure catch (e) {
      emit(SettingsState(deletionError: e.message, isDeletionSuccessful: false));
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<SettingsState> emit) async {
    try {
      await authRepository.signOut();
      emit(const SettingsState(isLogoutSuccessful: true));
    } on LogOutFailure catch (e) {
      emit(SettingsState(logoutError: e.toString(), isLogoutSuccessful: false));
    }
  }

  void _onPasswordChanged(ChangePasswordChanged event, Emitter<SettingsState> emit) {
    InputValidator.checkPasswordValidity(event.password)
        ? emit(state.copyWith(password: event.password, isValidPassword: true))
        : emit(state.copyWith(password: event.password, isValidPassword: false));
  }

  void _onPasswordVisibilityChanged(ChangePasswordVisibilityChanged event, Emitter<SettingsState> emit) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> _onChangePasswordSubmitted(ChangePasswordSubmitted event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(status: FormStatus.submitting));
    try {
      await authRepository.updatePassword(newPassword: state.password);
      emit(state.copyWith(status: FormStatus.success));
      emit(state.copyWith(status: FormStatus.initial));
    } on UpdatePasswordFailure catch (e) {
      emit(state.copyWith(changePasswordErrorMessage: e.toString(), status: FormStatus.failure));
      emit(state.copyWith(status: FormStatus.initial));
    }
  }
}
