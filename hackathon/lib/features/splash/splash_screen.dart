import 'package:flutter/material.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';
import 'package:hackathon/features/onboarding/onboarding_view.dart';

import '../../core/constants/padding/splash_padding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String logoPATH = 'asset/images/logo.png';
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        OnBoardingView.routeName,
        (Route<dynamic> route) => false,
      );
    });
  }

// Text("Fluevent", style: Theme.of(context).textTheme.headline6),),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemePurple.darkPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 150,
              height: 150,
              child: Column(
                children: [
                  Image.asset(logoPATH),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: SplashPadding.splashPadding,
              child: Text("FluEvent",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: ThemePurple.whiteColor)),
            ),
          ),
        ],
      ),
    );
  }
}
