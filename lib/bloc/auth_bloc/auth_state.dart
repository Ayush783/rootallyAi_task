part of 'auth_bloc.dart';

//various states to update the ui respectively
@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthStarted extends AuthState {}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}

class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess(this.user);
}

class EmailVerificationSent extends AuthState {}

class ForgotPassLinkSending extends AuthState {}

class ForgotPassLinkSent extends AuthState {}

class ResettingPass extends AuthState {}

class PasswordReset extends AuthState {}
