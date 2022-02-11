library register_view;

import 'package:flutter/material.dart';
import 'package:hackathon/features/authenticate/widgets/animation_widget.dart';

part 'parts/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AnimationWidget(),
      ],
    );
  }
}
