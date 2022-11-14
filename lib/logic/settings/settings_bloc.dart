import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/exceptions/auth_exceptions.dart';
import '../../data/repositories/repositories.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required this.authRepository}) : super(const _InitialState()) {
    on<AccountDeletionRequested>(_onAccountDeletionRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }
  final BaseAuthRepository authRepository;

  Future<void> _onAccountDeletionRequested(AccountDeletionRequested event, Emitter<SettingsState> emit) async {
    try {
      await authRepository.deleteAccount();

      emit(const _DeleteAccountSuccessState());
    } on AccountDeletionFailure catch (e) {
      emit(_DeleteAccountFailureState(errorMessage: e.message));
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<SettingsState> emit) async {
    try {
      await authRepository.signOut();
      emit(const _LogoutSuccessState());
    } on LogOutFailure catch (e) {
      emit(_LogoutFailureState(errorMessage: e.toString()));
    }
  }
}
