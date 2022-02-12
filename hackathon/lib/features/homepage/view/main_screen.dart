import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/core/constants/Size/home_page_size_constants.dart';
import 'package:hackathon/core/constants/icon/homepage_icon_constants.dart';
import 'package:hackathon/core/constants/padding/home_page_padding.dart';
import 'package:hackathon/core/constants/radius/home_page_radius.dart';
import 'package:hackathon/core/constants/strings/homepage_strings.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';

part 'main_screen_body.dart';
part 'main_screen_bottom.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  static const routeName = '/main_screen';
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainScreenBody(),
    );
  }
}
