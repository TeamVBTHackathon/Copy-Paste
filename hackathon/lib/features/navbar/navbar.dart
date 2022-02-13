import 'package:flutter/material.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';
import 'package:hackathon/features/homepage/view/home_page_view.dart';
import 'package:hackathon/features/messanger/messanger_view.dart';
import 'package:hackathon/features/profile/view/profile_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePageView(),
    const MessangerView(),
    const ProfileView(),
  ];

  int _selectedIndex = 0;
  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemePurple.whiteColor,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: ThemePurple.whiteColor,
        onTap: onTap,
        currentIndex: _selectedIndex,
        selectedItemColor: ThemePurple.darkPurple,
        unselectedItemColor: ThemePurple.greyOpacityColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mesajlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My',
          ),
        ],
      ),
    );
  }
}
