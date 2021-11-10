import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:rootallyai_task/models/user_model.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  //sign up
  Future<Usermodel> signUp(
      {@required String? email, @required String? password}) async {
    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      return Usermodel.success(userCred.user!);
    } catch (e) {
      return Usermodel.failure(e.toString());
    }
  }

  //sign in
  Future<Usermodel> signIn(
      {@required String? email, @required String? password}) async {
    try {
      final userCred = await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      final isVerified = checkEmailVerification(userCred.user!);
      if (isVerified)
        return Usermodel.success(userCred.user!);
      else
        return Usermodel.failure('Email not verified');
    } catch (e) {
      return Usermodel.failure(e.toString());
    }
  }

  // auth state changes
  Stream<User?> authStateChanges() async* {
    yield* _auth.authStateChanges();
  }

  //vsend link to verify email
  Future<void> verifyEmail() async {
    await _auth.currentUser?.sendEmailVerification();
  }

  bool checkEmailVerification(User? user) {
    final isVerified = user!.emailVerified;
    return isVerified;
  }

  //sign out
  Future<void> signout() async {
    await _auth.signOut();
  }
}
