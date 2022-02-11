part of login_view;

class LoginViewAnimation extends StatelessWidget {
  const LoginViewAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: WaveWidget(
        config: CustomConfig(
          colors: [
            Colors.orangeAccent,
            Colors.tealAccent,
            Colors.pinkAccent,
            Colors.deepPurpleAccent,
          ],
          durations: [35000, 11000, 10800, 6000],
          heightPercentages: [0.01, 0.02, 0.03, 0.1],
          blur: const MaskFilter.blur(BlurStyle.solid, 0),
        ),
        heightPercentange: 0.2,
        size: const Size(double.infinity, double.infinity),
      ),
    );
  }
}
