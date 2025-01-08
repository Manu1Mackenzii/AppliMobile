import 'package:flutter/material.dart';
import 'package:freemusic/ui/homepage/home_page_background.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:freemusic/pages/home_page.dart';

import '../pages/profileScreen.dart';
import '../pages/welcome.dart';

import '../pages/chats_screen.dart';
import '../ui/homepage/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[


    UserProfilePage(),

    ChatsScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: MotionTabBar(
        labels: const ["Accueil", "Profil", "Créer", "Messages"],
        initialSelectedTab: "Accueil",
        tabIconColor: Colors.black,
        tabSelectedColor: Colors.green[500],
        icons: const [Icons.home, Icons.person, Icons.add, Icons.message],
        textStyle: const TextStyle(color: Colors.black),
        onTabItemSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
