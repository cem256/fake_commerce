import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/exceptions/auth_exceptions.dart';
import '../../data/repositories/auth/base_auth_repository.dart';
import '../../data/repositories/user/base_user_repository.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final BaseAuthRepository authRepository;
  final BaseUserRepository userRepository;

  SettingsBloc({required this.authRepository, required this.userRepository}) : super(const _$InitialState()) {
    on<AccountDeletionRequested>(_onAccountDeletionRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }
  Future<void> _onAccountDeletionRequested(AccountDeletionRequested event, Emitter<SettingsState> emit) async {
    try {
      await userRepository.deleteUserDetails();
      await authRepository.deleteAccount();

      emit(const DeleteAccountSuccessState());
    } on AccountDeletionFailure catch (e) {
      emit(DeleteAccountFailureState(errorMessage: e.message));
    } on DeleteUserDetailsFailure catch (e) {
      emit(DeleteAccountFailureState(errorMessage: e.message));
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<SettingsState> emit) async {
    try {
      await authRepository.signOut();
      emit(const LogoutSuccessState());
    } on LogOutFailure catch (e) {
      emit(LogoutFailureState(errorMessage: e.toString()));
    }
  }
}
