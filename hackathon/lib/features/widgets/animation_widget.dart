// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class AnimationWidget extends StatelessWidget {
  int querterTurns;
  AnimationWidget({
    Key? key,
    required this.querterTurns,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: querterTurns,
      child: WaveWidget(
        config: CustomConfig(
          colors: [
            Colors.purpleAccent.shade100,
            Colors.purpleAccent.shade200,
            Colors.purpleAccent.shade400,
            Colors.white,
          ],
          durations: [11000, 11000, 10080, 16000],
          heightPercentages: [0.0, 0.04, 0.08, 0.12],
          blur: const MaskFilter.blur(BlurStyle.solid, 0),
        ),
        heightPercentange: 0.2,
        size: const Size(double.infinity, double.infinity),
      ),
    );
  }
}
