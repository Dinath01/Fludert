<<<<<<< HEAD
=======
import 'package:fludert/assets/auth_txtfields.dart';
import 'package:fludert/assets/guest_log.dart';
import 'package:fludert/assets/sign_button.dart';
import 'package:fludert/assets/square_tile.dart';
>>>>>>> 1ec2fe7dbff4cf7df2d52443b5c4a402232f589c
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class LoginPage extends StatelessWidget {
<<<<<<< HEAD
=======
  LoginPage ({super.key});

  //text edditting controllers

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signInUser(){}

>>>>>>> 1ec2fe7dbff4cf7df2d52443b5c4a402232f589c
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
<<<<<<< HEAD
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeInUp(
                        duration: Duration(seconds: 1),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-1.png'))),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1200),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-2.png'))),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png'))),
                        ),
                      ),
                    ),
                    Positioned(
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Logo Image
                                Image.asset(
                                  'assets/images/logo.png',
                                  width: 150,
                                  height: 150,
                                ),
                                // Text below the logo
                                SizedBox(height: 10),
                                Text(
                                  "Welcome to Fludert",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1)))),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Username",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700])),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1900),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ])),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 2100),
                      child: buildButton("Guest Login"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 2200),
                      child: buildButton("Sign Up"),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 2300),
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1))),
                    ),
                  ],
                ),
              )
            ],
=======
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
>>>>>>> 1ec2fe7dbff4cf7df2d52443b5c4a402232f589c
          ),
        ),
      ),
    );
  }

  Widget buildButton(String text) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            colors: [Color.fromRGBO(143, 148, 251, 1), Color.fromRGBO(143, 148, 251, .6)]),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
