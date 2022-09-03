// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  final FormStatus status;
  final String email;
  final bool? isValidEmail;
  final String? errorMessage;

  const ForgotPasswordState({
    this.status = FormStatus.initial,
    this.email = "",
    this.isValidEmail,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        email,
        isValidEmail,
        errorMessage,
      ];

  ForgotPasswordState copyWith({
    FormStatus? status,
    String? email,
    bool? isValidEmail,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
      isValidEmail: isValidEmail ?? this.isValidEmail,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
