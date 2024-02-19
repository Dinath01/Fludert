import 'package:fludert/assets/auth_txtfields.dart';
import 'package:fludert/assets/guest_log.dart';
import 'package:fludert/assets/sign_button.dart';
import 'package:fludert/assets/square_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage ({super.key});

  //text edditting controllers

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // logo          
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
          
                  const SizedBox(height: 40),

                  // welcome text          
                  const Text(
                    "Welcome To Fludert",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: 'UnderTheWeather',
                    ),
                  ),
          
                  const SizedBox(height: 25,),

                  //user name text field
          
                  AuthTxtField(
                    controller: usernameController,
                    hintText: "Username",
                    obscureText: false,
                  ),
          
                  const SizedBox(height: 10),

                  //password text field
          
                  AuthTxtField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
          
                  const SizedBox(height: 10,),

                  //forgot password
          
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

                  //Signin button
          
                  SignButton(onTap: signInUser),
          
                  const SizedBox(height: 10,),

                  //Guest login
          
                  GuestLogButton(onTap: signInUser),

                  const SizedBox(height: 25,),

                  //or continue with google

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                    
                      ],
                    ),
                  ),

                  const SizedBox(height: 30,),

                  //Google logo
                  const SquareTile(imagePath: 'assets/google.png'),

                  const SizedBox(height: 30,),

                  //register now

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                      'Not a user?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4,),
                    const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    ],
                  ) 
                     
              
              ],),
            ),
          ),
        ),
      )
    );
  }
}