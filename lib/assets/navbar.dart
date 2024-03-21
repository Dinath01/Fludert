import 'package:fludert/pages/collab_page.dart';
import 'package:fludert/pages/home_page.dart';
import 'package:fludert/pages/profile_screen.dart';
import 'package:fludert/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Navbar extends StatefulWidget {
  final Widget body;

  Navbar({required this.body});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final screens = [
    HomePage(),
    CollaboratorsPage(),
    ProfileScreen(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home,
      ),
      Icon(
        Icons.add_alert,
      ),
      Icon(
        Icons.person,
      ),
      Icon(
        Icons.settings,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.deepPurple.shade200,
          animationDuration: Duration(milliseconds: 300),
          key: _bottomNavigationKey,
          index: index,
          items: items,
          onTap: (currentIndex) {
            setState(() {
              index = currentIndex;
            });
          },
        ),
        // body: screens[index],
      ),
    );
  }
}
