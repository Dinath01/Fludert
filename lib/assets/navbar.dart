import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Navbar extends StatefulWidget {
  final Widget body;

  Navbar({required this.body});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.deepPurple.shade200,
        animationDuration: Duration(milliseconds: 300),
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.home,),
          Icon(Icons.add_alert,),
          Icon(Icons.diversity_2,),
          Icon(Icons.settings,),
          
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: widget.body,
    );
  }
}