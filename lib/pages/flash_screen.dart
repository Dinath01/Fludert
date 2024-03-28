import 'package:fludert/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'home_page.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                LottieBuilder.asset("assets/Animation - 1711599032677.json"),
                Text(
                  'Fludert',
                  style: TextStyle(
                    fontSize: 44,
                    fontFamily: 'Jura',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              ] 
          )
        )
      ],
      ), nextScreen: LoginPage(),
      splashIconSize: 400,
      backgroundColor: Color.fromRGBO(152, 35, 242, 1),
    );
  }
}