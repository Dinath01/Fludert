import 'package:fludert/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:rive/rive.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 300, // Adjust width as needed
                  height: 300, // Adjust height as needed
                  child: RiveAnimation.asset(
                    'assets/images/logo.riv',
                  ),
                ),
                Text(
                  'Fludert',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Medium',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    letterSpacing: 5.0,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(1),
                        offset: Offset(3.0, 3.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      nextScreen: LoginPage(),
      splashIconSize: 400,
      backgroundColor:  Color.fromRGBO(143, 148, 251, 1),
    );
  }
}
