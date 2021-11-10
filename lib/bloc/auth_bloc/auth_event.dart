part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignupEvent extends AuthEvent {
  final String email, pass;

  SignupEvent(this.email, this.pass);
}

class SigninEvent extends AuthEvent {
  final String email, pass;

  SigninEvent(this.email, this.pass);
}

class SignOut extends AuthEvent {}

class ForgotPassword extends AuthEvent {
  final String email;

  ForgotPassword(this.email);
}

class ResetPassword extends AuthEvent {
  final String code, newPassword;

  ResetPassword(this.code, this.newPassword);
}
