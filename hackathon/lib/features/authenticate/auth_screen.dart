import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/features/homepage/view/home_page_view.dart';
import 'package:hackathon/features/landing/landing_screen.dart';

class AuthStateScreen extends StatelessWidget {
  const AuthStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return HomePageView();
          } else {
            return const LandingScreen();
          }
        } else if (snapshot.hasError) {
          return const Text('Error Occured');
        }
        return const LandingScreen();
      },
    );
  }
}
