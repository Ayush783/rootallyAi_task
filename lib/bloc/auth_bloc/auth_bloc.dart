import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:rootallyai_task/services/auth/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService = AuthService();
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      //event for sign up
      if (event is SignupEvent) {
        emit(AuthStarted());
        final userModel =
            await _authService.signUp(email: event.email, password: event.pass);

        if (userModel.error)
          emit(AuthFailure(userModel.errorMessage));
        else {
          await _authService.verifyEmail();
          emit(EmailVerificationSent());
          add(SignOut());
        }
      }
      //event for sign in
      if (event is SigninEvent) {
        emit(AuthStarted());
        final userModel =
            await _authService.signIn(email: event.email, password: event.pass);
        if (userModel.error)
          emit(AuthFailure(userModel.errorMessage));
        else
          emit(AuthSuccess(userModel.user));
      }
      //event for sign out
      if (event is SignOut) {
        await _authService.signout();
      }
      //event for forgot password
      if (event is ForgotPassword) {
        emit(ForgotPassLinkSending());
        await _authService.forgotPassword(email: event.email);
        emit(ForgotPassLinkSent());
      }
      //event for resetting password
      if (event is ResetPassword) {
        emit(ResettingPass());
        await _authService.resetPassword(
            code: event.code, newPassword: event.newPassword);
        emit(PasswordReset());
      }
    });
  }
}
