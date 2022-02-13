import 'package:flutter/material.dart';
import 'package:hackathon/core/core/service/auth_methods.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';
import 'package:hackathon/features/navbar/navbar.dart';
import 'package:hackathon/features/signup/signup_screen.dart';
import 'package:hackathon/features/utils/utils.dart';
import 'package:hackathon/features/widgets/animation_widget.dart';
import 'package:hackathon/features/widgets/text_field_input.dart';

import '../../core/constants/padding/authenticate_padding.dart';
import '../../core/constants/strings/authenticate_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethod().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    } else {
      //
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AnimationWidget(querterTurns: 4),
        Container(
          padding: AuthenticatePadding.containerPadding,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              logo(context),
              const SizedBox(height: 50),
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: AuthenticateStrings.emailString,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: AuthenticateStrings.passwordString,
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24),
              loginButton(),
              const SizedBox(
                height: 12,
              ),
              Flexible(child: Container(), flex: 2),
              text()
            ],
          ),
        ),
      ]),
    );
  }

  logo(BuildContext context) {
    return Container(
      width: context.width * 0.45,
      color: ThemePurple.transparentColor,
      child: Image.asset(
        "asset/images/logo.png",
        fit: BoxFit.fill,
      ),
    );
  }

  text() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(AuthenticateStrings.question),
          padding: AuthenticatePadding.textPadding,
        ),
        GestureDetector(
          onTap: navigateToSignUp,
          child: Container(
            child: Text(
              AuthenticateStrings.registerButton,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            padding: AuthenticatePadding.textPadding,
          ),
        ),
      ],
    );
  }

  loginButton() {
    return InkWell(
      onTap: loginUser,
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: ThemePurple.darkPurple,
              ),
            )
          : Container(
              child: Text(
                AuthenticateStrings.loginButton,
                style: const TextStyle(color: Colors.white),
              ),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                color: ThemePurple.darkPurple,
              ),
            ),
    );
  }
}
