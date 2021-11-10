//login form widget
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rootallyai_task/providers/toggle_show_password.dart';
import 'package:rootallyai_task/ui/common/styles.dart';

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
