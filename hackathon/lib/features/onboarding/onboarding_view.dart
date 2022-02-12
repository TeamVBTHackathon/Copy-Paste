import 'package:flutter/material.dart';
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
        description: "Team VBT",
        pathImage: "undraw_Inspiration.png",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );

    slides.add(
      Slide(
        description: "Team VBT",
        pathImage: "undraw_Inspiration.png",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );

    slides.add(
      Slide(
        description: "Team VBT",
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
      "Get Started",
      style: TextStyle(color: Color.fromRGBO(255, 110, 161, 1.0)),
    );
  }

  Widget renderSkipBtn() {
    return const Text(
      "Skip",
      style: TextStyle(color: Colors.black45),
    );
  }

  Widget renderNextBtn() {
    return const Text(
      "Next",
      style: TextStyle(color: Colors.black45),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      // Dot indicator
      colorDot: const Color(0x33D02090),
      colorActiveDot: const Color.fromRGBO(255, 110, 161, 1.0),
      sizeDot: 13.0,
      // Skip button
      renderSkipBtn: renderSkipBtn(),
      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      // Next button
      renderNextBtn: renderNextBtn(),
    );
  }
}
