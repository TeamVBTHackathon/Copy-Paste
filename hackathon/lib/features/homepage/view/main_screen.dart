import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/core/constants/strings/homepage_strings.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';

part 'main_screen_body.dart';
part 'main_screen_bottom.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainScreenBody(),
    );
  }
}
