import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rootallyai_task/bloc/auth_bloc/auth_bloc.dart';
import 'package:rootallyai_task/providers/toggle_form_provider.dart';
import 'package:rootallyai_task/providers/toggle_show_password.dart';
import 'package:rootallyai_task/ui/auth/widgets/login_form.dart';
import 'package:rootallyai_task/ui/auth/widgets/signup_form.dart';
import 'package:rootallyai_task/ui/common/styles.dart';
import 'package:rootallyai_task/ui/dashboard/dashboard.dart';

//auth screen ui code
class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, ref, child) {
        final toggleForm = ref.watch(toggleFormProvider);
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                SvgPicture.asset(
                  'assets/images/ac.svg',
                  height: size.height * 0.12,
                ),
                Row(
                  children: [
                    Text(
                      toggleForm.value ? 'Sign Up' : 'Sign In ',
                      style: textStyle2,
                    ),
                    SvgPicture.asset(
                      'assets/images/login.svg',
                      height: 32,
                      color: Color(0xff4e4e4e),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                toggleForm.value
                    ? SignupForm(
                        email: email,
                        pass: pass,
                      )
                    : SigninForm(
                        email: email,
                        pass: pass,
                      ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  width: size.width,
                  child: OutlinedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            toggleForm.value
                                ? SignupEvent(email.text, pass.text)
                                : SigninEvent(email.text, pass.text),
                          );
                    },
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthStarted)
                          return Container(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        else
                          return Text(
                            toggleForm.value ? 'Sign Up' : 'Login',
                            style: textStyle1.copyWith(
                                fontWeight: FontWeight.bold),
                          );
                      },
                    ),
                    style: buttonStyle,
                  ),
                ),
                TextButton(
                  child: Text(
                    toggleForm.value ? 'Have an account' : 'Create an account',
                    style: textStyle1.copyWith(fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    ref.read(toggleFormProvider).toggle();
                    email.clear();
                    pass.clear();
                    if (ref.watch(togglePassProvider).value == true)
                      ref.read(togglePassProvider).toggle();
                  },
                  style: buttonStyle2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//bloc listener to listen to bloc state for failure and success
class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure)
          //show a snackbar
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              color: Colors.red,
              child: Text(
                state.error,
                style: textStyle1.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          );
        else if (state is AuthSuccess)
          //navigate to dashboard is success
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Dashboard(),
          ));
        else if (state is EmailVerificationSent)
          //show a snackbar
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              color: Colors.green,
              child: Text(
                "Email verification link sent, please sign in again after verifying your email.",
                style: textStyle1.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          );
      },
      child: AuthScreen(),
    );
  }
}
