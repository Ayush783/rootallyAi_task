import 'package:flutter_test/flutter_test.dart';
import 'package:rootallyai_task/models/user_model.dart';
import 'package:rootallyai_task/services/auth/auth_service.dart';

void main() {
  //test to check sign up endpoint
  test('Sign up test', () async {
    final AuthService _authService = AuthService();
    final Usermodel usermodel = await _authService.signUp(
        email: 'ayushc45xxx@gmail.com', password: '12345678');
    // expect(usermodel.error, false);
    expect(usermodel.errorMessage, 'none');
  });
  //test to check signin without veryfying email
  test('Sign in without verified email', () async {
    final AuthService _authService = AuthService();
    final Usermodel usermodel = await _authService.signIn(
        email: 'ayushc45xxx@gmail.com', password: '12345678');
    expect(usermodel.error, true);
    expect(usermodel.errorMessage, 'Email not verified');
  });
  // test to check signin after veryfying email
  // test('Sign in with verified email', () async {
  // final AuthService _authService = AuthService();
  // final Usermodel usermodel = await _authService.signIn(
  //     email: 'ayushc45xxx@gmail.com', password: '12345678');
  // expect(usermodel.error, false);
  // });
}
