import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/exceptions/auth_exceptions.dart';
import '../../data/repositories/auth/auth_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AuthRepository authRepository;

  SettingsBloc({required this.authRepository}) : super(InitialState()) {
    on<AccountDeletionRequested>(_onAccountDeletionRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onAccountDeletionRequested(AccountDeletionRequested event, Emitter<SettingsState> emit) async {
    try {
      await authRepository.deleteAccount();
      emit(DeleteAccountSuccessState());
    } on AccountDeletionFailure catch (e) {
      emit(DeleteAccountFailureState(errorMessage: e.message));
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<SettingsState> emit) async {
    try {
      await authRepository.signOut();
      emit(LogoutSuccessState());
    } on LogOutFailure catch (e) {
      emit(LogoutFailureState(errorMessage: e.toString()));
    }
  }
}
