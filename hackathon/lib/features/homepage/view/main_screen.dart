import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'main_screen_body.dart';
part 'main_screen_bottom.dart';

// appBar: AppBar(
//   title: const Text('teamVBT'),
//   actions: [
//     IconButton(
//       icon: const Icon(Icons.exit_to_app),
//       onPressed: () async {
//         await _auth.signOut();
//         Navigator.of(context)
//             .pushReplacementNamed(LandingScreen.routeName);
//       },
//     ),
//   ],
// ),
class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreenBody(),
    );
  }
}
