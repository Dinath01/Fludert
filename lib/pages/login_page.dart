import 'package:fludert/assets/auth_txtfields.dart';
import 'package:fludert/assets/guest_log.dart';
import 'package:fludert/assets/sign_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage ({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signInUser(){}

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Wallpaper I.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: Container(
          color: Colors.black.withOpacity(0.7),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),
          
                  Icon(
                    Icons.lock,
                    size: 100,
                  ),
          
                  const SizedBox(height: 50),
          
                  Text(
                    "Welcome To Fludert",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: 'UnderTheWeather',
                    ),
                  ),
          
                  const SizedBox(height: 25,),
          
                  AuthTxtField(
                    controller: usernameController,
                    hintText: "Username",
                    obscureText: false,
                  ),
          
                  const SizedBox(height: 10),
          
                  AuthTxtField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
          
                  const SizedBox(height: 10,),
          
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        )
                      ],
                    ),
                  ),
          
                  const SizedBox(height: 25),
          
                  SignButton(onTap: signInUser),
          
                  const SizedBox(height: 10,),
          
                  GuestLogButton(onTap: signInUser),
          
              
              ],),
            ),
          ),
        ),
      )
    );
  }
}