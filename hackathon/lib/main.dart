import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/core/init/theme/theme.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';
import 'package:hackathon/features/authenticate/auth_screen.dart';
import 'package:hackathon/features/authenticate/login/view/login_view.dart';
import 'package:hackathon/features/authenticate/register/register_screen.dart';
import 'package:hackathon/features/authenticate/register/view/register_view.dart';
import 'package:hackathon/features/landing/landing_screen.dart';
import 'package:hackathon/features/navbar/navbar.dart';
import 'package:hackathon/features/onboarding/onboarding_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemePurple().theme,
      debugShowCheckedModeBanner: false,
      home: RegisterView(),
      // initialRoute: '/',
      // routes: {
      //   LoginView.routeName: (ctx) => const LoginView(),
      //   RegisterScreen.routeName: (ctx) => const RegisterScreen(),
      //   LandingScreen.routeName: (ctx) => const LandingScreen(),
      // },
    );
  }
}
