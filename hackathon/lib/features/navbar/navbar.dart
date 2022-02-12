import 'package:flutter/material.dart';
import 'package:hackathon/features/eventDetail/view/event_detail_view.dart';
import 'package:hackathon/features/homepage/view/home_page_view.dart';
import 'package:hackathon/features/messanger/messanger_view.dart';
import 'package:hackathon/features/profile/view/profile_view.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages = [
    MainScreen(),
    EventDetail(),
    MessangerView(),
    ProfileView(),
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
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: 'Bar',
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
