import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rootallyai_task/providers/toggle_form_provider.dart';
import 'package:rootallyai_task/providers/toggle_show_password.dart';
import 'package:rootallyai_task/ui/auth/widgets/login_form.dart';
import 'package:rootallyai_task/ui/auth/widgets/signup_form.dart';
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
