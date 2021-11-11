import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rootallyai_task/services/auth/auth_service.dart';
import 'package:rootallyai_task/ui/auth/auth_screen.dart';
import 'package:rootallyai_task/ui/dashboard/dashboard.dart';

import 'bloc/auth_bloc/auth_bloc.dart';

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
  Rootally({Key? key}) : super(key: key);

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RootAlly',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: authService.checkUser()
              ? DatabaseBlocProvider(
                  userId: authService.getUser().uid,
                )
              : AuthBlocProvider(),
        ),
      ),
    );
  }
}

//provide bloc to auth screen and its descendants
class AuthBlocProvider extends StatelessWidget {
  const AuthBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: AuthBlocListener(),
    );
  }
}
