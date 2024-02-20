import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "Country"),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "Province"),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "City"),
              obscureText: true,
            ),


            SizedBox(height: 20),
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
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}