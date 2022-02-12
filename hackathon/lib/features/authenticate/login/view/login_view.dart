library login_view;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/features/authenticate/login/service/login_service.dart';
import 'package:hackathon/features/authenticate/login/view_model/login_view_model.dart';
import 'package:hackathon/features/authenticate/register/view/register_view.dart';
import 'package:hackathon/features/authenticate/widgets/animation_widget.dart';
import 'package:hackathon/features/authenticate/widgets/custom_text_form_field_widget.dart';

part 'parts/login_view_body.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static const routeName = '/login-page';
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimationWidget(
            querterTurns: 4,
          ),
          LoginViewBody(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RegisterView.routeName);
                  },
                  child: const Text(
                    'Create an account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
