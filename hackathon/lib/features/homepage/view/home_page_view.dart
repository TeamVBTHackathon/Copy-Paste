library home_page_view;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/core/constants/Size/home_page_size_constants.dart';
import 'package:hackathon/core/constants/icon/homepage_icon_constants.dart';
import 'package:hackathon/core/constants/padding/home_page_padding.dart';
import 'package:hackathon/core/constants/radius/home_page_radius.dart';
import 'package:hackathon/core/constants/strings/homepage_strings.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';

part 'parts/homepage_view_body.dart';
part 'parts/homepage_view_bottom.dart';

<<<<<<< HEAD:hackathon/lib/features/homepage/view/home_page_view.dart
class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);
=======
class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  static const routeName = '/main_screen';
  
>>>>>>> b10c60be420e6544095d44425e8e6af36fbc6502:hackathon/lib/features/homepage/view/main_screen.dart
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageBody(),
    );
  }
}
