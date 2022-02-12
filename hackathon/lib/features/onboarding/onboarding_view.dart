import 'package:flutter/material.dart';
import 'package:hackathon/core/constants/strings/onboarding_strings.dart';
import 'package:hackathon/features/homepage/view/main_screen.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

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
        pathImage: "asset/images/undraw_Inspiration.png",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
    slides.add(
      Slide(
        description: OnboardingStrings.desciption2,
        pathImage: "undraw_Inspiration.png",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
    slides.add(
      Slide(
        description: OnboardingStrings.desciption3,
        pathImage: "undraw_Inspiration.png",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
    slides.add(
      Slide(
        description: OnboardingStrings.desciption4,
        pathImage: "undraw_Inspiration.png",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
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
