import 'package:flutter/material.dart';
import 'package:hackathon/features/authenticate/login/view/login_view.dart';
import 'package:hackathon/features/homepage/view/home_page_view.dart';

import 'package:hackathon/core/constants/strings/onboarding_strings.dart';
import 'package:hackathon/features/landing/landing_screen.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        description: OnboardingStrings.desciption1,
        pathImage: "asset/images/undraw1.png",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
    slides.add(
      Slide(
        description: OnboardingStrings.desciption2,
        pathImage: "asset/images/undraw2.png",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
    slides.add(
      Slide(
        description: OnboardingStrings.desciption3,
        pathImage: "asset/images/undraw3.png",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
    slides.add(
      Slide(
        description: OnboardingStrings.desciption4,
        pathImage: "asset/images/undraw4.png",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
  }

  void onDonePress() {
    Navigator.pushNamed(context, LandingScreen.routeName);
  }

  Widget renderDoneBtn() {
    return const Text(
      OnboardingStrings.buttonDone,
      style: TextStyle(color: Color.fromRGBO(255, 110, 161, 1.0)),
    );
  }

  Widget renderSkipBtn() {
    return const Text(
      OnboardingStrings.buttonSkip,
      style: TextStyle(color: Colors.black45),
    );
  }

  Widget renderNextBtn() {
    return const Text(
      OnboardingStrings.buttonNext,
      style: TextStyle(color: Colors.black45),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      colorDot: const Color(0x33D02090), //degisecek
      colorActiveDot: const Color.fromRGBO(255, 110, 161, 1.0), //degisecek
      sizeDot: 13.0,
      renderSkipBtn: renderSkipBtn(),
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      renderNextBtn: renderNextBtn(),
    );
  }
}
