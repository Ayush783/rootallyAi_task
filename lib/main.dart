import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rootallyai_task/ui/auth/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    runApp(
      ProviderScope(
        child: Rootally(),
      ),
    );
  } catch (e) {
    print(e);
  }
}

class Rootally extends StatelessWidget {
  const Rootally({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RootAlly',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SigninScreen(),
        ),
      ),
    );
  }
}
