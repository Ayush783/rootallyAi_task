import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rootallyai_task/providers/toggle_form_provider.dart';
import 'package:rootallyai_task/providers/toggle_show_password.dart';
import 'package:rootallyai_task/ui/common/extensions.dart';
import 'package:rootallyai_task/ui/common/styles.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

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
                toggleForm.value ? SignupForm() : SigninForm(),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  width: size.width,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(toggleForm.value ? 'Sign Up' : 'Login'),
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

//login form widget
class SigninForm extends StatelessWidget {
  const SigninForm({
    Key? key,
    this.email,
    this.pass,
  }) : super(key: key);

  final TextEditingController? email;
  final TextEditingController? pass;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final togglePass = ref.watch(togglePassProvider);
      return Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: inputDecoration('Email address'),
            cursorColor: Colors.black,
            cursorHeight: 24,
            cursorRadius: Radius.circular(50),
            obscureText: true,
            style: textStyle1,
            controller: email,
          ),
          SizedBox(
            height: 16,
          ),
          Stack(
            children: [
              TextFormField(
                decoration: inputDecoration('Password'),
                cursorColor: Colors.black,
                cursorHeight: 24,
                cursorRadius: Radius.circular(50),
                obscureText: togglePass.value ? false : true,
                style: textStyle1,
                controller: pass,
              ),
              Positioned(
                right: 16,
                top: 12,
                bottom: 12,
                child: GestureDetector(
                  onTap: () {
                    ref.read(togglePassProvider).toggle();
                  },
                  child: Icon(togglePass.value
                      ? Icons.remove_red_eye_sharp
                      : Icons.remove_red_eye_outlined),
                ),
              ),
            ],
          ),
          TextButton(
            child: Text(
              'Forgot password?',
              style: textStyle1.copyWith(fontWeight: FontWeight.w600),
            ),
            onPressed: () {},
            style: buttonStyle2,
          ),
        ],
      ));
    });
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
    this.email,
    this.pass,
  }) : super(key: key);

  final TextEditingController? email;
  final TextEditingController? pass;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final togglePass = ref.watch(togglePassProvider);
      return Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: inputDecoration('Email address'),
            cursorColor: Colors.black,
            cursorHeight: 24,
            cursorRadius: Radius.circular(50),
            obscureText: true,
            style: textStyle1,
            controller: email,
          ),
          SizedBox(
            height: 16,
          ),
          Stack(
            children: [
              TextFormField(
                decoration: inputDecoration('Password'),
                cursorColor: Colors.black,
                cursorHeight: 24,
                cursorRadius: Radius.circular(50),
                obscureText: togglePass.value ? false : true,
                style: textStyle1,
                controller: pass,
              ),
              Positioned(
                right: 16,
                top: 12,
                bottom: 12,
                child: GestureDetector(
                  onTap: () {
                    ref.read(togglePassProvider).toggle();
                  },
                  child: Icon(togglePass.value
                      ? Icons.remove_red_eye_sharp
                      : Icons.remove_red_eye_outlined),
                ),
              ),
            ],
          ),
        ],
      ));
    });
  }
}
