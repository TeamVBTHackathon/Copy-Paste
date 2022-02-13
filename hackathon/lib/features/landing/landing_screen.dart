import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';
import 'package:hackathon/features/authenticate/login/view/login_view.dart';
import 'package:hackathon/features/authenticate/register/view/register_view.dart';
import 'package:hackathon/features/landing/service/global_methods.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  static const routeName = '/landing-screen';

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalMethods _globalMethods = GlobalMethods();
  bool _isLoading = false;

  void _signInAnon() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInAnonymously().then(
          (value) => Navigator.canPop(context) ? Navigator.pop(context) : null);
    } catch (error) {
      _globalMethods.authDialog(context, error.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();

    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final authResult = await _auth.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
        } catch (e) {
          _globalMethods.authDialog(context, e.toString());
        }
      }
    }
  }

  final List<String> _images = [
    'asset/images/landing1.png',
    'asset/images/landing2.png',
  ];

  @override
  void initState() {
    _images.shuffle();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            _images[0],
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          ),
        ),
        headlines(),
        body(context),
      ],
    ));
  }

  body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        buttonRow1(context),
        const SizedBox(height: 20),
      ],
    );
  }

  buttonRow1(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: loginButton(context),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: registerButton(context),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  registerButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ThemePurple.darkPurple,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(RegisterView.routeName);
      },
      child:
          const Text('Kayıt', style: TextStyle(color: ThemePurple.whiteColor)),
    );
  }

  loginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ThemePurple.darkPurple,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(LoginView.routeName);
      },
      child:
          const Text('Giriş', style: TextStyle(color: ThemePurple.whiteColor)),
    );
  }

  headlines() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        SizedBox(
          height: 100,
        ),
        Center(
          child: Text(
            "Event App' e",
            style: TextStyle(fontSize: 45, color: ThemePurple.whiteColor),
          ),
        ),
        Center(
          child: Text(
            'Hoşgeldiniz',
            style: TextStyle(fontSize: 65, color: ThemePurple.whiteColor),
          ),
        ),
      ],
    );
  }
}
