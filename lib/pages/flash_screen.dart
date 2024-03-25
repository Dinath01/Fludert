import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'login_page.dart'; 

class FlashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.purple,
      splash: _buildFlashLogo(),
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      duration: 3000, 
    );
  }

  Widget _buildFlashLogo() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,



        
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/Logo.png'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Fludert',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}