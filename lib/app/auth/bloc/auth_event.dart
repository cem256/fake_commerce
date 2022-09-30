part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.userChanged({required UserModel user}) = _UserChanged;
}
