import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constants/padding/authenticate_padding.dart';
import '../../core/constants/strings/authenticate_strings.dart';
import '../../core/core/service/auth_methods.dart';
import '../../core/init/theme/theme_purple.dart';
import '../login/login_screen.dart';
import '../navbar/navbar.dart';
import '../utils/utils.dart';
import '../widgets/animation_widget.dart';
import '../widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/signup-screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    location.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void navigateToLoginScreen() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethod().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      location: location.text,
      name: nameController.text,
      file: _image!,
    );
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        AnimationWidget(querterTurns: 4),
        Container(
          padding: AuthenticatePadding.containerPadding,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              // svg image
              const SizedBox(height: 32),
              // circular widget to accept user input
              profilePhoto(),
              const SizedBox(height: 32),
              // text field input for email
              TextFieldInput(
                textEditingController: _emailController,
                hintText: AuthenticateStrings.emailString,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: AuthenticateStrings.passwordString,
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24),
              TextFieldInput(
                textEditingController: nameController,
                hintText: AuthenticateStrings.nameString,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 40,
              ),
              registerButton(),
              const SizedBox(
                height: 12,
              ),
              Flexible(child: Container(), flex: 2),
              // Textbuttons for login
              text()
            ],
          ),
        ),
      ],
    ));
  }

  text() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(AuthenticateStrings.question2),
          padding: AuthenticatePadding.textPadding,
        ),
        GestureDetector(
          onTap: navigateToLoginScreen,
          child: Container(
            child: Text(
              AuthenticateStrings.loginButton,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            padding: AuthenticatePadding.textPadding,
          ),
        ),
      ],
    );
  }

  registerButton() {
    return InkWell(
      onTap: signUpUser,
      child: Container(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: ThemePurple.darkPurple,
                ),
              )
            : Text(
                AuthenticateStrings.registerButton,
                style: const TextStyle(color: Colors.white),
              ),
        width: double.infinity,
        alignment: Alignment.center,
        padding: AuthenticatePadding.buttonPadding,
        decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            color: ThemePurple.darkPurple),
      ),
    );
  }

  profilePhoto() {
    return Stack(
      children: [
        _image != null
            ? CircleAvatar(
                radius: 64,
                backgroundImage: MemoryImage(_image!),
              )
            : const CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    "https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg"),
              ),
        Positioned(
          bottom: -10,
          left: 80,
          child: IconButton(
            onPressed: selectImage,
            icon: const Icon(Icons.add_a_photo),
          ),
        ),
      ],
    );
  }
}
