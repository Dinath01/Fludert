import 'package:fludert/assets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      // body: Navbar(
      body: Container(
        color: Colors.white,
      ),
      // ),
      // bottomNavigationBar: Navbar(),
    );
  }
}
