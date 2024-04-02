import 'dart:ui';

import 'package:fludert/pages/home_page2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rive/rive.dart';

class SignUpData {
  String fullName;
  String email;
  String password;
  String country;
  String province;
  String city;

  SignUpData({
    required this.fullName,
    required this.email,
    required this.password,
    required this.country,
    required this.province,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'country': country,
      'province': province,
      'city': city,
    };
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  Future<void> _signUp() async {
    SignUpData signUpData = SignUpData(
      fullName: fullNameController.text,
      email: emailController.text,
      password: passwordController.text,
      country: countryController.text,
      province: provinceController.text,
      city: cityController.text,
    );

    // data fetch to backend
    try {
      final response = await http.post(
        Uri.parse('backend_url'),
        body: signUpData.toJson(),
      );

      // Handle response from backend
      if (response.statusCode == 200) {
        //handle for signup
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Signed Up Successfully!')));
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage2())));
      } else {
        //errors handle for sign fail
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to Sign Up.Please Try Again')));
      }
    } catch (error) {
      //errors handle
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Network or server error. Please try again later."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Sign Up",
          style: TextStyle(fontFamily: 'Medium'),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/images/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/images/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: fullNameController,
                  style: TextStyle(fontFamily: 'Medium'),
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    labelStyle: TextStyle(
                      fontFamily: 'Medium',
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(3.0, 3.0),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  style: TextStyle(fontFamily: 'Medium'),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontFamily: 'Medium',
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(3.0, 3.0),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  style: TextStyle(fontFamily: 'Medium'),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontFamily: 'Medium',
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(3.0, 3.0),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: countryController,
                  style: TextStyle(fontFamily: 'Medium'),
                  decoration: InputDecoration(
                    labelText: "Country",
                    labelStyle: TextStyle(
                      fontFamily: 'Medium',
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(3.0, 3.0),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: provinceController,
                  style: TextStyle(fontFamily: 'Medium'),
                  decoration: InputDecoration(
                    labelText: "Province",
                    labelStyle: TextStyle(
                      fontFamily: 'Medium',
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(3.0, 3.0),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: cityController,
                  style: TextStyle(fontFamily: 'Medium'),
                  decoration: InputDecoration(
                    labelText: "City",
                    labelStyle: TextStyle(
                      fontFamily: 'Medium',
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(3.0, 3.0),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: 'Medium',
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(3.0, 3.0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
